function f_Horario(Id_Asignatura, ind) {
  $("#tbHorarios" + ind).html('');
  $.ajax({
    url: "/salon/index.php?function=f_Horario",
    data: { Id_Asignatura: Id_Asignatura },
    dataType: 'JSON',
    method: "POST",
    success: function (data) {
      if (data.length > 0) {
        $.each(data, function (i, elem) {
          $("#tbHorarios" + ind).append(`<tr><td>${elem.Id_Horario}</td><td>${elem.Dia}</td><td>${elem.Hora_Inicio}</td><td>${elem.Hora_Fin}</td><td>${elem.Nombre}</td><td>${elem.Capacidad}</td></tr>`);
        });
        $("#divHorario" + ind).removeClass("d-none").addClass("d-block");
      } else {
        $("#divHorario" + ind).removeClass("d-block").addClass("d-none");
        alert("Lo sentimos pero para esta asignatura no hay horarios disponibles");
      }
    }
  });
}

function f_AddFieldset(indx = null) {
  let ind = (indx != null) ? indx : $('fieldset').length;
  var options = `<option value="" selected>--Seleccione--</option>`;
  $.ajax({
    url: "/salon/index.php?function=f_Asignaturas",
    dataType: 'JSON',
    method: "POST",
    success: function (data) {
      $.each(data, function (i, elem) {
        options += `<option value="${elem.Id_Asignatura}">${elem.Nombre} # CR: ${elem.Creditos}</option>`;
      });
      $('#divControlEstudiantes').append(`
        <fieldset class="border border-success p-2 mb-2">
          <div class="col-1 offset-11">
            <button type="button" class="btn btn-success position-static top-0 end-0" onclick="f_AddFieldset();">+</button>
          </div>
          <div class="mb-3">
            <label for="slcAsignatura${ind}" class="form-label">Asignatura</label>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="slcAsignatura${ind}" name="asig[]" onchange="f_Horario(this.value, ${ind});">
              ${options}
            </select>
          </div>
          <div class="mb-3 d-none text-center" id="divHorario${ind}">
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
              <tbody id="tbHorarios${ind}">
              </tbody>
            </table>
          </div>
        </fieldset>
      `);
    }
  });
}

function f_Crear() {
  if ($('#inpIdentificacion').val() == '' || $('#inpNombres').val() == '' || $('#inpApellidos').val() == '' || $('#inpFechaNacimiento').val() == '' || $('#slcGenero').val() == '' || $('#slcCiudad').val() == '') {
    alert("Debe rellenar el formulario");
  } else {
    $.ajax({
      data: $('#frmCrear').serialize(),
      type: "POST",
      url: "/salon/index.php?function=f_Crear",
      dataType: "json",
      success: function (data) {
        alert(data.message);
        if (data.status) {
          location.reload();
        }
      }
    });
  }
}

function f_BuscarEstudiante() {
  if ($("#inpIdentEst").val() != '') {
    $.ajax({
      data: { identificacion: $("#inpIdentEst").val() },
      type: "POST",
      url: "/salon/index.php?function=f_BuscarEstudiante",
      dataType: "json",
      success: function (data) {
        $("#inpIdentEst").val('')
        if (data.length > 0) {
          $('#frmActualizar').trigger("reset");
          $("#inpIdEstudiante").val(data[0].Id_Estudiante);
          $("#inpIdentificacion").val(data[0].Identificacion);
          $("#inpNombres").val(data[0].Nombres);
          $("#inpApellidos").val(data[0].Apellidos);
          $("#inpFechaNacimiento").val(data[0].Fecha_Nacimiento);
          $("#slcGenero").val(data[0].FK_Id_Genero);
          $("#slcCiudad").val(data[0].FK_Id_Ciudad);
          $.each(data, function (i, elem) {
            if (i > 0) {
              f_AddFieldset(i);
            }
          });
          setTimeout(function () {
            $.each(data, function (i, elem) {
              $("#slcAsignatura" + i).val(elem.FK_Id_Asignatura);
              f_Horario(elem.FK_Id_Asignatura, i);
            });
          }, 1000);
          $('#frmActualizar').removeClass("d-none").addClass("d-block");
        } else {
          $('#frmActualizar').trigger("reset");
          $('#frmActualizar').removeClass("d-block").addClass("d-none");
          alert("No se encontro ningún estudiante con la identificación digitada");
        }
      }
    });
  } else {
    $('#frmActualizar').trigger("reset");
    $('#frmActualizar').removeClass("d-block").addClass("d-none");
    alert("Debe digitar una identificación");
  }
}

function f_Actualizar() {
  if ($('#inpIdentificacion').val() == '' || $('#inpNombres').val() == '' || $('#inpApellidos').val() == '' || $('#inpFechaNacimiento').val() == '' || $('#slcGenero').val() == '' || $('#slcCiudad').val() == '') {
    alert("Debe rellenar el formulario");
  } else {
    $.ajax({
      data: $('#frmActualizar').serialize(),
      type: "POST",
      url: "/salon/index.php?function=f_Actualizar",
      dataType: "json",
      success: function (data) {
        alert(data.message);
        if (data.status) {
          location.reload();
        }
      }
    });
  }
}

function f_BuscarEstudianteDel() {
  if ($("#inpIdentEst").val() != '') {
    $.ajax({
      data: { identificacion: $("#inpIdentEst").val() },
      type: "POST",
      url: "/salon/index.php?function=f_BuscarEstudianteDel",
      dataType: "json",
      success: function (data) {
        $("#inpIdentEst").val('')
        if (data.length > 0) {
          $('#frmEliminar').trigger("reset");
          $("#inpIdEstudiante").val(data[0].Id_Estudiante);
          $("#inpIdentificacion").val(data[0].Identificacion);
          $("#inpNombres").val(data[0].Nombres);
          $("#inpApellidos").val(data[0].Apellidos);
          $('#frmEliminar').removeClass("d-none").addClass("d-block");
        } else {
          $('#frmEliminar').trigger("reset");
          $('#frmEliminar').removeClass("d-block").addClass("d-none");
          alert("No se encontro ningún estudiante con la identificación digitada");
        }
      }
    });
  } else {
    $('#frmEliminar').trigger("reset");
    $('#frmEliminar').removeClass("d-block").addClass("d-none");
    alert("Debe digitar una identificación");
  }
}

function f_Eliminar() {
  if (window.confirm("Realmente desea eliminar al estudiante?")) {
    $.ajax({
      data: $('#frmEliminar').serialize(),
      type: "POST",
      url: "/salon/index.php?function=f_EliminarEstudiante",
      dataType: "json",
      success: function (data) {
        alert(data.message);
        if (data.status) {
          location.reload();
        }
      }
    });
  }
}