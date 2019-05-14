/**
 * 
 */

function validateFrom() {
	var day=document.forms['myForm']['day'].value;
	var time=document.forms['myForm']['time'].value;
	var packageId=document.forms['myForm']['package'].value;
	
	var error="";
	
	if(day!=null && day != "0"){
		if(time!=null && time != "0"){
			if(packageId!=null && packageId != "0"){
				var transmission=document.querySelector('input[name="transmission"]:checked').value;
				if(transmission =="1" || transmission == "2"){
					var insId=document.forms['myForm']['instructor'].value;
					if(insId!=null && insId != "0"){
						var numStu=document.forms['myForm']['numStu'].value;
						if(numStu != ""){
							return true;
						}
					}
				}
			}
		}
	}
	error="Must Filled All\n";
	alert(error);
	return false;

}

$(document).ready(function(){
	
	$("select").click(function(){
		dayValue=$("#sel1").val();
		timeSlotValue=$("#sel2").val();
		
		if( (dayValue!=null && dayValue!="0") && (timeSlotValue!=null && timeSlotValue!="0")){
			var value1="0";
			$("select").click(function(){
				value1=$("#sel3").val();
				if(value1 != "0"){
					$("#transmission").load("../javascript/pages/lesson-add1.jsp",{
						packageId:value1
					});
					
					
					$("#transmission").click(function(){
					var value2 = $("input[name='transmission']:checked").val();
					if(value2!=null && (value2=="1" || value2=="2")){
						$("#instructor").load("../javascript/pages/lesson-add2.jsp",{
							packageId:value1,
							traId:value2,
							day:dayValue,
							time:timeSlotValue
						});
						$("#instructor").click(function(){
							var value3=$("#sel4").val();
							if(value3!=null && (value3 != "0")){
								$("#vehicle").load("../javascript/pages/lesson-add3.jsp",{
									insId:value3
								});
							}
						});
					}
					});
				}
				
			});
		}
		
	});
	
	
});




