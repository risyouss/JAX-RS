<?php
session_start();
require_once('Facebook/autoload.php');

$FBObject = new \Facebook\Facebook([
	'app_id' => '748099770285691',
	'app_secret' => 'dbc37c8ff6132016da1746bc0d10a162',
	'default_graph_version' => 'v2.10'
]);

$handler = $FBObject -> getRedirectLoginHelper();
?>