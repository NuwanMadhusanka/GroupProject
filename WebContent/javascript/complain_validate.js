/**
 * 
 */

function validateFrom() {
	//get data
	var error="";
	var title=document.forms['myForm']['title'].value;
	var complain=document.forms['myForm']['complain'].value;
	
	//validation
	if(title==""){
		error+="Title must be filled! \n"
	}
	if(complain==""){
		error+="Write Your Complain!";
	}
	
	if(error==""){
		return true;
	}
	alert(error);
	return false;
}