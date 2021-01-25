<?php
class ModInputItems extends CI_model {
	public function selectAll() {
		$this->db->select('*');
		$this->db->from('input_items');
		$this->db->join('items', 'input_items.id_item = items.id_item');
		$this->db->join('suppliers', 'input_items.id_supplier = suppliers.id_supplier');
		$this->db->join('user', 'input_items.id_user = user.id_user');
		$this->db->order_by('tgl_input', "asc");
        return $this->db->get()->result();
	}
	public function listItems() {
		$this->db->order_by('nama_item', "asc");
        return $this->db->get('items')->result();
	}
	public function listSupplier() {
		$this->db->order_by('nama_supplier', "asc");
        return $this->db->get('suppliers')->result();
	}
	public function add($stok) {
		$id_item = $this->input->post('id_item');
		$id_supplier = $this->input->post('id_supplier');
		$qty_input = $this->input->post('qty_input');
		$kb_input = $this->input->post('kb_input');
		$tgl_input = $this->input->post('tgl_input');
		$h_stokInput = $stok;
		$id_user = $this->session->userdata('id_user');
		
		$data = array('id_item' => $id_item,'id_supplier' => $id_supplier, 'qty_input' => $qty_input, 'kb_input' => $kb_input, 'tgl_input' => $tgl_input, 'h_stokInput' => $h_stokInput, 'id_user' => $id_user);
		$this->db->insert('input_items', $data);
	}
	public function addTitem($id_item) {
		$id_item = $id_item;
		$id_supplier = $this->input->post('id_supplier');
		$qty_input = $this->input->post('qty_input');
		$kb_input = $this->input->post('kb_input');
		$h_stokInput = $this->input->post('qty_input');
		$tgl_input = $this->input->post('tgl_input');
		$id_user = $this->session->userdata('id_user');
		
		$data = array('id_item' => $id_item,'id_supplier' => $id_supplier, 'qty_input' => $qty_input, 'kb_input' => $kb_input, 'tgl_input' => $tgl_input, 'h_stokInput' => $h_stokInput, 'id_user' => $id_user);
		$this->db->insert('input_items', $data);
	}
	public function addTsupplier($id_supplier, $stok) {
		$id_item = $this->input->post('id_item');
		$id_supplier = $id_supplier;
		$qty_input = $this->input->post('qty_input');
		$kb_input = $this->input->post('kb_input');
		$tgl_input = $this->input->post('tgl_input');
		$h_stokInput = $stok;
		$id_user = $this->session->userdata('id_user');
		
		$data = array('id_item' => $id_item,'id_supplier' => $id_supplier, 'qty_input' => $qty_input, 'kb_input' => $kb_input, 'tgl_input' => $tgl_input, 'h_stokInput' => $h_stokInput, 'id_user' => $id_user);
		$this->db->insert('input_items', $data);
	}
	public function addTT($id_item, $id_supplier) {
		$id_item = $id_item;
		$id_supplier = $id_supplier;
		$qty_input = $this->input->post('qty_input');
		$kb_input = $this->input->post('kb_input');
		$tgl_input = $this->input->post('tgl_input');
		$h_stokInput = $this->input->post('qty_input');
		$id_user = $this->session->userdata('id_user');
		
		$data = array('id_item' => $id_item,'id_supplier' => $id_supplier, 'qty_input' => $qty_input, 'kb_input' => $kb_input, 'tgl_input' => $tgl_input, 'h_stokInput' => $h_stokInput, 'id_user' => $id_user);
		$this->db->insert('input_items', $data);
	}
	public function delete($id){
		$this->db->where('id_input', $id);
		$this->db->delete('input_items');
	}
	public function edit($id){
		$this->db->select('*');
		$this->db->from('input_items');
		$this->db->join('items', 'input_items.id_item = items.id_item');
		$this->db->join('suppliers', 'input_items.id_supplier = suppliers.id_supplier');
		$this->db->join('user', 'input_items.id_user = user.id_user');
		$this->db->where('id_input', $id);
		return $this->db->get()->result();
	}
	
