/*
 Autor: Juan Carlos Rivera Poccomo
 Web: http://starkcode.blogspot.com
 */

/* # Validando Formulario
 ============================================*/
$(document).ready(function() {
    $('#formulario').validate({
        errorElement: "span",
        rules: {
            usuario: {
                minlength: 4,
                number: true,
                required: true
            },
            contrasena: {
                required: true
            },
            nombre: {
                required: true
            },
            apellido: {
                required: true
            },
            telefono: {
                required: true
            },
            contacto: {
                required: true
            },
            lugar: {
                required: true
            },
            dni: {
                minlength: 8,
                maxlength: 8,
                required: true
            },
            medida: {
                required: true
            },
            observaciones: {
                required: true
            },
            precio: {
                number: true,
                required: true
            },
            cantidad: {
                number: true,
                required: true
            }
        },
        highlight: function(element) {
            $(element).closest('.control-group')
                    .removeClass('success').addClass('error');
        },
        success: function(element) {
            element
                    .text('Listo!').addClass('help-inline')
                    .closest('.control-group')
                    .removeClass('error').addClass('success');
        }
    });
});

