$("a[class~='inPage']").on("click",function(e){
	e.preventDefault();
	
	var dest = $(this).attr("href");
	var minus = $(this).attr("minus");
	
	if (dest=="#") {
		var target = 0;
	} else {
		var target = $(dest).offset().top-minus;
	}
	
	$("body").animate({scrollTop: target}, "slow");
});