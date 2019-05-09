/**
 * 
 */

function validateFrom() {
	//get data
	var reply=document.forms['myForm']['reply'].value;
	
	if(reply==""){
		alert("Reply must be filled out!");
		return false;
	}
	return true;
}