/**
 * 
 */
function checkEmail() {
	if ((documnet.getElementById("emailaddress").value == "")
			|| (documnet.getElementById("emailaddress").value == null)) {
		alert('邮箱不能为空');
		return false;
	} else
		return true;
};