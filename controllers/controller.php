<?php

use LDAP\Result;

require_once("models/model.php");
class Controller {
  private $model;
  public function __construct() {
    $this->model = new Model();
  }

  static function index() {
    $oModelo = new Model();
    $mGeneros = $oModelo->getGeneros();
    $mCiudades = $oModelo->getCiudades();
    $mAsignaturas = $oModelo->getAsignaturas();
    require_once("views/index.php");
  }

  public function f_Horario() {
    $oModelo = new Model();
    echo json_encode($oModelo->getHorarios($_POST["Id_Asignatura"]));
  }

  public function f_Asignaturas() {
    $oModelo = new Model();
    echo json_encode($oModelo->getAsignaturas());
  }

  public function f_Crear() {
    $bBanAsig = false;
    foreach ($_POST["asig"] as $iAsignatura) {
      if (!empty($iAsignatura)) {
        $bBanAsig = true;
      }
    }
    if ($bBanAsig) {
      $oModelo = new Model();
      $bResEstudiante = $oModelo->crearEstudiante($_POST);
      $vResult = ["message" => "Ocurrio un error al crear el estudiante", "status" => false];
      if ($bResEstudiante) {
        $vResult = ["message" => "Estudiante Creado", "status" => $bResEstudiante];
      }
      echo json_encode($vResult);
    } else {
      echo json_encode(["message" => "Debe seleccionar asignatura para poder ser creado", "status" => false]);
    }
  }

  public function f_ListarTodo() {
    $oModelo = new Model();
    $mEstudiantes = $oModelo->getEstudiantes();
    require_once("views/listStudent.php");
  }

  public function f_Editar() {
    $oModelo = new Model();
    $mGeneros = $oModelo->getGeneros();
    $mCiudades = $oModelo->getCiudades();
    $mAsignaturas = $oModelo->getAsignaturas();
    require_once("views/updateStudent.php");
  }

  public function f_BuscarEstudiante() {
    $oModelo = new Model();
    echo json_encode($oModelo->getEstudiante($_POST["identificacion"]));
  }

  public function f_Actualizar() {
    $bBanAsig = false;
    foreach ($_POST["asig"] as $iAsignatura) {
      if (!empty($iAsignatura)) {
        $bBanAsig = true;
      }
    }
    if ($bBanAsig) {
      $oModelo = new Model();
      $bResEstudiante = $oModelo->actualizarEstudiante($_POST);
      $vResult = ["message" => "Ocurrio un error al actualizar el estudiante", "status" => false];
      if ($bResEstudiante) {
        $vResult = ["message" => "Estudiante Actualizado", "status" => $bResEstudiante];
      }
      echo json_encode($vResult);
    } else {
      echo json_encode(["message" => "Debe seleccionar asignatura para poder ser actualizado", "status" => false]);
    }
  }

  public function f_Eliminar() {
    $oModelo = new Model();
    require_once("views/deleteStudent.php");
  }

  public function f_BuscarEstudianteDel() {
    $oModelo = new Model();
    echo json_encode($oModelo->getEstudianteDel($_POST["identificacion"]));
  }

  public function f_EliminarEstudiante() {
    $oModelo = new Model();
    $bResultDel = $oModelo->f_EliminarEstudiante($_POST);
    $vResult = ["message" => "Ocurrio un error al eliminar el estudiante", "status" => false];
    if ($bResultDel) {
      $vResult = ["message" => "Estudiante Eliminado", "status" => $bResultDel];
    }
    echo json_encode($vResult);
  }
}
