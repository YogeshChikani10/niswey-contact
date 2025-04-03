$(document).ready(function() {

    // Form validation and submission
    $('#contactForm').validate({
        rules: {
            name: {
                required: true,
            },
            phone: {
                required: true,
                regex: /^\+?[0-9\s]+$/
            },
            email: {
                required: true,
                email: true
            },
            address: {
                required: true,
            }
        },
        messages: {
            name: "Please enter a valid name.",
            phone: "Please enter a valid phone number.",
            email: "Please enter a valid email address.",
            address: "Please enter a valid address."
        },
        errorClass: "is-invalid",
        validClass: "is-valid",
        errorElement: "div",
        highlight: function(element) {
            $(element).addClass("is-invalid").removeClass("is-valid");
        },
        unhighlight: function(element) {
            $(element).removeClass("is-invalid").addClass("is-valid");
        },
        errorPlacement: function(error, element) {
            error.addClass("invalid-feedback");
            error.insertAfter(element);
        },
        submitHandler: function(form, event) {
            
            event.preventDefault();
            
            $.ajax({
                url: $(form).attr('action'),
                type: 'POST',
                data: $(form).serialize(),
                dataType: 'json',
                success: function(response) {
                    alert(response.message);
                    console.log(response);
                    if(response.status === 'success') {
                        $('.btn-custom').text('Add Contact');
                        $('#contact-title').text('Add Contact');
                        $(form)[0].reset();
                        $(form).find(".is-valid").removeClass("is-valid");
                        $('#contactsTable').DataTable().ajax.reload();
                    }
                },
                error: function() {
                    alert('Failed to add contact. Please try again.');
                }
            });
            return false;
        }
    });

    $.validator.addMethod("regex", function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    });

    // Contact listing
    $('#contactsTable').DataTable({
        "processing": true,
        "serverSide": false,
        "ajax": {
            "url": base_url+"contact/get-contacts",
            "type": "GET"
        },
        "columns": [
            { "data": "name" },
            { "data": "phone" },
            { "data": "email" },
            { "data": "address" },
            {
                "data": null,
                "render": function(data, type, row) {
                    return `
                        <button class='btn btn-primary btn-sm edit-contact' data-id='${row.id}'>Edit</button>
                        <button class='btn btn-danger btn-sm delete-contact' data-id='${row.id}'>Delete</button>`;
                }
            }
        ],
        "pageLength": 10
    });

    // Delete contact
    $(document).on('click', '.delete-contact', function() {
        
        if (confirm('Are you sure you want to delete this contact?')) {
            
            var contactId = $(this).data('id');
    
            $.ajax({
                url: base_url + 'contact/delete/' + contactId,
                type: 'POST',
                dataType: 'json',
                success: function(response) {
                    alert(response.message);
                    $('#contactsTable').DataTable().ajax.reload();
                },
                error: function() {
                    alert('Failed to delete contact. Please try again.');
                }
            });
        }
    });

    // Edit contact details
    $(document).on('click', '.edit-contact', function() {
        
        var contactId = $(this).data('id');
    
        $.ajax({
            url: base_url + 'contact/edit/' + contactId,
            type: 'GET',
            dataType: 'json',
            success: function(response) {

                if (response.status === 'success') {
                    
                    $('#id').val(response.data.id);
                    $('#name').val(response.data.name);
                    $('#phone').val(response.data.phone);
                    $('#email').val(response.data.email);
                    $('#address').val(response.data.address);
    
                    $('.btn-custom').text('Update Contact');
                    $('#contact-title').text('Edit Contact');
                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                } else {
                    alert('Failed to fetch contact details.');
                }
            },
            error: function() {
                alert('Error fetching contact details.');
            }
        });
    });

    // Upload contact via file
    $('#uploadForm').on('submit', function (e) {
        e.preventDefault();
        
        var formData = new FormData(this);
        $('#uploadBtn').prop('disabled', true).text('Uploading...');
        $.ajax({
            url: base_url + 'contact/import',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (response) {
                alert(response.message);
                $('#uploadBtn').prop('disabled', false).text('Upload');
                if(response.status === 'success') {
                    $('#contactsTable').DataTable().ajax.reload();
                    $('#uploadForm')[0].reset();
                }
            },
            error: function () {
                alert('File upload failed. Please try again.');
                $('#uploadBtn').prop('disabled', false).text('Upload');
            }
        });
    });
});

function downloadSample() {
    window.open(base_url + 'assets/sample/sample.xml', '_blank');
}