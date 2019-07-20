<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Crud extends CI_Model {
    /*
    |
    |
    | INI GUNANYA APAAAAAA ??
    |
    |
    |
    |
    |
    */ 

    
    public function ca($t){return $this->db->get($t)->num_rows();} //count all
    public function ga($t){return $this->db->get($t)->result();} //get all
    public function gao($t,$o){return $this->db->order_by($o)->get($t)->result();} //get all order by
    public function gl($t,$l,$f){return $this->db->limit($l,$f)->get($t)->result();} //get limit
    public function glo($t,$l,$f,$o){return $this->db->limit($l,$f)->order_by($o)->get($t)->result();} //get limit order
    public function cw($t,$w){return $this->db->where($w)->get($t)->num_rows();} //count where
    public function gw($t,$w){return $this->db->where($w)->get($t)->result();} //get where
    public function gwo($t,$w,$o){return $this->db->where($w)->order_by($o)->get($t)->result();} //get where order by
    public function gwl($t,$w,$l,$f){return $this->db->where($w)->limit($l,$f)->get($t)->result();} //get where limit
    public function gwlo($t,$w,$l,$f,$o){return $this->db->where($w)->limit($l,$f)->order_by($o)->get($t)->result();} //get where limit order
    public function gd($t,$w){return $this->db->where($w)->get($t)->row();} //get data
    public function gda($t,$w){return $this->db->where($w)->get($t)->row_array();} //get data all
    public function i($t,$d){$this->db->insert($t,$d);} //input
    public function u($t,$d,$w){$this->db->where($w)->update($t,$d);} //update
    public function d($t,$w){$this->db->where($w)->delete($t);} //delete
    public function q($q){return $this->db->query($q)->result();} //query
    public function qq($q){return $this->db->query($q);} //query
    //untuk insert data dan return last inserted id
    public function i2($t,$d){
    $this->db->insert($t,$d);
    $insertedId = $this->db->insert_id();
    return $insertedId;
    }
    public function ib($t,$d){$this->db->insert_batch($t,$d);} //input

    public function sw($t,$w,$c) {return $this->db->select_sum($c)->where($w)->from($t)->get()->result();} //sum where 
}
