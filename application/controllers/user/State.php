<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class State extends CI_Controller {

  function index()
  {   
      $this->load->model('Statemodel');
      $data['countries'] = $this->Statemodel->get_countries()->result();
      $states = $this->Statemodel->all();
      $data = array();
      $data['states'] = $states;
      $this->load->library("pagination");
      $this->load->view('user/slist',$data);
  }

   function create()
   {
      $this->load->model('Statemodel');
      $this->form_validation->set_rules('name','Name','required|is_unique[states.name]');
      $this->form_validation->set_rules('status','Status','required');

      if($this->form_validation->run() == false)
      {
         $this->load->view('user/screate'); 
      } else 
      {
        $formArray = array();
        $formArray['name'] = $this->input->post('name');
        $formArray['status'] = $this->input->post('status');
        $formArray['created'] = date('Y-m-d H:i:s', time());
        $this->Statemodel->create($formArray);
        $this->session->set_flashdata('success','State Successfully Added!');
        redirect(base_url().'user/State');
      }  
    }

    function edit($statesId)
  {
    $this->load->model('Statemodel');
    $states = $this->Statemodel->getStates($statesId);
    $data = array();
    $data['states'] = $states;
    $formArray = array();
    $this->form_validation->set_rules('name','Name','required');
    $this->form_validation->set_rules('status','Status','required');
    if ($this->form_validation->run() == false) 
    {
      $this->load->view('user/sedit',$data);
    } else
     {
      $formArray = array();
      $formArray['name'] = $this->input->post('name');
      $formArray['status'] = $this->input->post('status',true);
      $formArray['updated'] = date('Y-m-d H:i:s', time());
      $this->Statemodel->updateStates($statesId,$formArray);
      $this->session->set_flashdata('success','State Updated successfully!');
      redirect(base_url().'user/State');
     }    
  }

  function delete($statesId)
  {
    $this->load->model('Statemodel');
    $states = $this->Statemodel->getStates($statesId);
    if(empty($states))
    {
      $this->session->set_flashdata('failure','States not found in database!');
      redirect(base_url().'user/States');  
    }
    $this->Statemodel->deleteStates($statesId);
    $this->session->set_flashdata('success','State deleted successfully');
      redirect(base_url().'user/State');
  }
}
?>