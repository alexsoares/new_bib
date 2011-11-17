$(document).ready(function() {
$('#livro_identificacao_id,#livro_area_id,#livro_localizacao_id,#livro_editora_id').selectmenu({width: 150,style:'dropdown', menuWidth: 150});
$("#livro_assunto_ids").multiselect({
   selectedText: "# of # selected"
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