	public function update(){
		$id_input = $this->input->post('id_input');
		$id_item = $this->input->post('id_item');
		$id_supplier = $this->input->post('id_supplier');
		$qty_input = $this->input->post('qty_input');
		$kb_input = $this->input->post('kb_input');
		$tgl_input = $this->input->post('tgl_input');
		$id_user = $this->session->userdata('id_user');
		
		$data = array('id_item' => $id_item,'id_supplier' => $id_supplier, 'qty_input' => $qty_input, 'kb_input' => $kb_input, 
		'tgl_input' => $tgl_input, 'id_user' => $id_user);
			$this->db->where('id_input', $id_input);
			$this->db->update('input_items', $data);
	}

	public function update_H_Stok($stok){
		$id_input = $this->input->post('id_input');
		$h_stokInput = $stok;		
		$data = array('h_stokInput' => $h_stokInput);
		$this->db->where('id_input', $id_input);
		$this->db->update('input_items', $data);
	}


	public function GetMostInput()
	{

		$this->db->select('i.nama_item, a.qty_input, SUM(a.qty_input) AS total_stok');
		$this->db->from('input_items as a');
		$this->db->join('items as i', 'a.id_item = i.id_item');
		$this->db->group_by('a.id_item'); 
		$this->db->order_by('a.qty_input', "desc");
		$this->db->limit('7');
        return $this->db->get()->result();
	}

	public function GetMostInputInMonth()
	{
		$awal_bulan = date('Y-m-d',strtotime('first day of this month'));
		$akhir_bulan = date('Y-m-d',strtotime('last day of this month'));
		$this->db->select('i.nama_item, a.qty_input, SUM(a.qty_input) AS total_stok');
		$this->db->from('input_items as a');
		$this->db->join('items as i', 'a.id_item = i.id_item');
		$this->db->group_by('a.id_item');
		$this->db->order_by('a.qty_input', "desc");
		$this->db->where("a.tgl_input BETWEEN '$awal_bulan 'AND' $akhir_bulan'");
		$this->db->limit('7');
        return $this->db->get()->result();
	}

	public function InputFilter()
	{
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$this->db->select('i.nama_item, a.qty_input, SUM(a.qty_input) AS total_stok');
		$this->db->from('input_items as a');
		$this->db->join('items as i', 'a.id_item = i.id_item');
		$this->db->group_by('a.id_item');
		$this->db->order_by('a.qty_input', "desc");
		$this->db->where("a.tgl_input BETWEEN '$start 'AND' $end'");
		$this->db->limit('7');
        return $this->db->get()->result();
	}

	public function filter() {
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$this->db->select('*');
		$this->db->from('input_items');
		$this->db->join('items', 'input_items.id_item = items.id_item');
		$this->db->join('suppliers', 'input_items.id_supplier = suppliers.id_supplier');
		$this->db->join('user', 'input_items.id_user = user.id_user');
		$this->db->order_by('tgl_input', "asc");
		$this->db->where("input_items.tgl_input BETWEEN '$start 'AND' $end'");
        return $this->db->get()->result();
	}

	public function getStok($id_input){
        $query = $this->db->query("SELECT qty_input from input_items where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->qty_input;
    }
    public function getStokByInput($id_input){
        $query = $this->db->query("SELECT stok from input_items INNER JOIN items ON input_items.id_item=items.id_item where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->stok;
    }

    public function getKb($id_input){
        $query = $this->db->query("SELECT kb_input from input_items where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->kb_input;
    }
    public function getKbByInput($id_input){
        $query = $this->db->query("SELECT kb from input_items INNER JOIN items ON input_items.id_item=items.id_item where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->kb;
    }

    public function getIdItem($id_input){
        $query = $this->db->query("SELECT id_item from input_items where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->id_item;
    }

    public function getTanggal($id_input){
        $query = $this->db->query("SELECT tgl_input from input_items where id_input= '$id_input'");
        $hasil = $query->row();
        return $hasil->tgl_input;
    }

    public function getTotalQtyProduk($id_item){
        $query = $this->db->query("SELECT SUM(qty_input) AS total FROM input_items WHERE id_item = '$id_item'");
        $hasil = $query->row();
        return $hasil->total;
    }

}