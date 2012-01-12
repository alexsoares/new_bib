jQuery(document).ready(function( $ ){
//Verifica Browser
var browser = navigator.appName
var ver = navigator.appVersion
var thestart = parseFloat(ver.indexOf("MSIE"))+1
var brow_ver = parseFloat(ver.substring(thestart+4,thestart+7))
if ((browser=="Microsoft Internet Explorer") && (brow_ver <= 7))
{
alert('NAVEGADOR NÃO INDICADO!\nO Navegador que você está usando não é o adequado para a visualização desse site.\nEste site foi projetado para ser visualizado com Mozila Firefox \nFaça o download e entre novamente!');
window.location = 'http://www.mozilla.org/pt-BR/firefox/new/'
}

});