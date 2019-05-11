/**
 * 
 */

function validateFrom() {
	//get data
	var error="";
	var numLeave=document.forms['myForm']['numLeave'].value;
	var nopay=document.forms['myForm']['nopay'].value;
	
	//validation
	if(numLeave===""){
		error+="Number of Leave must be filled! \n"
	}
	if(nopay===""){
		error+="No pay must be filled out";
	}
	
	if(error==""){
		return true;
	}
	alert(error);
	return false;
}