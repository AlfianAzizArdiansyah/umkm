<div class="content-wrapper">
  <section class="content">

    <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title font-weight-bold"><?= $data['title']; ?></h3>
      </div>

      <form action="<?= base_url; ?>/user/updateAlamat" method="POST">
        <input type="hidden" name="user_id" value="<?= $data['user']['id']; ?>">

        <div class="card-body">
          <div class="row">

            <!-- PROVINSI -->
            <div class="form-group col-6">
              <label>Provinsi</label>
              <select class="form-control" name="provinsi" id="provinsi">
                <option value="">-- Pilih Provinsi --</option>
                <?php foreach ($data['provinsi'] as $prov): ?>
                  <option value="<?= $prov['id']; ?>">
                    <?= $prov['nama']; ?>
                  </option>
                <?php endforeach; ?>
              </select>
            </div>

            <!-- KABUPATEN -->
            <div class="form-group col-6">
              <label>Kabupaten / Kota</label>
              <select class="form-control" name="kabupaten" id="kabupaten" disabled>
                <option value="">-- Pilih Kabupaten --</option>
              </select>
            </div>

            <!-- KECAMATAN -->
            <div class="form-group col-6">
              <label>Kecamatan</label>
              <select class="form-control" name="kecamatan" id="kecamatan" disabled>
                <option value="">-- Pilih Kecamatan --</option>
              </select>
            </div>

            <!-- DESA -->
            <div class="form-group col-6">
              <label>Desa</label>
              <select class="form-control" name="desa" id="desa" disabled>
                <option value="">-- Pilih Desa --</option>
              </select>
            </div>

          </div>

          <div class="form-group">
            <label>Kode Pos</label>
            <input class="form-control" name="kode_pos" id="kode_pos">
          </div>

          <div class="form-group">
            <label>Alamat Lengkap</label>
            <textarea class="form-control" name="alamat_lengkap" rows="4"></textarea>
          </div>

        </div>

        <div class="card-footer">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>

      </form>
    </div>

  </section>
</div>

<script>
  $(function () {

    // PROVINSI → KABUPATEN
    $('#provinsi').change(function () {

      let id = $(this).val();

      $('#kabupaten').prop('disabled', true);
      $('#kecamatan').prop('disabled', true);
      $('#desa').prop('disabled', true);

      $('#kabupaten').html('<option value="">Loading...</option>');
      $('#kecamatan').html('<option value="">-- Pilih Kecamatan --</option>');
      $('#desa').html('<option value="">-- Pilih Desa --</option>');

      if (id) {
        $.get("<?= base_url ?>/wilayah/getKabupaten/" + id, function (data) {
          $('#kabupaten').html(data).prop('disabled', false);
        });
      }
    });

    // KABUPATEN → KECAMATAN
    $('#kabupaten').change(function () {

      let id = $(this).val();

      $('#kecamatan').prop('disabled', true);
      $('#desa').prop('disabled', true);

      $('#kecamatan').html('<option value="">Loading...</option>');
      $('#desa').html('<option value="">-- Pilih Desa --</option>');

      if (id) {
        $.get("<?= base_url ?>/wilayah/getKecamatan/" + id, function (data) {
          $('#kecamatan').html(data).prop('disabled', false);
        });
      }
    });

    // KECAMATAN → DESA
    $('#kecamatan').change(function () {

      let id = $(this).val();

      $('#desa').prop('disabled', true);
      $('#desa').html('<option value="">Loading...</option>');

      if (id) {
        $.get("<?= base_url ?>/wilayah/getDesa/" + id, function (data) {
          $('#desa').html(data).prop('disabled', false);
        });
      }
    });

  });
</script>