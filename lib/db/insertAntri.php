<?php
    include 'koneksi.php';
    $email = $_POST['email'];
    $nama = $_POST['nama'];
    $nomorantri = $_POST['nomorantri'];
    $namadinas = $_POST['namadinas'];
    $layanan = $_POST['layanan'];
    $tanggal = $_POST['tanggal'];
    $stat = $_POST['status'];
    
    // $email = "bakti@gmail.com";
    // $nama = "Bakti Pras";
    // $nomorantri = "B-002";
    // $namadinas = "DUKCAPIL";
    // $layanan = "Pembuatan KTP";
    // $tanggal = "2021-12-7";
    // $stat = "Dipesan";

    $stmt = $db->prepare("INSERT INTO daftarantrian (email, nama, nomorantri, namadinas, layanan, tanggal,status)
        VALUES (?,?,?,?,?,?,?)");
    $stmt->execute([$email,$nama,$nomorantri,$namadinas,$layanan,$tanggal,$stat]);

?>