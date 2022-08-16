<?php
require_once("config.php");
require_once("controllers/controller.php");
$oController = new Controller();
if (isset($_GET["function"])) {
  if (method_exists("Controller", $_GET["function"])) {
    $oController->{$_GET["function"]}();
  }
} else {
  Controller::index();
}
