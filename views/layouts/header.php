<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Control Estudiantes</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>

<body class="bg-secondary p-2" style="--bs-bg-opacity: .5;">
  <div class="container">
    <h1 class="text-center">Sistema de Estudiantes!</h1>
    <div class="row">
      <div class="text-center">
        <div class="btn-group" role="group" aria-label="Basic example">
          <a href="/salon/index.php" class="btn btn-light btn-lg" role="button" aria-pressed="true">Crear</a>
          <a href="/salon/index.php?function=f_ListarTodo" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Listar</a>
          <a href="/salon/index.php?function=f_Ediar" class="btn btn-secondary btn-lg" role="button" aria-pressed="true">Actualizar</a>
          <a href="/salon/index.php?function=f_Eliminar" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Eliminar</a>
        </div>
      </div>
    </div>
    <div class="row">
      <hr class="mt-3">
    </div>
    <!-- Contenido -->