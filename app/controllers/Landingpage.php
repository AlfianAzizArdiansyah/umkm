<?php
class Landingpage extends Controller
{
    public function index()
    {
        $data['title'] = "UMKM Pundak Tegal";
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();
        $data['produk'] = $this->model('ProdukModel')->getAllProduk();
        $this->view('templates/header', $data);
        $this->view('landingpage/index', $data);
        $this->view('templates/footer', $data);
    }
    public function detail_product($id)
    {
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();

        $produk = $this->model('ProdukModel')->getProdukById($id);

        // ✅ VALIDASI PRODUK
        if (empty($produk)) {
            $data['title'] = 'Produk tidak ditemukan';
            $this->view('templates/header', $data);
            echo "<div style='text-align:center;margin:60px'>
                <h3>Produk tidak ditemukan</h3>
              </div>";
            $this->view('templates/footer');
            return;
        }

        $data['produk'] = $produk;

        /* =====================================================
           🔹 PELAKU UMKM (PEMILIK TOKO)
        ===================================================== */
        $pelaku = $this->model('UserModel')
            ->getPemilikToko($produk['id_toko']);

        if (!empty($pelaku)) {

            $alamatPelaku = $this->model('UserModel')
                ->detailAlamat($pelaku['id']);

            $pelaku['alamat'] = $alamatPelaku ?? [];

            $data['pelaku_UMKM'] = $pelaku;

        } else {
            $data['pelaku_UMKM'] = [];
        }

        /* =====================================================
           🔹 PELANGGAN (JIKA LOGIN)
        ===================================================== */
        if (isset($_SESSION['id']) && !empty($_SESSION['id'])) {

            $pelanggan = $this->model('UserModel')
                ->getUserById($_SESSION['id']);

            if (!empty($pelanggan)) {

                $alamatPelanggan = $this->model('UserModel')
                    ->detailAlamat($_SESSION['id']);

                $pelanggan['alamat'] = $alamatPelanggan ?? [];

                $data['pelanggan'] = $pelanggan;

            } else {
                $data['pelanggan'] = [];
            }

        } else {
            $data['pelanggan'] = [];
        }

        $data['title'] = 'Detail Produk - ' . $produk['nama_produk'];

        $this->view('templates/header', $data);
        $this->view('detail/detail_product', $data);
        $this->view('templates/footer', $data);
    }
    public function tambah_keranjang()
    {
        $this->model('TransaksiModel')->tambahKeranjang($_POST);
    }

    public function keranjang($id)
    {
        $this->model('TransaksiModel')->get_semua_keranjang($id);
    }
    public function list_produk()
    {
        $data['title'] = "List Produk";
        $data['produk'] = $this->model('ProdukModel')->getAllProduk();
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();
        $data['paginate'] = $this->model('ProdukModel')->get_pagination_number();
        $this->view('templates/header', $data);
        $this->view('landingpage/list_produk', $data);
        $this->view('templates/footer', $data);
    }

    public function page()
    {
        $data['title'] = 'Data Produk';
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();
        $data['produk'] = $this->model('ProdukModel')->pagination();
        $data['paginate'] = $this->model('ProdukModel')->get_pagination_number();
        $this->view('templates/header', $data);
        $this->view('landingpage/list_produk', $data);
        $this->view('templates/footer', $data);
    }

    public function kategori($kategori)
    {
        $data['title'] = $kategori;
        $data['produk'] = $this->model('ProdukModel')->kategori($kategori);
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();
        $data['paginate'] = $this->model('ProdukModel')->get_pagination_number();
        $this->view('templates/header', $data);
        $this->view('landingpage/list_produk', $data);
        $this->view('templates/footer', $data);
    }
}