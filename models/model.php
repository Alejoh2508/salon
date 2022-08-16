<?php
class Model {
  private $db;
  private $mGeneros = [];
  private $mCiudades = [];
  private $mAsignaturas = [];
  private $mHorarios = [];
  private $mEstudiantes = [];
  private $mEstudiante = [];
  private $mEstudianteDel = [];
  private $mMatriculas = [];
  private $bResultMatricula = false;
  private $bResultUpMatricula = false;
  private $bResultDelEstudiante = false;
  public function __construct() {
    $this->db = new PDO("mysql:host=" . HOST . ":" . PORT . ";dbname=" . DATB, USER, PASS);
  }

  public function getGeneros() {
    try {
      $qGeneros = "SELECT * FROM generos WHERE FK_Id_Estado = 1 ";
      $oGeneros = $this->db->query($qGeneros);
      while ($mResult = $oGeneros->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mGeneros = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mGeneros;
  }

  public function getCiudades() {
    try {
      $qCiudades = "SELECT * FROM ciudades WHERE FK_Id_Estado = 1 ";
      $oCiudades = $this->db->query($qCiudades);
      while ($mResult = $oCiudades->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mCiudades = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mCiudades;
  }

  public function getAsignaturas() {
    try {
      $qAsignaturas = "SELECT * FROM asignaturas WHERE FK_Id_Estado = 1 ";
      $oAsignaturas = $this->db->query($qAsignaturas);
      while ($mResult = $oAsignaturas->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mAsignaturas = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mAsignaturas;
  }

  public function getHorarios($iIdAsignatura) {
    try {
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
    } catch (Exception $e) {
    }
    return $this->mHorarios;
  }

  public function getEstudiantes() {
    try {
      $qEstudiantes = "SELECT e.*, g.Descripcion, c.Nombre, s.Descripcion AS Estado ";
      $qEstudiantes .= "FROM estudiantes AS e ";
      $qEstudiantes .= "JOIN ciudades c ON c.Id_Ciudad = e.FK_Id_Ciudad ";
      $qEstudiantes .= "JOIN generos g ON g.Id_Genero = e.FK_Id_Genero ";
      $qEstudiantes .= "JOIN estados s ON s.Id_Estado = e.FK_Id_Estado ";
      $oEstudiantes = $this->db->query($qEstudiantes);
      while ($mResult = $oEstudiantes->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mEstudiantes = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mEstudiantes;
  }

  public function getEstudiante($iIdentificacion) {
    try {
      $qEstudiante = "SELECT e.*, m.FK_Id_Asignatura ";
      $qEstudiante .= "FROM estudiantes AS e ";
      $qEstudiante .= "JOIN matriculas m ON m.FK_Id_Estudiante = e.Id_Estudiante AND m.FK_Id_Estado = 1 ";
      $qEstudiante .= "WHERE e.FK_Id_Estado = 1 ";
      $qEstudiante .= "AND e.Identificacion = $iIdentificacion ";
      $oEstudiante = $this->db->query($qEstudiante);
      while ($mResult = $oEstudiante->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mEstudiante = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mEstudiante;
  }

  public function getEstudianteDel($iIdentificacion) {
    try {
      $qEstudiante = "SELECT * FROM estudiantes WHERE FK_Id_Estado = 1 AND Identificacion = $iIdentificacion ";
      $oEstudiante = $this->db->query($qEstudiante);
      while ($mResult = $oEstudiante->FETCHALL(PDO::FETCH_ASSOC)) {
        $this->mEstudianteDel = $mResult;
      }
    } catch (Exception $e) {
    }
    return $this->mEstudianteDel;
  }
  
  public function getDetalle($iId_Estudiante) {
    try {
      $qConMatricula = "SELECT m.*, a.Nombre, a.Creditos ";
      $qConMatricula .= "FROM matriculas m ";
      $qConMatricula .= "JOIN asignaturas a ON a.Id_Asignatura = m.FK_Id_Asignatura ";
      $qConMatricula .= "WHERE m.FK_Id_Estudiante = {$iId_Estudiante}";
      $oConMatricula = $this->db->query($qConMatricula);
      while ($mResult = $oConMatricula->FETCHALL(PDO::FETCH_ASSOC)) {
        foreach ($mResult as $mDatos) {
          $qHorario = "SELECT h.*, s.Nombre, s.Capacidad ";
          $qHorario .= "FROM horarios h ";
          $qHorario .= "JOIN salones s ON s.Id_Salon = h.FK_Id_Salon ";
          $qHorario .= "WHERE h.FK_Id_Asignatura = {$mDatos["FK_Id_Asignatura"]}";
          $oHorario = $this->db->query($qHorario);
          while ($mResultH = $oHorario->FETCHALL(PDO::FETCH_ASSOC)) {
            $this->mMatriculas["{$mDatos["Nombre"]} - # CR: {$mDatos["Creditos"]}"] = $mResultH;
          }
        }
      }
    } catch (Exception $e) {
    }
    return $this->mMatriculas;
  }

  public function crearEstudiante($mDatos) {
    try {
      $qEstudiante = "INSERT INTO estudiantes (Identificacion, Nombres, Apellidos, Fecha_Nacimiento, FK_Id_Ciudad, FK_Id_Genero, Fecha_Creacion, Fecha_Actualizacion, FK_Id_Estado) ";
      $qEstudiante .= "VALUES ({$mDatos['ide']}, '{$mDatos['nom']}', '{$mDatos['ape']}', '{$mDatos['fecNac']}', {$mDatos['ciu']}, {$mDatos['gen']}, NOW(), NOW(), 1)";
      $oResult = $this->db->query($qEstudiante);
      if ($oResult) {
        $qEstudiante = "SELECT * FROM estudiantes WHERE Identificacion = {$mDatos['ide']} ";
        $oEstudiante = $this->db->query($qEstudiante);
        $vEstudiante = $oEstudiante->FETCHALL(PDO::FETCH_ASSOC);
        $this->bResultMatricula = $this->crearMatricula($vEstudiante[0]["Id_Estudiante"], $_POST);
      }
    } catch (Exception $e) {
    }
    return $this->bResultMatricula;
  }

  public function crearMatricula($iId_Estudiante, $mDatos) {
    try {
      $bMatricula = false;
      foreach ($mDatos["asig"] as $iAsignatura) {
        $qMatricula = "INSERT INTO matriculas (FK_Id_Estudiante, FK_Id_Asignatura, FK_Id_Estado) ";
        $qMatricula .= "VALUES ({$iId_Estudiante}, {$iAsignatura}, 1) ";
        $oResult = $this->db->query($qMatricula);
        if ($oResult) {
          $bMatricula = true;
        }
      }
    } catch (Exception $e) {
    }
    return $bMatricula;
  }

  public function actualizarEstudiante($mDatos) {
    try {
      $qEstudiante = "UPDATE estudiantes SET Identificacion = {$mDatos['ide']}, Nombres = '{$mDatos['nom']}', Apellidos = '{$mDatos['ape']}', ";
      $qEstudiante .= "Fecha_Nacimiento = '{$mDatos['fecNac']}', FK_Id_Ciudad = {$mDatos['ciu']}, FK_Id_Genero = {$mDatos['gen']}, Fecha_Actualizacion = NOW() ";
      $qEstudiante .= "WHERE Id_Estudiante = {$mDatos['IdEst']}";
      $oResult = $this->db->query($qEstudiante);
      if ($oResult) {
        $this->bResultUpMatricula = $this->actualizarMatricula($mDatos['IdEst'], $_POST);
      }
    } catch (Exception $e) {
    }
    return $this->bResultUpMatricula;
  }

  public function actualizarMatricula($iId_Estudiante, $mDatos) {
    $bMatricula = false;
    try {
      $qInaMatriculas = "UPDATE matriculas SET FK_Id_Estado = 2 WHERE FK_Id_Estudiante = {$iId_Estudiante} ";
      $oResult = $this->db->query($qInaMatriculas);
      foreach ($mDatos["asig"] as $iAsignatura) {
        $qConMatricula = "SELECT Id_Matricula FROM matriculas WHERE FK_Id_Estudiante = {$iId_Estudiante} AND FK_Id_Asignatura = {$iAsignatura} ";
        $oConMatricula = $this->db->query($qConMatricula);
        if ($oConMatricula->rowCount() == 0) {
          $qMatricula = "INSERT INTO matriculas (FK_Id_Estudiante, FK_Id_Asignatura, FK_Id_Estado) ";
          $qMatricula .= "VALUES ({$iId_Estudiante}, {$iAsignatura}, 1) ";
          $oResult = $this->db->query($qMatricula);
          if ($oResult) {
            $bMatricula = true;
          }
        } else {
          $qActMatriculas = "UPDATE matriculas SET FK_Id_Estado = 1 WHERE FK_Id_Estudiante = {$iId_Estudiante} AND FK_Id_Asignatura = {$iAsignatura} ";
          $oResult = $this->db->query($qActMatriculas);
          if ($oResult) {
            $bMatricula = true;
          }
        }
      }
    } catch (Exception $e) {
    }
    return $bMatricula;
  }

  public function eliminarEstudiante($mDatos) {
    try {
      $qMatriculas = "DELETE FROM matriculas WHERE FK_Id_Estudiante = {$mDatos['IdEst']} ";
      $oResultM = $this->db->query($qMatriculas);
      if ($oResultM) {
        $qEstudiante = "DELETE FROM estudiantes WHERE Id_Estudiante = {$mDatos['IdEst']} ";
        $oResult = $this->db->query($qEstudiante);
        if ($oResult) {
          $this->bResultDelEstudiante = true;
        }
      }
    } catch (Exception $e) {
    }
    return $this->bResultDelEstudiante;
  }
}
