<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact extends CI_Controller {

	public function __construct() {
        parent::__construct();
        $this->load->model('Contact_model','contact_model');
    }

	public function index(){
		$this->load->view('contact');
	}
	
    // Add/Update the contact
    public function add() {
        
        $id = $this->input->post('id');
        
        $result = $this->contact_model->add_contact($id);

        if( $result ) {

            $msg    = ! empty( $id ) ? 'Contact updated successfully.' : 'Contact added successfully.';
            $status = 'success';
        
        } else {

            $msg    = 'Failed to add contact! Please try again later.';
            $status = 'error';
        }

        echo json_encode(['status' => $status, 'message' => $msg]);
    }

    // Get all contacts for listing
    public function get_contacts() {
        
        $contacts = $this->contact_model->get_all_contacts();
        echo json_encode(['data' => $contacts]);
    }

    // Delete contact
    public function delete( $id ) {

        if ( $this->contact_model->delete_contact( $id ) ) {
            echo json_encode(['status' => 'success', 'message' => 'Contact deleted successfully!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete contact.']);
        }
    }

    // Edit contact details get
    public function edit($id) {

        $contact = $this->contact_model->get_contact_by_id($id);
        
        if ($contact) {
            echo json_encode(['status' => 'success', 'data' => $contact]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Contact not found.']);
        }
    }

    // Import data
    public function import() {
        
        $response = ['status' => 'error', 'message' => 'Invalid file. Please upload a valid XML file.'];
    
        if ( ! empty( $_FILES['file']['name'] ) ) {
            
            $fileType = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
            
            if ( strtolower($fileType) != 'xml' ) {
                
                echo json_encode( $response );
                return;
            }
    
            $filePath = $_FILES['file']['tmp_name'];
            $xml      = simplexml_load_file($filePath);
    
            if ( $xml === false ) {
                
                $response['message'] = 'Failed to parse XML file.';
                echo json_encode($response);
                return;
            }
    
            $contacts = [];
            $total    = 0;
            $success  = 0;
            $failed   = 0;
    
            foreach ($xml->contact as $contact) {
                
                $total++;
    
                $name    = $contact->name;
                $phone   = $contact->phone;
                $email   = $contact->email;
                $address = $contact->address;
    
                if ( empty( $name ) || empty( $phone ) || empty( $email ) || empty( $address ) ) {
                    $failed++;
                    continue;
                }
    
                $contacts[] = [
                    'name'       => $name,
                    'phone'      => $phone,
                    'email'      => $email,
                    'address'    => $address,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                ];

                $success++;
            }
    
            if ( ! empty( $contacts ) ) {
                $this->contact_model->add_contacts_batch($contacts);
            }
    
            $response = [
                'status'  => 'success',
                'message' => "Import Successful!\nTotal: $total, Success: $success, Failed: $failed"
            ];
        }
    
        echo json_encode( $response );
    }
}
