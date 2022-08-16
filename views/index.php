<?php
require_once("layouts/header.php");
?>
<div class="row" id="divBasicos">
  <div class="mx-auto col-6">
    <form class="row" id="frmCrear">
      <div class="mb-3">
        <label for="inpIdentificacion" class="form-label">Identificación</label>
        <input type="number" class="form-control form-control-sm" id="inpIdentificacion" placeholder="1111111111" name="ide">
      </div>
      <div class="mb-3">
        <label for="inpNombres" class="form-label">Nombres</label>
        <input type="text" class="form-control form-control-sm" id="inpNombres" placeholder="Pedro Pepito" name="nom">
      </div>
      <div class="mb-3">
        <label for="inpApellidos" class="form-label">Apellidos</label>
        <input type="text" class="form-control form-control-sm" id="inpApellidos" placeholder="Perez Puerta" name="ape">
      </div>
      <div class="mb-3">
        <label for="inpFechaNacimiento" class="form-label">Fecha Nacimiento</label>
        <input type="date" class="form-control form-control-sm" id="inpFechaNacimiento" placeholder="yyyy-mm-dd" name="fecNac">
      </div>
      <div class="mb-3">
        <label for="slcGenero" class="form-label">Genero</label>
        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="slcGenero" name="gen">
          <option value="" selected>--Seleccione--</option>
          <?php if (!empty($mGeneros)) { ?>
            <?php foreach ($mGeneros as $vGenero) { ?>
              <option value="<?= $vGenero["Id_Genero"]; ?>"><?= $vGenero["Descripcion"]; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
      <div class="mb-3">
        <label for="slcCiudad" class="form-label">Ciudad</label>
        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="slcCiudad" name="ciu">
          <option value="" selected>--Seleccione--</option>
          <?php if (!empty($mCiudades)) { ?>
            <?php foreach ($mCiudades as $vCiudad) { ?>
              <option value="<?= $vCiudad["Id_Ciudad"]; ?>"><?= $vCiudad["Nombre"]; ?></option>
            <?php } ?>
          <?php } ?>
        </select>
      </div>
      <div id="divControlEstudiantes">
        <fieldset class="border border-success p-2 mb-2">
          <div class="col-1 offset-11">
            <button type="button" class="btn btn-success position-static top-0 end-0" onclick="f_AddFieldset();">+</button>
          </div>
          <div class="mb-3">
            <label for="slcAsignatura0" class="form-label">Asignatura</label>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="slcAsignatura0" name="asig[]" onchange="f_Horario(this.value, 0);">
              <option value="" selected>--Seleccione--</option>
              <?php if (!empty($mAsignaturas)) { ?>
                <?php foreach ($mAsignaturas as $vAsignatura) { ?>
                  <option value="<?= $vAsignatura["Id_Asignatura"]; ?>"><?= $vAsignatura["Nombre"]; ?> # CR: <?= $vAsignatura["Creditos"]; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="mb-3 d-none text-center" id="divHorario0">
            <table class="table table-sm">
              <thead>
                <tr>
                  <th scope="col">Id Horario</th>
                  <th scope="col">Día</th>
                  <th scope="col">Hora Inicio</th>
                  <th scope="col">Hora Fin</th>
                  <th scope="col">Salón</th>
                  <th scope="col">Capacidad</th>
                </tr>
              </thead>
              <tbody id="tbHorarios0">
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
      <hr>
      <div class="row">
        <div class="text-center">
          <button type="button" class="btn btn-outline-success" onclick="f_Crear();">Crear</button>
        </div>
      </div>
    </form>
  </div>
</div>
<?php
require_once("layouts/footer.php");
