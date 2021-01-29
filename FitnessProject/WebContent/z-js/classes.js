(function($){
	"use strict";
	

    /*-------Modal Box-------------*/
    $('.class-schedule-btn').on('click', function(){
    	$('.theModal').show();
    	
    	var today = $(this).attr('id');
    	showText(today);
    });
    
    $('.close').on('click', function(){
    	$('.theModal').hide();
    });
    
    $(window).on('click', function(event){
    	if($(event.target).is('.theModal')){
    		$('.theModal').hide();
    	}
    })
    
    $('.class-btn').on('click', function(){
    	var btn = $(this).data('showingbutton');
    	showText(btn);
    })
    
    function showText(btn) {
    	$('.schedule-content').hide();
    	$('[data-button]').hide();
    	$('[data-showingbutton]').removeClass('clicked');
    	
    	$('[data-showingbutton='+ btn +']').addClass('clicked');
    	$('[data-button='+ btn +']').show();
    }
    
    $('.become-member').on('click', function(){
    	window.location="/fitnessProject/a-homepage/registration1.jsp";
    })
    
    
    /*-------class button small window-----------*/
    
    $('.class-add-btn').on('click', function(){
    	var club_name = $(this).attr('id');
    	var w = window.open('/fitnessProject/e-classes/addClass.jsp?club_name='+club_name, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
    	w.onload = function() { this.document.title = "Add A Class"; }
    })
    
	
    $(window).on('load', function(){
    	var time3 = $('select[name = "time3"]').attr('id');
    	var day = $('select[name = "c_day"]').attr('id');
    	$("select[name = 'time3']").val(time3);
    	$("select[name = 'c_day']").val(day);
    })
    
    
    /*------class edit button----------*/
    $('.first-edit').on('click', function(){
    	$('.hide').show();
    	$(this).hide();
    	$('.class-edit-btn').show();
    })
    
    $('.class-edit-btn').on('click', function(){ 
    	var class_id = $('input[name="select-class"]:checked').val();
    	if(class_id != null){
    		var w = window.open('/fitnessProject/e-classes/editClass.jsp?class_id='+class_id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
        	w.onload = function() { this.document.title = "Edit Class"; }
    	} else{
    		$('.hide').hide();
        	$(this).hide();
        	$('.first-edit').show();
    	}
    })
    
    
    /*---------------class delete button---------------*/
    $('.first-delete').on('click', function(){
    	$('.hide').show();
    	$(this).hide();
    	$('.class-delete-btn').show();
    })
    
    $('.class-delete-btn').on('click', function(){ 
    	var class_id = $('input[name="select-class"]:checked').val();
    	if(class_id != null){
    		var w = window.open('/fitnessProject/e-classes/deleteClassPro.jsp?class_id='+class_id, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
        	w.onload = function() { this.document.title = "Delete Class"; }
    	} else{
    		$('.hide').hide();
        	$(this).hide();
        	$('.first-delete').show();
    	}
    })
    
    /*-------------class add to my schedule button---------*/
    
    $('.first-select').on('click', function(){
    	$('.hide').show();
    	$(this).hide();
    	$('.add-to-schedule').show();
    })
    
    $('.add-to-schedule').on('click', function(){ 
    	var class_id = $('input[name="select-class"]:checked').val();
    	var club_name = $(this).attr('id');
    	if(class_id != null){
    		var w = window.open('/fitnessProject/e-classes/addToSchedulePro.jsp?class_id='+class_id +'&club_name='+club_name, 'toolbar=no, location=no, status=no, menubar=no, add_location', 'scrollbars=yes, resizable=yes, width=700, height=500');
        	w.onload = function() { this.document.title = "Add to my schedule"; }
    	} else{
    		$('.hide').hide();
        	$(this).hide();
        	$('.first-select').show();
    	}
    })
	
	
	
})(jQuery)



