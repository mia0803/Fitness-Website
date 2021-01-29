
(function($){

	$(window).on('load', function(){
		var selected_menu = $('body').attr('id');
		$('.side-bar > p#'+ selected_menu).addClass("selected-page");
	})
	
	/*------------table search box----------------*/
	
	$( "#memberInput" ).keyup(function() {
		var input, filter, table, td, i, txtValue;
	 	input = $(this);
	 	filter = input.val().toUpperCase();
	 	table = $('#memberTable');
	 	tr = $('tr')
	 	
	 	$('tr').each(function() {
	 		td = $(this).find("td").eq(4).html(); 
	 		if (td) {
	  			if (td.toUpperCase().indexOf(filter) > -1) {
	  				$(this).show();
	  			} else {
	  				$(this).hide();
	  			}
	  		}   
	 	});
	});
	
	$( "#classInput" ).keyup(function() {
		var input, filter, table, td, i, txtValue;
	 	input = $(this);
	 	filter = input.val().toUpperCase();
	 	table = $('#classTable');
	 	tr = $('tr')
	 	
	 	$('tr').each(function() {
	 		td = $(this).find("td").eq(1).html(); 
	 		if (td) {
	  			if (td.toUpperCase().indexOf(filter) > -1) {
	  				$(this).show();
	  			} else {
	  				$(this).hide();
	  			}
	  		}   
	 	});
	});
	
	
	
	/*-----------adminBoard page-----------*/
    
    $('.side-bar > p#main').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/adminBoard.jsp";
    })
    
    $('.side-bar > p#member-info').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/memberInfo.jsp";
    	
    })
	
	$('.side-bar > p#teacher-info').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/teacherInfo.jsp";
    	
    })
	
	$('.side-bar > p#transactions').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/transactions.jsp";
    	
    })

	$('.side-bar > p#mng-locations').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/manageLocation.jsp";
    	
    })
	
	$('.side-bar > p#mng-clubs').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/manageClubs.jsp";
    	
    })

	$('.side-bar > p#mng-classes').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/manageClasses.jsp";
    	
    }) 
    
    $('.side-bar > p#refund-history').on('click', function(){
    	window.location="/fitnessProject/b-my-account/admin-board/refundHistory.jsp";
    	
    })   

    $('.deactivate-btn').on('click', function(){
    	var id = $(this).attr('id');
    	var w = window.open('/fitnessProject/b-my-account/admin-board/deactivateMemberPro.jsp?state=deact&id='+id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Change user state"; }
    })
	
	$('.activate-btn').on('click', function(){
    	var id = $(this).attr('id');
    	var w = window.open('/fitnessProject/b-my-account/admin-board/deactivateMemberPro.jsp?state=act&id='+id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Change user state"; }
    })
	
	$('.refund-btn').on('click', function(){
		var id = $(this).attr('id');
		var w = window.open('/fitnessProject/b-my-account/admin-board/refundPro.jsp?id='+id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Refund process"; }
	})
	
	/*---------------location page-----------*/
	$('.add-location').on('click', function(){
		var w = window.open('/fitnessProject/c-locations/addLocation.jsp', 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Add Location"; }
    })
	
	$('.edit-loc-btn').on('click', function(){
    	var location = $(this).attr('id');
    	var w = window.open('/fitnessProject/c-locations/editLocation.jsp?location='+location, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Edit Location"; }
    })
	
	$('.delete-loc-btn').on('click', function(){
    	var location = $(this).attr('id');
    	var w = window.open('/fitnessProject/c-locations/deleteLocationPro.jsp?location='+location, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Delete Location"; }
    })
	
	/*------------club page----------------*/
	
	$('.club-edit-btn').on('click', function(){
    	var name = $(this).attr('id');
    	var w = window.open('/fitnessProject/d-clubs/editClub.jsp?name='+name, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Edit Club"; }
    })
    
    $('.club-delete-btn').on('click', function(){
    	var name = $(this).attr('id');
    	var w = window.open('/fitnessProject/d-clubs/deleteClubPro.jsp?name='+name, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Delete Club"; }
    })
	
	/*------------classes page-----------------*/
	$('.class-edit-btn').on('click', function(){ 
		var class_id = $(this).attr('id');
		var w = window.open('/fitnessProject/e-classes/editClass.jsp?class_id='+class_id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Edit Class"; }
    	
    })
    
    $('.class-delete-btn').on('click', function(){
    	var class_id = $(this).attr('id');
		var w = window.open('/fitnessProject/e-classes/deleteClassPro.jsp?class_id='+class_id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Delete Class"; }
	
    })
    
    
    
	
	
	
})(jQuery);

























