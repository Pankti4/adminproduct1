<?php
class Productmodel extends CI_Model{

    public function get_product(){

        if(!empty($this->input->get("search"))){

          $this->db->like('name', $this->input->get("search"));

          $this->db->like('category_id', $this->input->get("search"));

          $this->db->like('subcategory_id', $this->input->get("search"));

          $this->db->or_like('status', $this->input->get("search")); 

        }

        $query = $this->db->get("product");

        return $query->result();

    }



    public function insert_product()

    {    

        $data = array(

            'name' => $this->input->post('name'),

            'category_id' => $this->input->post('category_id'),

            'subcategory_id' => $this->input->post('subcategory_id'),

            'status' => $this->input->post('status')

        );

        return $this->db->insert('product', $data);

    }



    public function update_product($id) 

    {

        $data=array(

            'name' => $this->input->post('name'),

            'category_id' => $this->input->post('category_id'),

            'subcategory_id' => $this->input->post('subcategory_id'),

            'status'=> $this->input->post('status')

        );

        if($id==0){

            return $this->db->insert('product',$data);

        }else{

            $this->db->where('id',$id);

            return $this->db->update('product',$data);

        }        

    }



    public function find_product($id)

    {

        return $this->db->get_where('product', array('id' => $id))->row();

    }



    public function delete_product($id)

    {

        return $this->db->delete('product', array('id' => $id));

    }

}

?>