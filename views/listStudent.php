<?php
require_once("layouts/header.php");
?>
<div class="mx-auto col-12 text-center">
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
        <th scope="col">Fecha Creación en el Sistema</th>
        <th scope="col">Estado</th>
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
            <td><?= $vEstudiante['Estado']; ?></td>
          </tr>
        <?php } ?>
      <?php } ?>
    </tbody>
  </table>
</div>
<?php
require_once("layouts/footer.php");
