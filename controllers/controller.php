<?php
require_once("models/model.php");
class Controller
{
  private $model;
  public function __construct()
  {
    $this->model = new Model();
  }

  static function index()
  {
    $oModelo = new Model();
    $mGeneros = $oModelo->getGeneros();
    $mCiudades = $oModelo->getCiudades();
    $mAsignaturas = $oModelo->getAsignaturas();
    require_once("views/index.php");
  }

  public function f_Horario()
  {
    $oModelo = new Model();
    echo json_encode($oModelo->getHorarios($_POST["Id_Asignatura"]));
  }

  public function f_Asignaturas()
  {
    $oModelo = new Model();
    echo json_encode($oModelo->getAsignaturas());
  }

  public function f_Crear()
  {
    $bBanAsig = false;
    foreach ($_POST["asig"] as $iAsignatura) {
      if (!empty($iAsignatura)) {
        $bBanAsig = true;
      }
    }
    if ($bBanAsig) {
      $oModelo = new Model();
      $vResEstudiante = $oModelo->crearEstudiante($_POST);
      echo json_encode($vResEstudiante);
    } else {
      echo json_encode(["message" => "Debe seleccionar asignatura y horario para poder ser creado", "status" => false]);
    }
  }

  public function f_listarTodo() {
    
  }
}
