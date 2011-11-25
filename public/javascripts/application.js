$(document).ready(function() {


/*
Validação
*/

$("#new_livro").validate();

//Validacao até Aqui

$(".grid").flexigrid({
    showTableToggleBtn: true,
    sortorder: "asc",
	usepager: true,
	title: 'Livros Cadastrados',
	useRp: true,
	rp: 15

});

//$('select').selectmenu({width: 550,style:'dropdown', menuWidth: 550});
$("#classe_id_classe").selectmenu({width: 150,style:'dropdown', menuWidth: 150});
$("#classe_ano_letivo").selectmenu({width: 150,style:'dropdown', menuWidth: 150});
$('#livro_autor_id,#livro_identificacao_id,#livro_localizacao_id').selectmenu({width: 550,style:'dropdown', menuWidth: 550});
$('#livro_area_id,#livro_editora_id').selectmenu({width: 300,style:'dropdown', menuWidth: 300})
$('#livro_data_edicao_1i').selectmenu({width: 100,style:'dropdown', menuWidth: 100})
$("#livro_assunto_ids,#livro_autor_ids").multiselect({
   selectedText: "# of # selected",
   noneSelectedText: 'Selecione os assuntos',
   header: false

});




$( "input:submit" ).button();
$( "#datepicker" ).datepicker();
$( ".tabs" ).tabs();


$("#emprestimo_tipo_emprestimo").on("click",function(){
    $("#tipo").show;
});

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



