<?php
require_once("layouts/header.php");
?>
<div class="mx-auto col-6">
  <div class="row text-center">
    <h2>Eliminar Estudiante</h2>
  </div>
  <div class="input-group mb-3">
    <input type="text" class="form-control" id="inpIdentEst" placeholder="Ingrese Identificación del Estudiante" aria-label="Ingrese Identificación del Estudiante" aria-describedby="button-addon2">
    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="f_BuscarEstudianteDel();">Buscar</button>
  </div>
  <div class="row">
    <hr>
  </div>
  <form class="row d-none" id="frmEliminar">
    <div class="mb-3">
      <label for="inpIdentificacion" class="form-label">Identificación</label>
      <input type="hidden" id="inpIdEstudiante" name="IdEst">
      <input type="number" class="form-control form-control-sm" id="inpIdentificacion" placeholder="1111111111" readonly>
    </div>
    <div class="mb-3">
      <label for="inpNombres" class="form-label">Nombres</label>
      <input type="text" class="form-control form-control-sm" id="inpNombres" placeholder="Pedro Pepito" readonly>
    </div>
    <div class="mb-3">
      <label for="inpApellidos" class="form-label">Apellidos</label>
      <input type="text" class="form-control form-control-sm" id="inpApellidos" placeholder="Perez Puerta" readonly>
    </div>
    <hr>
    <div class="row">
      <div class="text-center">
        <button type="button" class="btn btn-outline-danger" onclick="f_Eliminar();">Eliminar</button>
      </div>
    </div>
  </form>
</div>
<?php
require_once("layouts/footer.php");
