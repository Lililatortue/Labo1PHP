

<?php 
require 'config/config.php' ; 
Function getConnection()
{
$connection_string=mysqli_connect($host,$username,$password);
$database=mysqli_select_db($database_name,$connection_string);
}
?>