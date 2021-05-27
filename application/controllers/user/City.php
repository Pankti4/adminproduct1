<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class City extends CI_Controller {


   public $City;


   /**
    * Get All Data from this method.
    *
    * @return Response
   */
   public function __construct() {
      parent::__construct(); 


      $this->load->library('form_validation');
      $this->load->library('session');
      $this->load->model('Citymodel');


      $this->City = new Citymodel;
   }


   /**
    * Display Data this method.
    *
    * @return Response
   */
   public function index()
   {
       $data['data'] = $this->City->get_city();       
        $this->load->view('user/cilist',$data);
   }


   /**
    * Show Details this method.
    *
    * @return Response
   */
   public function show($id)
   {
      $item = $this->City->find_city($id);
      $this->load->view('user/cishow',array('item'=>$item));
   }


   /**
    * Create from display on this method.
    *
    * @return Response
   */
   public function create()
   {
      $this->load->view('user/cicreate');   
   }


   /**
    * Store Data from this method.
    *
    * @return Response
   */
   public function store()
   {
        $this->form_validation->set_rules('country_id', 'Country_id', 'required');
        $this->form_validation->set_rules('state_id', 'State_id', 'required');
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/cicreate'));
        }else{
           $this->City->insert_city();
           redirect(base_url('user/City'));
        }
    }


   /**
    * Edit Data from this method.
    *
    * @return Response
   */
   public function edit($id)
   {
       $item = $this->City->find_city($id);
       $this->load->view('user/ciedit',array('item'=>$item));
   }


   /**
    * Update Data from this method.
    *
    * @return Response
   */
   public function update($id)
   {
        $this->form_validation->set_rules('country_id', 'Country_id', 'required');
        $this->form_validation->set_rules('state_id', 'State_id', 'required');
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/ciedit/'.$id));
        }else{ 
          $this->State->update_city($id);
          redirect(base_url('user/City'));
        }
   }


   /**
    * Delete Data from this method.
    *
    * @return Response
   */
   public function delete($id)
   {
       $item = $this->City->delete_city($id);
       redirect(base_url('user/City'));
   }
}