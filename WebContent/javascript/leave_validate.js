/**
 * 
 */

function validateFrom() {
	//get data
	var error="";
	var reason=document.forms['myForm']['reason'].value;

	
	//validation
	if(reason==""){
		error+="Reason must be filled! \n"
	}
	
	if(error==""){
		return true;
	}
	alert(error);
	return false;
}