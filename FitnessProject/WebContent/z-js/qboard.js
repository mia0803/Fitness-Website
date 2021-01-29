(function ($) {
    "use strict";
    
	/*----------qboard pagination------------*/
	
	$('a.pagination').on('click', function(){
		if($(this).attr('class')!="not-clickable"){
			var page_num = $(this).attr('id');
			var content = $(this).data('content');
			if(content != null){
				window.location="qBoard.jsp?currunt_page="+page_num+"&search="+content;
			} else{
				window.location="qBoard.jsp?currunt_page="+page_num;
			}
		}
	})

	$('.search-btn').on('click', function(){
		var content = $('.search-box').val();
		if(content==''){
			window.location="qBoard.jsp";
		} else{
			window.location="qBoard.jsp?search="+content;
		}
	})    


    /*-------------qBoard table search box------------*/
    
    $('.post-delete-btn').on('click', function(){
    	var post_id = $(this).attr('id');
    	window.location="/fitnessProject/f-qboard/postDeletePro.jsp?post_id="+post_id
    })
    
    
    $('.delete-comment').on('click', function(){
    	var comment_id = $(this).attr('id');
    	var post_id = $(this).attr('name')
    	window.location="/fitnessProject/f-qboard/commentDeletePro.jsp?comment_id="+comment_id+"&post_id="+post_id
    })

    
    $('.reply-btn').on('click', function(){
    	var comment_id = $(this).attr('id');
    	if($('.'+comment_id).css("display") == "none"){
    		$('.'+comment_id).show();
    	} else{
    		$('.'+comment_id).hide();
    	}
    	
    })
    
    /*$( "input#boardInput" ).keyup(function() {
		var input, filter, table, td, i, txtValue;
	 	input = $(this);
	 	filter = input.val().toUpperCase();
	 	table = $('#boardTable');
	 	
	 	$('tr').each(function() {
	 		td = $(this).find('td').eq(1).html(); 
	 		if (td) {
	  			if (td.toUpperCase().indexOf(filter) > -1) {
	  				$(this).show();
	  			} else {
	  				$(this).hide();
	  			}
	  		}   
	 	});
	});*/
    
    $('tr.post_detail').on('click', function(){
    	var post_id = $(this).attr('id');
    	window.location="/fitnessProject/f-qboard/editContent.jsp?post_id="+post_id 
    	
    })
    
    $('.length-check').on('submit', function(){
    	var title = $('input[name="title"]').val();
    	var content = $('input[name="content"]').val();
    	
		if (title.length<=255 && content.length<=4000 ){
			return true;
		} else{
			alert("Length must be Title<255, Content<4000");
			return false;
		}
	})
	
	$('.comment-length-check').on('submit', function(){
    	var comment = $('input[name="post_comment"]').val();
    	
		if (comment.length<=1000){
			return true;
		} else{
			alert("Must: Comment length < 1000");
			return false;
		}
	})
    
	$('.lock').keypress(function(event){
	    event.preventDefault();
	});
    
    
    
    
    
    
    
    
})(jQuery);