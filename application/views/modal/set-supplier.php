<?php if(isset($supplier)) { ?>
<div class="form-group">
    <label>Nama Supplier</label><br>
    <input class="form-control" name="nama_supplier" type="text" placeholder="Nama Supplier" value="<?php echo $supplier->nama_supplier;?>" readonly>
</div>
<div class="form-group">
    <label>Kontak</label><br>
    <input class="form-control" name="kontak" type="text" placeholder="Kontak" value="<?php echo $supplier->kontak;?>" readonly>
</div>
<?php } else { ?>
<div class="form-group">
    <label>Nama Supplier</label><br>
    <input class="form-control" name="nama_supplier" type="text" placeholder="Nama Supplier" readonly>
</div>
<div class="form-group">
    <label>Kontak</label><br>
    <input class="form-control" name="kontak" type="text" placeholder="Kontak" readonly>
</div>
<?php } ?>