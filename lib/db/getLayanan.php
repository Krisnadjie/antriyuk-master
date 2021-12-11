<?php
    include 'koneksi.php';

    $dinas = $_POST['dinas'];

    $stmt = $db->prepare("SELECT layanan FROM daftarlayanan WHERE namadinas = ?");
    $stmt->execute([$dinas]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($result);

?>