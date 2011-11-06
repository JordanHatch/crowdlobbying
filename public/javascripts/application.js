$(function() {
	$('.sorted').tablesorter(); 
	                                    
	var timeout;
	
	// search
	$('#mp_filter').keyup( function(e) {
		clearTimeout(timeout);            
		var item = $(this);
		setTimeout( function(){ filter(e, item) }, 500);
	});                                          
	
	function filter(e, item) {
		if (e.keyCode == 27 || item.val() == '') { 
			$('table#member_causes tbody tr').show();
			item.val('');
		} else {            
			var rxp = item.val().replace(/^ /gi, '');
			
			$('table#member_causes tbody tr').each(function() {  
				($(this).text().search(new RegExp(rxp, "i")) < 0) ? $(this).hide() : $(this).show();  
		  	});
		}
	}
});