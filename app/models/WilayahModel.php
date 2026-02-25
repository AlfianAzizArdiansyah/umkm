<?php

class WilayahModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database;
    }

    // ===============================
    // PROVINSI
    // ===============================
    public function getProvinsi()
    {
        $this->db->query("SELECT * FROM provinsi ORDER BY nama ASC");
        return $this->db->resultSet();
    }

    // ===============================
    // KABUPATEN
    // ===============================
    public function getKabupatenByProvinsi($id_provinsi)
    {
        $this->db->query("
            SELECT * FROM kabupaten 
            WHERE provinsi_id = :id 
            ORDER BY nama ASC
        ");
        $this->db->bind('id', $id_provinsi);
        return $this->db->resultSet();
    }

    // ===============================
    // KECAMATAN
    // ===============================
    public function getKecamatanByKabupaten($id_kabupaten)
    {
        $this->db->query("
            SELECT * FROM kecamatan 
            WHERE kabupaten_id = :id 
            ORDER BY nama ASC
        ");
        $this->db->bind('id', $id_kabupaten);
        return $this->db->resultSet();
    }

    // ===============================
    // DESA
    // ===============================
    public function getDesaByKecamatan($id_kecamatan)
    {
        $this->db->query("
            SELECT * FROM desa 
            WHERE kecamatan_id = :id 
            ORDER BY nama ASC
        ");
        $this->db->bind('id', $id_kecamatan);
        return $this->db->resultSet();
    }
}
