/*
 Developer: xmc; 100528
*/

// IE6背景图片缓存
if(jQuery.browser.msie && parseInt(jQuery.browser.version, 10) == 6) {
  try {
    document.execCommand("BackgroundImageCache", false, true);
  } catch(err) {}
}

function addFavorite(){　 // 加入收藏
	if (document.all){
		window.external.addFavorite('http://www.jumaimai.com', '聚买卖团购商城，省钱又放心！');
	}else if (window.sidebar){
		window.sidebar.addPanel('聚买卖团购商城，省钱又放心！', 'http://www.jumaimai.com', "");
	}
}

function setHomepage(){　 // 设为首页
	if (document.all){
		document.body.style.behavior = 'url(#default#homepage)';
		document.body.setHomePage('http://www.xiaotuanzi.com');
	}else if (window.sidebar){
		if (window.netscape){
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}catch (e) {
				alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true");
				return false;
			}
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage', 'http://www.xiaotuanzi.com');
	}
}

function formatMoney(num) { // 格式化金额
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
	num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();
	if(cents<10)
	cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	//num = num.substring(0,num.length-(4*i+3))+','+  加上分隔符
	num = num.substring(0,num.length-(4*i+3))+
	num.substring(num.length-(4*i+3));
	return (((sign)?'':'-') + num + '.' + cents);
}

function submit_search () {
	$('#search_form').submit();
}
// document!ready!
$(document).ready(function() {
	// 表单onfocus高亮
	$(".form input[type='text'],.form input[type='password'],.form textarea").focus(function(){
     $(this).addClass('on_input').blur(function(){
         $(this).removeClass('on_input')
     })
  });

	$('.nav_showcart,.cart_pop').hover(function(){
	    $('.cart_pop').show();
	  }, function(){											  
	  	$('.cart_pop').hide(); 
	});
	
	
	//Tabs
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

	// 倒计时
	function countDown () {
		var currentTime = (new Date()).getTime()/1000; // 将当前时间计算拿出循环外
		$(countdown_hash).each(function(i,arr) {
			var diffSecs = Math.floor(arr[1] - currentTime);
			if(diffSecs>0){
				secs = diffSecs % 60;
				mins = Math.floor(diffSecs/60)%60;
				hours = Math.floor(diffSecs/60/60);
				if (arr[0].attr('title') == "big_countdown"){
					arr[0].html(hours+'小时&nbsp;'+mins+'分钟&nbsp;'+secs+'秒')
				}else{
					hours = Math.floor(diffSecs/60/60);
					arr[0].html(hours+':'+mins+':'+secs)
				}
			};
		})
	}
	var countdown_hash= new Array();
	if ($('.countdown').length > 0){
		$('.countdown').each(function(i,n) { // 将需要倒计时的结束时间拿出来生成数组,这样不需要每次倒计时都要取页面
			countdown_hash[i] = [$(this),$(this).attr('alt')]
		})
		window.setInterval(countDown, 1000)
	}
	
});

