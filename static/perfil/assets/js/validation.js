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
        nowhitespace: true,
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
        required: 'Por favor, ingrese su numero de telefonos',
        digits: 'Por favor, revise que solo contenga números'

      },
      biografia: {
        required: 'Por favor, ingrese su numero de telefonos',

      }
    },

  });

});