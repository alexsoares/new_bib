$(document).ready(function() {
/*
$('#livro_autor_id,#livro_identificacao_id,#livro_localizacao_id').selectmenu({width: 550,style:'dropdown', menuWidth: 550});
$('#livro_area_id,#livro_editora_id').selectmenu({width: 300,style:'dropdown', menuWidth: 300})
$('#livro_data_edicao').selectmenu({width: 100,style:'dropdown', menuWidth: 100})
*/

$('#livro_autor_id,#livro_identificacao_id,#livro_localizacao_id').multiselect({
    multiple: false,
    minWidth: 550,
    header: false,
    selectedText: "",
    close: true,

});
$("#livro_data_edicao,#livro_area_id,#livro_editora_id").multiselect({
    minWidth: 290,
    multiple: false,
    header: false,
    selectedText: ""

});
$("#livro_data_edicao_1i").multiselect({
    multiple: false,
    header: false,
    selectedText: "",
    minWidth: 100
});
$("#livro_assunto_ids").multiselect({
   selectedText: "# of # selected",
   noneSelectedText: 'Selecione os assuntos',
   header: false
});
$( "input:submit" ).button();
$( "#datepicker" ).datepicker();
$( ".tabs" ).tabs();

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
function hide_field(link,div) {
  $(div).toggle();
}


});



