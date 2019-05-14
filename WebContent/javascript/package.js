/**
 * 
 */

function validateForm(){
	var title=document.forms['myForm']['title'].value;
	var category=document.forms['myForm']['category'].value;
	var price=document.forms['myForm']['price'].value;
	var url=document.forms['myForm']['url'].value;
	var des=document.forms['myForm']['description'].value;
	var span=document.forms['myForm']['span'].value;
	alert("Hello");
	var error="";
	if(title===""){
		error+="Title must be filled out!\n";	
	}
	if(category==="0"){
		error+="Category must be select!\n";	
	}
	if(price===""){
		error+="Price must be select!\n";	
	}
	if(des===""){
			error+="Description must be filled out\n";
	}
	if(span != ""){
		error+="No vehicle for selected category\n";
	}
	
	if(error == ""){
		return true;
	}
	alert(error);
	return false;
}

function activeManual(){
		var ch=document.getElementById("manual").checked;
		if(ch){
			document.getElementById("manual").readOnly = false;
		}else{
			document.getElementById("manual").readOnly = false;
		}
		
}

function activeAuto(){
		var ch=document.getElementById("auto").checked;
		if(ch){
			document.getElementById("auto").readOnly = false;
		}else{
			document.getElementById("auto").readOnly = false;
		}
		
}

$(document).ready(function(){
	$("select").click(function(){
		var category=$("#sel1").val();
		if(category != "0"){
			$("#transmission").load("../javascript/pages/package-category.jsp",{
				categoryVal:category
			});
		}
		
	});
});


