/**
 * 
 */
function check() {

	if ((document.getElementById("password").value == "")
			|| (document.getElementById("passwordConfirm").value == "")) {
		alert('密码不能为空！');
		return false;
	} else if (document.getElementById("verificationCode").value == "") {
		alert('验证码不能为空！');
		return false;
	} else if (document.getElementById("password").value != document
			.getElementById("passwordConfirm").value) {
		alert('两次输入的密码不一致，请输入相同的密码');
		return false;
	}
	// else if(a.value != document.getElementById("verificationCode").value){
	// alert('验证码不正确，请输入正确验证码！');
	// return false;
	// }
	return true;
};
