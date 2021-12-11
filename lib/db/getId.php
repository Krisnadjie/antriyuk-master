<?php
include 'koneksi.php';

    $dinas = $_POST['dinas']; 
    // $dinas = "DUKCAPIL";

    $stmt = $db->prepare("SELECT iddinas FROM daftardinas WHERE namadinas = ?");
    $stmt->execute([$dinas]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($result);