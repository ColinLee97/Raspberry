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

//定义全局变量target
var target;

//当网页加载或者拖拉窗口尺寸时，将封面海报的四分之三高度赋值给target
$(window).on("load resize", function() {
    target = $(".header").height()*3/4;
});

//定义变更类的函数，用于绑定侦听器
//加入debounce来限制最多每17毫秒执行一次函数，避免过分占用CPU
var checkScroll = debounce(function() {

    //判断页面位置是否大于窗口高度
    if ($(window).scrollTop() > target) {

        //当结果为真，即滚到封面海报以下时，移除.navbar-transparent类
        $(".navbar").removeClass("navbar-transparent");
    } else {

        //反之，则添加透明类
        $(".navbar").addClass("navbar-transparent");
    };
},17);

//将函数与窗口滚动绑定在一起
$(window).on("scroll", checkScroll);