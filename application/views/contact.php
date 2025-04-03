<!DOCTYPE html>
<html>
<head>
    <title>Contact Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            padding: 15px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .input-file{
            padding: 3px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <div class="form-container">
                <h4 class="text-center" id="contact-title">Add Contact</h4>
                <form id="contactForm" method="post" action="<?php echo site_url('contact/add'); ?>">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name">
                        <input type="hidden" class="form-control" id="id" name="id">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Phone Number">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea class="form-control" id="address" name="address" rows="2" placeholder="Enter Address"></textarea>
                    </div>
                    <button type="submit" class="btn btn-custom btn-block">Add Contact</button>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-container">
                <h4 class="text-center">Upload Contacts (XML)</h4>
                <form id="uploadForm" method="post" action="<?php echo site_url('contacts/import'); ?>" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="file">Select XML File</label>
                        <input type="file" class="form-control input-file" id="file" name="file" required>
                    </div>
                    <div class="form-group">
                        <small class="form-text text-muted">
                            Note: The XML file must contain the following fields: <strong>Name, Phone, Address, Email</strong>.
                        </small>
                    </div>
                    <button id="uploadBtn" type="submit" class="btn btn-custom btn-block">Upload</button>
                    <button type="button" class="btn btn-secondary btn-block mt-2" onclick="downloadSample()">Download Sample File</button>
                </form>
            </div>
        </div>
    </div>
    <div class="mt-4 form-container">
        <h4 class="text-center">Contact List</h4>
        <table id="contactsTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
<script>
    var base_url = "<?php echo base_url(); ?>";
</script>
<script src="<?php echo base_url().'assets/js/contact.js' ?>"></script>

</body>
</html>
