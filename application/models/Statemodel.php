<?php
class Statemodel extends CI_Model
{

    public function get_count()
    {
        return $this->db->count_all($this->table);
    }

    function get_countries()
    {
        $query = $this->db->get('countries');
        return $query;  
    }

     function create($formArray)
    {    
         $this->db->insert('states',$formArray);

    }

    function all() 
    {
        return $states = $this->db->get('states')->result_array();

    }

    function getStates($statesId) 
    {
        $this->db->where('id',$statesId);
        return $states = $this->db->get('states')->row_array();
    }

    function updateStates($statesId,$formArray)
    {
        $this->db->where('id',$statesId);
        $this->db->update('states',$formArray);
    }

    function deleteStates($statesId)
    {
        $this->db->where('id',$statesId);
        $this->db->delete('states');
    }

}
?>    