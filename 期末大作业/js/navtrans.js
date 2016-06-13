//复制来的一段代码，用于减少事件击发次数
// Returns a function, that, as long as it continues to be invoked, will not
// be triggered. The function will be called after it stops being called for
// N milliseconds. If `immediate` is passed, trigger the function on the
// leading edge, instead of the trailing.
function debounce(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) func.apply(context, args);
	};
};

var target;

$(window).on("load resize", function() {
	target = $(".header").height()*3/4;
});

var checkScroll = debounce(function() {
	if ($(window).scrollTop() > target) {
		$(".navbar").removeClass("navbar-transparent");
	} else {
		$(".navbar").addClass("navbar-transparent");
	};
},17);

$(window).on("scroll", checkScroll);