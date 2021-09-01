// TABEL 1 : Tabel Penjualan Barang //

MariaDB [(none)]> create database praktikum_aggregate;
MariaDB [(none)]> use praktikum_aggregate;

MariaDB [praktikum_aggregate]> create table penjualan_barang (
    -> KodeBarang char(12),
    -> NamaBarang char(20),
    -> Harga int(10),
    -> Stok int(3)
    -> );

MariaDB [praktikum_aggregate]> insert into penjualan_barang values
    -> ("KOS447","Bedak Red-C","13500","104"),
    -> ("BUK777","Buku Kotak SIBU","2200","77"),
    -> ("ATK342","Penghapus ATM","500","116"),
    -> ("SBN123","Rinso 1 kg","20500","23"),
    -> ("SBN333","Boom 1 kg","14250","18"),
    -> ("BUK778","Buku Gambar KIKY","3000","9"),
    -> ("ATK333","Penggaris Butterfly","1500","1");

// TABEL 2 : Tabel Matakuliah //

MariaDB [praktikum_aggregate]> create table Matakuliah (
    -> kode_mk char(12),
    -> nama_mk varchar(20),
    -> sks int(1),
    -> semester int(1)
    -> );

MariaDB [praktikum_aggregate]> insert into Matakuliah values
    -> ("PTI447","Praktikum Basis Data","1","3"),
    -> ("TIK342","Praktikum Basis Data","1","3"),
    -> ("PTI333","Basis Data Terdistribusi","3","5"),
    -> ("TIK123","Jaringan Komputer","2","5"),
    -> ("TIK333","Sistem Operasi","3","5"),
    -> ("PTI123","Grafika Multimedia","3","5"),
    -> ("PTI777","Sistem Informasi","2","3");

// 1. Berdasarkan Tabel 1, tampilkan KodeBarang, NamaBarang, dan Harga barang termurah! //

MariaDB [praktikum_aggregate]> select KodeBarang, NamaBarang, Harga from penjualan_barang
    -> where Harga = (select min(Harga) from penjualan_barang);

// 2. Berdasarkan Tabel 1, tampilkan data buku yang memiliki stok kurang dari 10! //

MariaDB [praktikum_aggregate]> select * from penjualan_barang where NamaBarang like "%Buku%" and Stok < 10;

// 3. Berdasarkan Tabel 2, dapatkan jumlah matakuliah yang mengandung kata "Basis Data"! //

MariaDB [praktikum_aggregate]> select count(nama_mk) from MataKuliah where nama_mk like '%Basis Data%';

// 4. Berdasarkan Tabel 2, dapatkan jumlah total sks pada matakuliah dengan kode_mk selain PTI! //

MariaDB [praktikum_aggregate]> select count(sks) from MataKuliah where kode_mk not like '%PIT%';

// PRAKTIKUM LANJUTAN //

// 1. Berdasarkan Tabel 1, dapatkan rata - rata penghasilan yang didapat dari penjualan barang dengan stok diatas 50! //

MariaDB [praktikum_aggregate]> select AVG(Harga) from penjualan_barang where Stok > 50;

// 2. Berdasarkan Tabel 1, dapatkan harga barang yang bukan buku dengan harga diatas 2000 dan stok dibawah 30! //

MariaDB [praktikum_aggregate]> select Harga from penjualan_barang where Harga > 2000 and Stok < 30;

// 3. Berdasarkan Tabel 2, dapatkan jumlah matakuliah yang mengandung kata "Sistem"! //

MariaDB [praktikum_aggregate]> select count(nama_mk) from MataKuliah where nama_mk like '%Sistem%';