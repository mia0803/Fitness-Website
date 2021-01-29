

(function ($) {
    "use strict";
    
    /*---------home page and top banner----------*/
    $('.go-to-main').on('click', function(){
		window.location="/fitnessProject/a-homepage/main.jsp"
    })
    
    $('.go-to-login').on('click', function(){
		window.location="/fitnessProject/a-homepage/loginForm.jsp"
    })
    
    $('.go-to-location').on('click', function(){
		window.location="/fitnessProject/c-locations/locations.jsp"
    })
    
    $('.go-to-qboard').on('click', function(){
		window.location="/fitnessProject/f-qboard/qBoard.jsp"
    })
    
    $('.go-to-write-post').on('click', function(){
    	var email = $(this).attr('id');
		window.location="/fitnessProject/f-qboard/writePost.jsp?email=" + email
    })
	
	$('.go-to-classpage').on('click', function(){
		window.location="/fitnessProject/a-homepage/classPage.jsp"
    })

	$('.go-to-pt').on('click', function(){
		window.location="/fitnessProject/a-homepage/ptPage.jsp"
    })

	$('.go-to-pilates').on('click', function(){
		window.location="/fitnessProject/a-homepage/pilates.jsp"
    })
    
    
    
    $('.to-my-account').on('click', function(){
    	var user = $(this).attr('id');
    	if(user=="admin"){
    		window.location="/fitnessProject/b-my-account/admin-board/adminBoard.jsp";
    	} else if(user=="teacher"){
    		window.location="/fitnessProject/b-my-account/member-board/memberBoard.jsp";
    	} else if(user=="member"){
    		window.location="/fitnessProject/b-my-account/member-board/memberBoard.jsp";
    	}
    })
    
    $('.log-out-btn').on('click', function(){
		window.location="/fitnessProject/a-homepage/logoutPro.jsp";
	})
    
    $('.close-btn').on('click', function(){
		window.close();
    })
    
    
    $(window).on('unload', function(){
			window.opener.location.reload();
	})
	
	/*-------main slideshow-------*/
	
	var slideIndex = 0;
    $(window).on('load', function(){
    	showSlides();
    })
	
    function showSlides() {
    	
	    $('.mySlides').each(function() {
	    	$( this ).hide();
	    });
	    
		slideIndex++;
		if (slideIndex > $('.mySlides').length) {slideIndex = 1}  
		
		var num = slideIndex-1
		var slide = $(".mySlides:eq(" + num + ")").show();
		
		setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
	
    
    
})(jQuery);


























