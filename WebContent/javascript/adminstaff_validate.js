/**
 * 
 */

function validateFrom() {
	//get data
	var role=document.forms['myForm']['type'].value;
	var qul=document.forms['myForm']['qualification'].value;


	//validate data
	var error="";
	if(role===""){
		error+="Must Select relevant role! \n";
	}
	if (qul==="") {
		error+="Qualification must be filled out! \n";
	}


	if (error=="") {
		return true;
	}
	alert(error);
	return false;
}