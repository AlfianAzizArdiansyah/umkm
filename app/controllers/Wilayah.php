<?php

class Wilayah extends Controller
{
    private $wilayahModel;

    public function __construct()
    {
        $this->wilayahModel = $this->model('WilayahModel');
    }

    // ===============================
    // GET KABUPATEN
    // ===============================
    public function getKabupaten($id_provinsi)
    {
        $data = $this->wilayahModel->getKabupatenByProvinsi($id_provinsi);

        echo '<option value="">-- Pilih Kabupaten --</option>';
        foreach ($data as $row) {
            echo '<option value="' . $row['id'] . '">' . $row['nama'] . '</option>';
        }
    }

    // ===============================
    // GET KECAMATAN
    // ===============================
    public function getKecamatan($id_kabupaten)
    {
        $data = $this->wilayahModel->getKecamatanByKabupaten($id_kabupaten);

        echo '<option value="">-- Pilih Kecamatan --</option>';
        foreach ($data as $row) {
            echo '<option value="' . $row['id'] . '">' . $row['nama'] . '</option>';
        }
    }

    // ===============================
    // GET DESA
    // ===============================
    public function getDesa($id_kecamatan)
    {
        $data = $this->wilayahModel->getDesaByKecamatan($id_kecamatan);

        echo '<option value="">-- Pilih Desa --</option>';
        foreach ($data as $row) {
            echo '<option value="' . $row['id'] . '">' . $row['nama'] . '</option>';
        }
    }
}
