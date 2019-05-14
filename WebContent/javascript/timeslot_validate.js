/**
 * 
 */

function validateFrom() {
	//get data
	var error="";
	var sTime=document.forms['myForm']['sTime'].value;
	var fTime=document.forms['myForm']['fTime'].value;
	
	//validation
	if(sTime===""){
		error+="Start Time must be filled! \n"
	}
	if(fTime===""){
		error+="Finish Time must be filled!";
	}
	
	if(error===""){
		return true;
	}
	alert(error);
	return false;
}