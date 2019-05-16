/**
 * 
 */

$(document).ready(function(){
	
	value1="";
	value2="";
	value3="";
	//function1
	
	$('input[type="date"]').change(function(){	          
	    var value3 = new Date(this.value);	    
	
		if((value1 != "0") && (value2 != "0") && (value3 != "")){
			
			$("#timeTable").load("../javascript/pages/lesson-booking.jsp",{
				pacId:value1,
				timeId:value2,
				date:value3
			});
		}
		
	});
	
	//function2
	$("select").click(function(){
		value1=$("#sel1").val();
		value2=$("#sel2").val();
	});	
});



//data form 
$(document).on('click', ':not(form)[data-confirm]', function(e){
    if(!confirm($(this).data('confirm'))){
        e.stopImmediatePropagation();
        e.preventDefault();
    }
});


