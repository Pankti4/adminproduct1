<?php
class Citymodel extends CI_Model{



    public function get_city(){

        if(!empty($this->input->get("search"))){

          $this->db->like('country_id', $this->input->get("search"));

          $this->db->like('state_id', $this->input->get("search"));

          $this->db->like('name', $this->input->get("search"));

          $this->db->or_like('status', $this->input->get("search")); 

        }

        $query = $this->db->get("cities");

        return $query->result();

    }



    public function insert_city()

    {    

        $data = array(

            'country_id' => $this->input->post('country_id'),

            'state_id' => $this->input->post('state_id'),

            'name' => $this->input->post('name'),

            'status' => $this->input->post('status')

        );

        return $this->db->insert('cities', $data);

    }



    public function update_city($id) 

    {

        $data=array(

            'country_id' => $this->input->post('country_id'),

            'state_id' => $this->input->post('state_id'),

            'name' => $this->input->post('name'),

            'status'=> $this->input->post('status')

        );

        if($id==0){

            return $this->db->insert('cities',$data);

        }else{

            $this->db->where('id',$id);

            return $this->db->update('cities',$data);

        }        

    }



    public function find_city($id)

    {

        return $this->db->get_where('cities', array('id' => $id))->row();

    }



    public function delete_city($id)

    {

        return $this->db->delete('cities', array('id' => $id));

    }

}

?>