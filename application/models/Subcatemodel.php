<?php
class Subcatemodel extends CI_Model{



    public function get_subcate(){

        if(!empty($this->input->get("search"))){

          $this->db->like('name', $this->input->get("search"));

          $this->db->like('category_id', $this->input->get("search"));

          $this->db->or_like('status', $this->input->get("search")); 

        }

        $query = $this->db->get("sub_category");

        return $query->result();

    }



    public function insert_subcate()

    {    

        $data = array(

            'name' => $this->input->post('name'),

            'category_id' => $this->input->post('category_id'),

            'status' => $this->input->post('status')

        );

        return $this->db->insert('sub_category', $data);

    }



    public function update_subcate($id) 

    {

        $data=array(

            'name' => $this->input->post('name'),

            'category_id' => $this->input->post('category_id'),

            'status'=> $this->input->post('status')

        );

        if($id==0){

            return $this->db->insert('sub_category',$data);

        }else{

            $this->db->where('id',$id);

            return $this->db->update('sub_category',$data);

        }        

    }



    public function find_subcate($id)

    {

        return $this->db->get_where('sub_category', array('id' => $id))->row();

    }



    public function delete_subcate($id)

    {

        return $this->db->delete('sub_category', array('id' => $id));

    }

}

?>