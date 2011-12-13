jQuery(document).ready(function( $ ){
    $(".txt_busca").val("Digite parte da busca").css("color","gray");
  //Filtros consultas mapas
  $(".filtro").click(function ()
   {
     $(".consulta").show();
     $(".txt_busca").show();
     $(".label_busca").show();
   });

   $(".sem_filtro").click(function ()
    {
      $(".consulta").show();
      $(".txt_busca").val("");

      $(".label_busca").hide();
    });
    $(".txt_busca").focus(function(){
       $(".txt_busca").val("");
    });

  // Fim Filtros







	var uls = $('#menu ul');
	uls.hide();

	$('#menu > li').click(function( e ){
		e.stopPropagation();
		uls.hide();
		$( this ).find('ul').show();
	});
	$('#menu ul').click(function( e ){
		e.stopPropagation();
	});
	$('body').click(function(){
		uls.hide();
	});

$(".grid").flexigrid({
    url: 'livros.json'
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



