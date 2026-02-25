<?php

class UserModel
{

	private $table = 'user';
	private $table_relation = 'role';
	private $db;
	private $total_records;
	public function __construct()
	{
		$this->db = new Database;
		$this->get_all_data_user();
	}

	public function getAllUser()
	{
		$query = 'SELECT user.*,role.nama_role, toko.nama_toko,toko.alamat FROM user 
				  LEFT JOIN role ON user.role_id = role.id
				  LEFT JOIN toko ON user.toko_id = toko.id WHERE NOT user.role_id = 2 LIMIT 10';
		$this->db->query($query);
		return $this->db->resultSet();
	}

	public function getUserById($id)
	{
		$query = 'SELECT user.*,role.nama_role, toko.nama_toko,toko.alamat as toko_alamat,toko.id as id_toko FROM user 
				  LEFT JOIN role ON user.role_id = role.id
				  LEFT JOIN toko ON user.toko_id = toko.id WHERE user.id=:id';
		$this->db->query($query);
		$this->db->bind('id', $id);
		return $this->db->single();
	}

	public function tambahUser($data)
	{
		$ekstensi_diperbolehkan = array('png', 'jpg');
		$photo = $_FILES['photo']['name'];
		$x = explode('.', $photo);
		$ekstensi = strtolower(end($x));
		$file_tmp = $_FILES['photo']['tmp_name'];
		if (!empty($photo)) {
			if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
				move_uploaded_file($file_tmp, realpath('../public') . '/assets/img/user/' . $photo);
				// toko
				$query = "INSERT INTO toko (nama_toko) VALUES(:nama_toko)";
				$this->db->query($query);
				$this->db->bind('nama_toko', $data['nama_toko']);
				$this->db->execute();

				// user
				$query = "INSERT INTO user (photo,nama,email,jenis_kelamin,kontak,rekening,toko_id,password,role_id) VALUES(:photo,:nama,:email,:jenis_kelamin,:kontak,:rekening,(SELECT toko.id FROM toko WHERE toko.nama_toko = :nama_toko LIMIT 1),:password,:role_id)";
				$this->db->query($query);
				$this->db->bind('photo', $photo);
				$this->db->bind('nama_toko', $data['nama_toko']);
				$this->db->bind('nama', $data['nama']);
				$this->db->bind('email', $data['email']);
				$this->db->bind('jenis_kelamin', $data['jenis_kelamin']);
				$this->db->bind('kontak', $data['kontak']);
				$this->db->bind('password', md5($data['password']));
				$this->db->bind('role_id', $data['role_id']);
				$this->db->bind('rekening', $data['rekening']);
				$this->db->execute();

			}
		}
		return $this->db->rowCount();
	}

	public function cekUsername()
	{
		$email = $_POST['email'];
		$this->db->query("SELECT * FROM user WHERE email = :email");
		$this->db->bind('email', $email);
		return $this->db->single();
	}

	public function get_all_data_user()
	{
		$this->db->query('SELECT * FROM ' . $this->table);
		$this->total_records = count($this->db->resultSet());
		return $this->db->resultSet();
	}

	public function get_pagination_number()
	{
		return ceil($this->total_records / 10);
	}

	public function updateDataUser($data)
	{
		$photo = null;

		// ===== HANDLE PHOTO =====
		if (!empty($_FILES['photo']['name'])) {
			$ekstensi_diperbolehkan = ['png', 'jpg', 'jpeg'];
			$nama_file = $_FILES['photo']['name'];
			$x = explode('.', $nama_file);
			$ekstensi = strtolower(end($x));
			$file_tmp = $_FILES['photo']['tmp_name'];

			if (in_array($ekstensi, $ekstensi_diperbolehkan)) {
				move_uploaded_file($file_tmp, realpath('../public') . '/assets/img/user/' . $nama_file);
				$photo = $nama_file;
			}
		}

		// ===== UPDATE TOKO JIKA ROLE = 2 =====
		if ($data['role_id'] == '2' && !empty($data['id_toko'])) {
			$this->db->query("UPDATE toko SET nama_toko=:nama_toko WHERE id=:id_toko");
			$this->db->bind('nama_toko', $data['nama_toko']);
			$this->db->bind('id_toko', $data['id_toko']);
			$this->db->execute();
		}

		// ===== BUILD QUERY DINAMIS =====
		$query = "UPDATE user SET 
                nama = :nama,
                email = :email,
                jenis_kelamin = :jenis_kelamin,
                kontak = :kontak,
                role_id = :role_id";

		if ($data['role_id'] == '2') {
			$query .= ",
                rekening = :rekening,
                toko_id = :id_toko";
		}

		if ($photo) {
			$query .= ", photo = :photo";
		}

		if (!empty($data['password'])) {
			$query .= ", password = :password";
		}

		$query .= " WHERE id = :id";

		// ===== EXECUTE =====
		$this->db->query($query);

		$this->db->bind('id', $data['id']);
		$this->db->bind('nama', $data['nama']);
		$this->db->bind('email', $data['email']);
		$this->db->bind('jenis_kelamin', $data['jenis_kelamin']);
		$this->db->bind('kontak', $data['kontak']);
		$this->db->bind('role_id', $data['role_id']);

		if ($data['role_id'] == '2') {
			$this->db->bind('rekening', $data['rekening']);
			$this->db->bind('id_toko', $data['id_toko']);
		}

		if ($photo) {
			$this->db->bind('photo', $photo);
		}

		if (!empty($data['password'])) {
			$this->db->bind('password', md5($data['password']));
		}

		$this->db->execute();

		return true;
	}

	public function deleteUser($id)
	{
		$this->db->query('DELETE FROM user WHERE id=:id');
		$this->db->bind('id', $id);
		try {
			$this->db->execute();
		} catch (\Throwable $e) {
		}

		return $this->db->rowCount();
	}

	public function cariUser()
	{
		$key = $_POST['key'];
		$this->db->query('SELECT user.*,role.nama_role FROM user 
							JOIN role ON user.role_id = role.id  WHERE nama LIKE :key
							AND NOT role.id = 2');
		$this->db->bind('key', "%$key%");
		return $this->db->resultSet();
	}

	public function cariPelakuUMKM()
	{
		$key = $_POST['key'];
		$this->db->query('SELECT user.*,role.nama_role,toko.nama_toko FROM user 
							JOIN role ON user.role_id = role.id  
							LEFT JOIN toko ON user.toko_id = toko.id
							WHERE user.nama LIKE :key 
							AND role.id = 2');
		$this->db->bind('key', "%$key%");
		return $this->db->resultSet();
	}

	public function pagination($page)
	{
		$start = 0;
		if ($page > 1) {
			$start = ($page * 10) - 10;
		}
		$this->db->query('SELECT user.*,role.nama_role FROM user 
							JOIN role ON user.role_id = role.id' . ' LIMIT ' . $start . ', 10 ');
		$this->total_records = count($this->db->resultSet());
		return $this->db->resultSet();
	}

	public function detailUser($id)
	{
		$query = 'SELECT user.*, toko.nama_toko, toko.id as toko_id 
              FROM user 
              LEFT JOIN toko ON user.toko_id = toko.id 
              WHERE user.id = :id';

		$this->db->query($query);
		$this->db->bind('id', $id);
		return $this->db->single();
	}


	// Model Pelaku UMKM
	public function getDataPelakuUMKM()
	{
		$query = 'SELECT user.*,role.nama_role,toko.nama_toko FROM user 
				  LEFT JOIN role ON user.role_id = role.id
				  LEFT JOIN toko ON user.toko_id = toko.id WHERE user.role_id = 2 LIMIT 10';
		$this->db->query($query);
		return $this->db->resultSet();
	}
	public function getPemilikToko($id)
	{
		$query = 'SELECT user.*,toko.id as id_toko,toko.nama_toko FROM user
				  JOIN toko ON user.toko_id = toko.id 
				  WHERE toko.id = :id';
		$this->db->query($query);
		$this->db->bind('id', $id);
		return $this->db->single();
	}

	public function tambahPelanggan($data)
	{
		$ekstensi_diperbolehkan = array('png', 'jpg');
		$photo = $_FILES['photo']['name'];
		$x = explode('.', $photo);
		$ekstensi = strtolower(end($x));
		$file_tmp = $_FILES['photo']['tmp_name'];
		if (!empty($photo)) {
			if (in_array($ekstensi, $ekstensi_diperbolehkan) === true) {
				move_uploaded_file($file_tmp, realpath('../public') . '/assets/img/user/' . $photo);
				$query = "INSERT INTO user (photo,nama,email,jenis_kelamin,kontak,password,role_id) VALUES(:photo,:nama,:email,:jenis_kelamin,:kontak,:password,:role_id)";
				$this->db->query($query);
				$this->db->bind('photo', $photo);
				$this->db->bind('nama', $data['nama']);
				$this->db->bind('email', $data['email']);
				$this->db->bind('jenis_kelamin', $data['jenis_kelamin']);
				$this->db->bind('kontak', $data['kontak']);
				$this->db->bind('password', md5($data['password']));
				$this->db->bind('role_id', $data['role_id']);
				$this->db->execute();
			}
		}
		return $this->db->rowCount();
	}

	public function detailAlamat($id)
	{
		$this->db->query("SELECT * FROM alamat_user WHERE user_id = :user_id");
		$this->db->bind('user_id', $id);
		return $this->db->single();
	}

	public function tambahAlamat($data)
	{
		$query = "INSERT INTO alamat_user 
              (user_id, provinsi, kabupaten_kota, kecamatan, detail_alamat)
              VALUES
              (:user_id, :provinsi, :kabupaten_kota, :kecamatan, :detail_alamat)";

		$this->db->query($query);

		$this->db->bind('user_id', $data['user_id']);
		$this->db->bind('provinsi', $data['provinsi'] ?? '');
		$this->db->bind('kabupaten_kota', $data['kabupaten_kota'] ?? '');
		$this->db->bind('kecamatan', $data['kecamatan'] ?? '');
		$this->db->bind('detail_alamat', $data['detail_alamat'] ?? '');

		$this->db->execute();

		return true;
	}

	public function updateAlamat($data)
	{
		$query = "UPDATE alamat_user SET
              provinsi = :provinsi,
              kabupaten_kota = :kabupaten_kota,
              kecamatan = :kecamatan,
              detail_alamat = :detail_alamat
              WHERE user_id = :user_id";

		$this->db->query($query);

		$this->db->bind('user_id', $data['user_id']);
		$this->db->bind('provinsi', $data['provinsi'] ?? '');
		$this->db->bind('kabupaten_kota', $data['kabupaten_kota'] ?? '');
		$this->db->bind('kecamatan', $data['kecamatan'] ?? '');
		$this->db->bind('detail_alamat', $data['detail_alamat'] ?? '');

		$this->db->execute();

		return true;
	}

}