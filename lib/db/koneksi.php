<?php

try{
    $koneksi = new PDO('mysql:host=localhost,dbname=antriyuk', 'root', '');
    $koneksi -> setAttribut(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXECPTION);
}catch(PDOException $exc){
    echo $exc->getMessage();
    die("Tidak bisa terhubung");
}

?>