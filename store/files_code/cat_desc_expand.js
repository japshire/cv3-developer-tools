/* ================================================================ 
This copyright notice must be untouched at all times.
Copyright (c) 2009 Stu Nicholls - stunicholls.com - all rights reserved.
=================================================================== */
$(document).ready(function(){

$(".hidden").hide();
$(".show").html("+ read more");

$(".show").click(function() {
if (this.className.indexOf('clicked') != -1 ) {
		$(this).prev().slideUp(500);
		$(this).removeClass('clicked')
		$(this).html("+ read more");
		}
		else {
		$(this).addClass('clicked')
		$(this).prev().slideDown(500);
		$(this).html("- read less");
		}
});

});