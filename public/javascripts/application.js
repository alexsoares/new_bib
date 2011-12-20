jQuery(document).ready(function( $ ){

//Cadastro Musica
    $('select#audio_visual_genero_id').change(function(){
      if ($(this).val() == 17){
        $(".musica").show();
      }
      else {
        $(".musica").hide();
      }
    });

// Fim cadastro musica

  $("#localizacao_data_aquisicao").datepicker($.datepicker.regional[ "pt-BR" ]);






  // Inicio Mensagem busca
    $(".txt_busca").val("Digite parte da busca").css("color","gray");
  // Fim Mensagem busca

  // Autocomplete Faixa Etaria
  $("#fe").click(function ()
   {
     $(".consulta").show();
     $(".txt_busca").val("Digite parte da busca").css("color","gray");
     $("#search").show().addClass("autocomplete").removeClass("txt_busca");
     
     $(".autocomplete").autocomplete({
        source: ["a"]
     });

     $(".label_busca").show();

   });

  // Fim autocomplete
  //Filtros consultas mapas
  $(".filtro").click(function ()
   {
     $(".consulta").show();
     $(".txt_busca").show();
     $(".label_busca").show();
     $(".txt_busca").val("Digite parte da busca").css("color","gray");
   });
   $(".sem_filtro").click(function ()
    {
      $(".txt_busca").val("");
      $(".txt_busca").hide();
      $(".label_busca").hide();
      $(".consulta").show();
    });
    $(".txt_busca").focus(function(){
       $(".txt_busca,#search").val("");
    });

  // Fim Filtros


// Letras em maiusculo

$("input").keyup(function(){
    $(this).val($(this).val().toUpperCase());
  })

// Fim Letra em maiusculo




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



