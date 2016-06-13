//所有含有.inPage类名的超链接<a>，给点击事件添加新动作
$("a[class~='inPage']").on("click",function(e){
	//阻止默认动作，即跳转到超链接所指向的页面
	e.preventDefault();
	//获取超链接的href属性，即要跳转到的页面位置
	var dest = $(this).attr("href");
	//需要对高度做出的补偿，由HTML部分定义
	//这是为了通用性，因为要在不同排版的页面中
	//使用这个代码，所以有这么一个属性
	var minus = $(this).attr("minus");
	//判断页面目标位置，若为#（回到顶部）则为零
	if (dest=="#") {
		var target = 0;
	} else {
		var target = $(dest).offset().top-minus;
	}
	//通过jQuery来不断更改当前滚动位置，以实现动画效果
	$("body").animate({scrollTop: target}, "slow");
});