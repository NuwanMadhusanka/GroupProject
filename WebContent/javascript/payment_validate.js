/**
 * 
 */

function validateFrom() {
	//get data
	var error="";
	var name=document.forms['myForm']['amount'].value;
	if(name==""){
		error+="Amount must be filled!"
			alert(error);
		return false;
	}
	if(name<=0){
		error+="Insert Valid Amount!";
		alert(error);
		return false;
	}
	return true;
}