<?php
class Categorymodel extends CI_Model{



    public function get_category(){

        if(!empty($this->input->get("search"))){

          $this->db->like('name', $this->input->get("search"));

          $this->db->or_like('status', $this->input->get("search")); 

        }

        $query = $this->db->get("category");

        return $query->result();

    }



    public function insert_category()

    {    

        $data = array(

            'name' => $this->input->post('name'),

            'status' => $this->input->post('status')

        );

        return $this->db->insert('category', $data);

    }



    public function update_category($id) 

    {

        $data=array(

            'name' => $this->input->post('name'),

            'status'=> $this->input->post('status')

        );

        if($id==0){

            return $this->db->insert('category',$data);

        }else{

            $this->db->where('id',$id);

            return $this->db->update('category',$data);

        }        

    }



    public function find_category($id)

    {

        return $this->db->get_where('category', array('id' => $id))->row();

    }



    public function delete_category($id)

    {

        return $this->db->delete('category', array('id' => $id));

    }

}

?>