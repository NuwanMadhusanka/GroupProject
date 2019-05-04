/**
 * 
 */

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
