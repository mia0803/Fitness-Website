(function($){
	"use strict";
	
	/*-----------------login form page-----------------*/
	$('a.forgot-username').on('click', function(){
		var w = window.open('findUsername.jsp', 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
	    w.onload = function() { this.document.title = "Find username"; }
	})
	
	$('a.forgot-password').on('click', function(){
		var w = window.open('findPassword.jsp', 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
	    w.onload = function() { this.document.title = "Reset password"; }
	})
	
	
	/*-----------registration 4-------------*/ 
	
	$('.validate-checkbox').on('submit', function(){
		if ($('input.agree-btn1').is(':checked') && $('input.agree-btn2').is(':checked')){
			return true;
		} else{
			alert("Please check all checkboxes.");
			return false;
		}
	})
    
    $('.address-srch-box').on('click', function(){ 
		var zipcode = $('input[name="postal"]').val();
		$.ajax({
		    type: "POST",
		    url: "https://secure.shippingapis.com/ShippingAPI.dll",
		    data : {XML:'<CityStateLookupRequest USERID="382NONE01201"><ZipCode ID="0"><Zip5>' + zipcode + '</Zip5></ZipCode></CityStateLookupRequest>' , 
		    		API:"CityStateLookup" },
		    success: function(data) {
		    	var city = $(data).find('CityStateLookupResponse').find('ZipCode').find('City').text();
		    	var state = $(data).find('CityStateLookupResponse').find('ZipCode').find('State').text();
		    	$('input[name="city"]').val(city);
				$('input[name="state"]').val(state);
		    }
		});
	})
    
    
    
    /*-------registration1 modal box---------*/
    $('.select-btn, .reg1-btn').on('click', function(){
    	$('.theModal').show();
    	
    });
    
    $('.close').on('click', function(){
    	$('.theModal').hide();
    });
    
    $(window).on('click', function(event){
    	if($(event.target).is('.theModal')){
    		$('.theModal').hide();
    	}
    })
    
    $('.search-btn').on('keyup', function(e) {
	    if (e.keyCode == 13) {
	    	var location = $(this).val();
	    	$('.large-box').hide();
	    	$('.'+location).show();
	    	
	    }
    });
    
    $('.fa-search').on('click', function(){
    	var location = $('.search-btn').val();
    	$('.large-box').hide();
    	$('.'+location).show();
    })
    
    
    $('.large-box').on('click', function(){
    	var club = $(this).find('.club').text();
    	
    	var location = $('input[class="search-btn"]').val();
    	window.location="registration2.jsp?club="+ club +"&location=" + location;
    })
    
    $('.go-back').on('click', function(){
    	window.history.back();
    })
	
    
	/*---------------registration 3------------------*/
	$('input[name="pw"]').on('focus', function(){
		$('.speech-bubble').show();
	})
	
	$('input[name="pw"]').focusout(function() {
        $('.speech-bubble').hide();
    });
    
    $('.email-validate-btn').on('click', function(){
		var email2 = $('input[name="email"]').val();
		$.ajax({
		    type: "POST",
		    url: "emailValidation.jsp",
		    data : {email: email2 },
		    success: function(data) {
				var list1 = data.split('-');
			
				var comment = list1[0];
				var result = list1[1];
				
		    	$('span.result').html(comment.trim());
				$('span.result').attr('id', result.trim());
		    }
		});
	}) 
	
	
	$('.email-validation').on('submit', function(){
		if($('span.result').attr('id')=="false"){
			return true;
		} else{
			alert("Use validated email.");
			return false;
		}
		
		
	})
	
	
})(jQuery)


























