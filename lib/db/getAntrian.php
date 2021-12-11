<?php
    include 'koneksi.php';

    $email = $_POST['email'];
    $stats = $_POST['status'];

    // $email = "bakti.p.17@gmail.com";
    // $stats = "Dipesan"; 

    $stm = $db->prepare("SELECT * FROM daftarantrian WHERE email =? AND status = ?");
    $stm->execute([$email,$stats]);
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);
?>