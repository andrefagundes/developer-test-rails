var Paginas = {

    init: function( ){
        $('.remove_pagina').click(function(){
            Paginas.confirmarExclusao(this.id);
        });

        $("#btnExcluirPagina").on('click',function () {
            Paginas.excluirRegistro($("#id_registro").val());
        });

    },
    confirmarExclusao: function(id){
        $("#id_registro").val(id);
        $("#modalExclusao").modal('show');
    },
    excluirRegistro:function (id) {
        if(id) {
            $.ajax({
                async: true,
                type: 'post',
                url: '/paginas/' + id,
                data: {"_method": "delete"},
                dataType: 'script',
                success: function () {
                    $("#modalExclusao").modal('hide');
                    $("#id_registro").val('');
                    $('#tr_pagina_' + id).remove();
                    $('span[class^=badge]').text($('[id^=tr_pagina_]').size());
                    if ($('[id^=tr_pagina_]').size() == 0) {
                        $('table tbody').append("<tr ><td colspan='4' style='text-align: center'> Nenhum registro encontrado </td></tr>");
                    }
                }
            });
        }
    }
};