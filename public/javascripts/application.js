jQuery(document).ready(function( $ ){
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
});



