<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_model extends CI_Model {

	public $contact_master ='contact';

	public function __construct() {
        parent::__construct();
    }
    
    // Add/Update contact.
	public function add_contact( $id = null ){
		
        $data = [
            'name'       => $this->input->post( 'name' ),
            'phone'      => $this->input->post( 'phone' ),
            'email'      => $this->input->post( 'email' ),
            'address'    => $this->input->post( 'address' ),
            'updated_at' => date( 'Y-m-d H:i:s' )
        ];

        if ( ! empty( $id ) ) {

            $this->db->where( 'id', $id );
			$this->db->update( $this->contact_master, $data );
			return $this->db->affected_rows() > 0 ? true : false ;
		
        } else {
            $data['created_at'] = date( 'Y-m-d H:i:s' );
            return $this->db->insert( $this->contact_master, $data );
		}
	}

    // Get all contact
	public function get_all_contacts() {
        return $this->db->order_by( 'id', 'DESC' )->get( $this->contact_master )->result();
    }
	
    // Delete contact
	public function delete_contact( $id ) {
        return $this->db->where( 'id', $id )->delete( $this->contact_master );
    }

    // Get contact details by id 
    public function get_contact_by_id( $id ) {
        return $this->db->where( 'id', $id )->get( $this->contact_master )->row();
    }

    // Insert multiple contacts
    public function add_contacts_batch( $contacts ) {
        
        if ( ! empty( $contacts ) ) {
            return $this->db->insert_batch( $this->contact_master, $contacts );
        }
        return false;
    }
}


?>