<?php
class Model
{
  private $db;
  private $mGeneros = [];
  private $mCiudades = [];
  private $mAsignaturas = [];
  private $mHorarios = [];
  private $mEstudiantes = [];
  public function __construct()
  {
    $this->db = new PDO("mysql:host=" . HOST . ":" . PORT . ";dbname=" . DATB, USER, PASS);
  }

  public function getGeneros()
  {
    $qGeneros = "SELECT * FROM generos WHERE FK_Id_Estado = 1 ";
    $oGeneros = $this->db->query($qGeneros);
    while ($mResult = $oGeneros->FETCHALL(PDO::FETCH_ASSOC)) {
      $this->mGeneros = $mResult;
    }
    return $this->mGeneros;
  }

  public function getCiudades()
  {
    $qCiudades = "SELECT * FROM ciudades WHERE FK_Id_Estado = 1 ";
    $oCiudades = $this->db->query($qCiudades);
    while ($mResult = $oCiudades->FETCHALL(PDO::FETCH_ASSOC)) {
      $this->mCiudades = $mResult;
    }
    return $this->mCiudades;
  }

  public function getAsignaturas()
  {
    $qAsignaturas = "SELECT * FROM asignaturas WHERE FK_Id_Estado = 1 ";
    $oAsignaturas = $this->db->query($qAsignaturas);
    while ($mResult = $oAsignaturas->FETCHALL(PDO::FETCH_ASSOC)) {
      $this->mAsignaturas = $mResult;
    }
    return $this->mAsignaturas;
  }

  public function getHorarios($iIdAsignatura)
  {
    if (is_numeric($iIdAsignatura)) {
      $qHorarios = "SELECT h.*, s.Id_Salon, s.Nombre, s.Capacidad ";
      $qHorarios .= "FROM horarios AS h ";
      $qHorarios .= "JOIN salones s ON s.Id_Salon = h.FK_Id_Salon AND s.FK_Id_Estado = 1 ";
      $qHorarios .= "WHERE h.FK_Id_Estado = 1 ";
      $qHorarios .= "AND h.FK_Id_Asignatura = {$iIdAsignatura} ";
      $oHorarios = $this->db->query($qHorarios);
      while ($mResult = $oHorarios->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mHorarios = $mResult;
      }
    }
    return $this->mHorarios;
  }

  public function getEstudiantes()
  {
    $qEstudiantes = "SELECT e.*, g.Descripcion, c.Nombre, s.Descripcion AS Estado ";
    $qEstudiantes .= "FROM estudiantes AS e ";
    $qEstudiantes .= "JOIN ciudades c ON c.Id_Ciudad = e.FK_Id_Ciudad ";
    $qEstudiantes .= "JOIN generos g ON g.Id_Genero = e.FK_Id_Genero ";
    $qEstudiantes .= "JOIN estados s ON s.Id_Estado = e.FK_Id_Estado ";
    $oEstudiantes = $this->db->query($qEstudiantes);
    while ($mResult = $oEstudiantes->FETCHALL(PDO::FETCH_ASSOC)) {
      $this->mEstudiantes = $mResult;
    }
    return $this->mEstudiantes;
  }

  public function crearEstudiante($mDatos)
  {
    $qEstudiante = "INSERT INTO estudiantes (Identificacion, Nombres, Apellidos, Fecha_Nacimiento, FK_Id_Ciudad, FK_Id_Genero, Fecha_Creacion, Fecha_Actualizacion, FK_Id_Estado) ";
    $qEstudiante .= "VALUES ({$mDatos['ide']}, '{$mDatos['nom']}', '{$mDatos['ape']}', '{$mDatos['fecNac']}', {$mDatos['ciu']}, {$mDatos['gen']}, NOW(), NOW(), 1)";
    $oResult = $this->db->query($qEstudiante);
    if ($oResult) {
      $qEstudiante = "SELECT * FROM estudiantes WHERE Identificacion = {$mDatos['ide']} ";
      $oEstudiante = $this->db->query($qEstudiante);
      $vEstudiante = $oEstudiante->FETCHALL(PDO::FETCH_ASSOC);
      $bResultMatricula = $this->crearMatricula($vEstudiante[0]["Id_Estudiante"], $_POST);
      $vResult = ["message" => "Estudiante Creado", "status" => $bResultMatricula];
    } else {
      $vResult = ["message" => "Ocurrio un error al crear el estudiante", "status" => false];
    }
    return $vResult;
  }

  public function crearMatricula($iId_Estudiante, $mDatos)
  {
    $bMatricula = false;
    foreach ($mDatos["asig"] as $iAsignatura) {
      $qMatricula = "INSERT INTO matriculas (FK_Id_Estudiante, FK_Id_Asignatura) ";
      $qMatricula .= "VALUES ({$iId_Estudiante}, {$iAsignatura}) ";
      $oResult = $this->db->query($qMatricula);
      if ($oResult) {
        $bMatricula = true;
      }
    }
    return $bMatricula;
  }
}
