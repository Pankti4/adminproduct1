<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Product extends CI_Controller {


   public $Product;


   /**
    * Get All Data from this method.
    *
    * @return Response
   */
   public function __construct() {
      parent::__construct(); 


      $this->load->library('form_validation');
      $this->load->library('session');
      $this->load->model('Productmodel');


      $this->Product = new Productmodel;
   }


   /**
    * Display Data this method.
    *
    * @return Response
   */
   public function index()
   {
       $data['data'] = $this->Product->get_product();       
        $this->load->view('user/prolist',$data);
   }


   /**
    * Show Details this method.
    *
    * @return Response
   */
   public function show($id)
   {
      $item = $this->Product->find_product($id);
      $this->load->view('user/proshow',array('item'=>$item));
   }


   /**
    * Create from display on this method.
    *
    * @return Response
   */
   public function create()
   {
      $this->load->view('user/procreate');   
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
        $this->form_validation->set_rules('subcategory_id', 'Subcategory_id', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/procreate'));
        }else{
           $this->Product->insert_product();
           redirect(base_url('user/Product'));
        }
    }


   /**
    * Edit Data from this method.
    *
    * @return Response
   */
   public function edit($id)
   {
       $item = $this->Product->find_product($id);
       $this->load->view('user/proedit',array('item'=>$item));
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
        $this->form_validation->set_rules('subcategory_id', 'Subcategory_id', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');


        if ($this->form_validation->run() == FALSE){
            $this->session->set_flashdata('errors', validation_errors());
            redirect(base_url('user/proedit/'.$id));
        }else{ 
          $this->Product->update_product($id);
          redirect(base_url('user/Product'));
        }
   }


   /**
    * Delete Data from this method.
    *
    * @return Response
   */
   public function delete($id)
   {
       $item = $this->Product->delete_product($id);
       redirect(base_url('user/Product'));
   }
}