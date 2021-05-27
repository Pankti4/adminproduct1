<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Subcate extends CI_Controller {


   public $Subcate;


   /**
    * Get All Data from this method.
    *
    * @return Response
   */
   public function __construct() {
      parent::__construct(); 


      $this->load->library('form_validation');
      $this->load->library('session');
      $this->load->model('Subcatemodel');


      $this->Subcate = new Subcatemodel;
   }


   /**
    * Display Data this method.
    *
    * @return Response
   */
   public function index()
   {
       $data['data'] = $this->Subcate->get_subcate();       
        $this->load->view('user/sulist',$data);
   }


   /**
    * Show Details this method.
    *
    * @return Response
   */
   public function show($id)
   {
      $item = $this->Subcate->find_subcate($id);
      $this->load->view('user/sushow',array('item'=>$item));
   }


   /**
    * Create from display on this method.
    *
    * @return Response
   */
   public function create()
   {
      $this->load->view('user/sucreate');   
   }


   /**
    * Store Data from this method.
    *
    * @return Response
   */
   public function store()
   {
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('category_id', 'Category_id', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/sucreate'));
        }else{
           $this->Subcate->insert_subcate();
           redirect(base_url('user/Subcate'));
        }
    }


   /**
    * Edit Data from this method.
    *
    * @return Response
   */
   public function edit($id)
   {
       $item = $this->Subcate->find_subcate($id);
       $this->load->view('user/suedit',array('item'=>$item));
   }


   /**
    * Update Data from this method.
    *
    * @return Response
   */
   public function update($id)
   {
        
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('category_id', 'Category', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/suedit/'.$id));
        }else{ 
          $this->Subcate->update_subcate($id);
          redirect(base_url('user/Subcate'));
        }
   }


   /**
    * Delete Data from this method.
    *
    * @return Response
   */
   public function delete($id)
   {
       $item = $this->Subcate->delete_subcate($id);
       redirect(base_url('user/Subcate'));
   }
}