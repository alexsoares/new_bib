$(document).ready(function( $ ) {

//Click do menu - inicio
	var uls = $('.select ul');
	uls.hide();

	$('.select > li').click(function( e ){
		e.stopPropagation();
		uls.hide();
		$( this ).find('ul').show();
	});
	$('.select ul').click(function( e ){
		e.stopPropagation();
	});
	$('body').click(function(){
		uls.hide();
	});
//Click do menu - fim




$( "#nome_livro" ).autocomplete({
    
    source: "livro.json",
    minLength: 0
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



