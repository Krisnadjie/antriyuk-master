<?php
    include 'koneksi.php';

    $dinas = $_POST['dinas'];
    $tgl = $_POST['tanggal'];


    $stmt = $db->prepare("SELECT COUNT(nomorantri) as antrian FROM daftarantrian WHERE namadinas = ? AND tanggal = ?");
    $stmt->execute([$dinas,$tgl]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($result);

?>