$(document).ready(function() {
$(".grid").flexigrid({
    showTableToggleBtn: true,
    sortorder: "asc",
	usepager: true,
	title: 'Livros Cadastrados',
	useRp: true,
	rp: 15


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



