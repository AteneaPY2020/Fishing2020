$(function () {




  $.validator.setDefaults({
    errorClass: 'help-block',
    highlight: function (element) {
      $(element)
        .closest('.form-group')
        .addClass('has-error');
    },
    unhighlight: function (element) {
      $(element)
        .closest('.form-group')
        .removeClass('has-error');
    },
    errorPlacement: function (error, element) {
      if (element.prop('type') === 'checkbox') {
        error.insertAfter(element.parent());
      } else {
        error.insertAfter(element);
      }
    }
  });

  $("form[name='formId']").validate({
    rules: {
      email: {
        required: true,
        email: true

      },

      nombre: {
        required: true,

        lettersonly: true
      },
      pais: {
        required: true,
        lettersonly: true

      },

      telefono: {
        required: true,
        digits: true,

      },
      biografia: {
        required: true
      },
      ciudad: {
        required: true,
        lettersonly: true

      },

    },
    messages: {

      email: {
        required: 'Por favor, ingrese un correo',
        email: 'Por favor, ingrese un correo válido',

      },
      nombre: {
        required: 'Por favor, ingrese un nombre'
      },
      pais: {
        required: 'Por favor, ingrese su país',
        lettersonly: 'Por favor, revise que solo contenga letras, sin espacios'

      },
      ciudad: {
        required: 'Por favor, ingrese su ciudad',
        lettersonly: 'Por favor, revise que solo contenga letras, sin espacios'

      },
      telefono: {
        required: 'Por favor, ingrese su numero de telefono',
        digits: 'Por favor, revise que solo contenga números'

      },
      biografia: {
        required: 'Por favor, ingrese su numero de telefonos',

      }
    }

  });
  $("form[name='formIdInv']").validate({
    rules: {
      email: {
        required: true,
        email: true

      },

      nombre: {
        required: true,
      },
      pais: {
        required: true,
        lettersonly: true

      },

      telefono: {
        required: true,
        digits: true,

      },
      biografia: {
        required: true
      },
      ciudad: {
        required: true,
        lettersonly: true

      },

    },
    messages: {

      email: {
        required: 'Por favor, ingrese un correo',
        email: 'Por favor, ingrese un correo válido',

      },
      nombre: {
        required: 'Por favor, ingrese un nombre'
      },
      pais: {
        required: 'Por favor, ingrese su país',
        lettersonly: 'Por favor, revise que solo contenga letras, sin espacios'

      },
      ciudad: {
        required: 'Por favor, ingrese su ciudad',
        lettersonly: 'Por favor, revise que solo contenga letras, sin espacios'

      },
      telefono: {
        required: 'Por favor, ingrese su numero de telefono',
        digits: 'Por favor, revise que solo contenga números'

      },
      biografia: {
        required: 'Por favor, ingrese su numero de telefonos',

      }
    }

  });
  $("form[name='crear']").validate({
    rules: {
      estado: {
        required: true,
      },
      descripcion: {
        required: true,
      },
      historia: {
        required: true,
      },
      eslogan: {
        required: true,
      },
      inversion_inicial: {
        required: true,
        digits: true,
      },
      venta_año_anterior: {
        required: true,
        digits: true,
      },
      oferta_porcentaje: {
        required: true,
        digits: true,
      },
      fecha_fundacion: {
        required: true,
      },
      email: {
        required: true,
        email: true

      },

      nombre: {
        required: true,

        lettersonly: true
      },
      pais: {
        required: true,

        lettersonly: true

      },

      telefono: {
        required: true,
        digits: true,

      },
      biografia: {
        required: true
      },
      ciudad: {
        required: true,
        nowhitespace: true,
        lettersonly: true

      },

    },
    messages: {

      email: {
        required: 'Por favor, ingrese un correo',
        email: 'Por favor, ingrese un correo válido',

      },
      historia: {
        required: 'Por favor, ingrese la historia de su emprendimiento'
      },
      descripcion: {
        required: 'Por favor, ingrese la descripción de su emprendimiento'
      },
      eslogan: {
        required: 'Por favor, ingrese su eslogan'
      },
      fecha_fundacion: {
        required: 'Por favor, la fecha de fundación'
      },
      inversion_inicial: {
        required: 'Por favor, ingrese la inversión inicial',
        digits: 'Por favor, revise que solo contenga números'

      },
      venta_año_anterior: {
        required: 'Por favor, ingrese la venta del año anterior',
        digits: 'Por favor, revise que solo contenga números'

      },
      oferta_porcentaje: {
        required: 'Por favor, ingrese la oferta ej: 20',
        digits: 'Por favor, revise que solo contenga números'

      },
      nombre: {
        required: 'Por favor, ingrese el nombre de su emprendimiento'
      },
      pais: {
        required: 'Por favor, ingrese su país',
        lettersonly: 'Por favor, revise que solo contenga letras'

      },
      ciudad: {
        required: 'Por favor, ingrese su ciudad',
        lettersonly: 'Por favor, revise que solo contenga letras'

      },
      telefono: {
        required: 'Por favor, ingrese su numero de telefonos',
        digits: 'Por favor, revise que solo contenga números'

      },
      biografia: {
        required: 'Por favor, ingrese su numero de telefonos',

      }
    }

  });

});