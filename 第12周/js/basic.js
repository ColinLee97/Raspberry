// JavaScript Document
$( "#popup" ).click(function( event ) {
	alert("触发成功！");
});

$( "#disappear" ).click(function( event ) {
	$( this ).hide( "slow" );
});

$( "#fadeout" ).click(function( event ) {
	$( this ).animate({opacity: 0.5});
});

$( "#reset" ).click(function( event ) {
	$( "#disappear" ).show( "slow" );
	$( "#fadeout" ).animate({opacity: 1});
});