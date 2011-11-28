$(document).ready(function() {
$(".grid").flexigrid({
    showTableToggleBtn: true,
    sortorder: "asc",
	usepager: true,
	title: 'Livros Cadastrados',
	useRp: true,
	rp: 15,
	searchitems : [
		{display: 'Livro', name : 'identificacao'},
		{display: 'Area', name : 'area', isdefault: true}
		],


});

//$('select').selectmenu({width: 500,style:'dropdown', menuWidth: 500});
$("#classe_id_classe").selectmenu({width: 120,style:'dropdown', menuWidth: 120});
$("#classe_ano_letivo").selectmenu({width: 120,style:'dropdown', menuWidth: 120});
$('#livro_autor_id,#livro_identificacao_id,#livro_localizacao_id').selectmenu({width: 500,style:'dropdown', menuWidth: 500});
$('#livro_area_id,#livro_editora_id').selectmenu({width: 250,style:'dropdown', menuWidth: 250})
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



