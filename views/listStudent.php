<?php
require_once("layouts/header.php");
?>
<div class="mx-auto col-12 text-center">
  <div class="row">
    <h2>Listado de Estudiantes</h2>
  </div>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">Cód.</th>
        <th scope="col">Identificación</th>
        <th scope="col">Nombre</th>
        <th scope="col">Apellidos</th>
        <th scope="col">Fecha de Nacimiento</th>
        <th scope="col">Ciudad</th>
        <th scope="col">Genero</th>
        <th scope="col">Fecha Creación</th>
        <th scope="col">Fecha Actualización</th>
        <th scope="col">Estado</th>
        <th scope="col">Detalle</th>
      </tr>
    </thead>
    <tbody>
      <?php if (empty($mEstudiantes)) { ?>
        <tr>
          <td colspan="9">Aun no hay estudiantes registrados</td>
        </tr>
      <?php } else { ?>
        <?php foreach ($mEstudiantes as $vEstudiante) { ?>
          <tr>
            <th scope="row"><?= $vEstudiante['Id_Estudiante']; ?></th>
            <td><?= $vEstudiante['Identificacion']; ?></td>
            <td><?= $vEstudiante['Nombres']; ?></td>
            <td><?= $vEstudiante['Apellidos']; ?></td>
            <td><?= $vEstudiante['Fecha_Nacimiento']; ?></td>
            <td><?= $vEstudiante['Nombre']; ?></td>
            <td><?= $vEstudiante['Descripcion']; ?></td>
            <td><?= $vEstudiante['Fecha_Creacion']; ?></td>
            <td><?= $vEstudiante['Fecha_Actualizacion']; ?></td>
            <td><?= $vEstudiante['Estado']; ?></td>
            <td>
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="f_DetalleEstudiante('<?= $vEstudiante['Id_Estudiante']; ?>');">
                Detalle
              </button>
            </td>
          </tr>
        <?php } ?>
      <?php } ?>
    </tbody>
  </table>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Detalle Asignaturas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center" id="mdlBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<?php
require_once("layouts/footer.php");
