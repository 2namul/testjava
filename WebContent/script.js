function cartUpdate(form){
	form.flag.value="update";
		form.submit();
}

function cartDelete(form){
	form.flag.value="del";
	form.submit();
}
function Update(mem_id){
	document.update.mem_id.value=mem_id;
	document.update.submit();
}
function zipCheck(){
	url="../Zipcheck.jsp?check=y";
	window.open(url,"post","toolbar=no,width=500,height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}

//product
function productDetail(no){
	document.detail.no.value=no;
	document.detail.submit();
	
}

function productUpdate(no){
	document.update.no.value=no;
	document.update.submit();
}

function productDelete(no){
	document.del.no.value=no;
	document.del.submit();
	
}

//order
function orderDetail(no){
	document.detail.no.value=no;
	document.detail.submit();
}
function orderUpdate(form){
	form.flag.value="update";
	form.submit();
}
function orderDelete(no){
	form.flag.value="delete";
	form.submit();
}






function idCheck(id){
    if(id==""){
        alert("아이디를입력해주세요");
        document.regForm.mem_id.focus();
    }else{
        url="IdCheck.jsp?mem_id="+id;
        window.open(url,"post","width=300,height=150");
    }
}

function zipCheck(){
    url="ZipCheck.jsp?check=y";
    window.open(url,"post","toolbar=no ,width=500 ,heigth=300 ,directories=no, status=yes, scrollbars=yes,menubar=no");
}

function memberView(){
	document.location="memberView.jsp";
}

function loginCheck(){
    if(document.login.mem_id.value==""){
		alert("아이디를 입력해 주세요.");
		document.login.mem_id.focus();
		return;
    }
    if(document.login.mem_passwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.login.mem_passwd.focus();
		return;
    }
    
    console.log(document.login.mem_id);
    
	document.login.submit();
}

function memberReg(){
	document.location="Register.jsp";
}


function inputCheck(){
    if(document.regForm.mem_id.value==""){
        alert("아이디를 입력해 주세요.");
        document.regForm.mem_id.focus();
        return;
    }
    
    if(document.regForm.mem_passwd.value==""){
        alert("비밀번호를 입력해 주세요");
        document.regForm.mem_passwd.focus();
        return;
    }
    if(document.regForm.mem_repasswd.value==""){
        alert("비밀번호확인을 입력해 주세요");
        document.regForm.mem_repasswd.focus();
        return;
    }
    if(document.regForm.mem_passwd.value!=document.regForm.mem_repasswd.value){
        alert("비밀번호가 일치하지 않습니다.");
        document.regForm.mem_repasswd.focus();
        return;
    }
    if(document.regForm.mem_name.value==""){
        alert("이름 입력해 주세요");
        document.regForm.mem_name.focus();
        return;
    }
 
    if(document.regForm.mem_num1.value==""){
        alert("생년월일을 입력해 주세요");
        document.regForm.mem_num1.focus();
        return;
    }

    if(document.regForm.mem_email.value==""){
        alert("email를 입력해 주세요");
        document.regForm.mem_email.focus();
        return;
    }
    let str = document.regForm.mem_email.value;
    let atPos = str.indexOf('@');
    let atLastPos=str.lastIndexOf('@');
    let dotPos=str.indexOf('.');
    let spacePos = str.indexOf(' ');
    let commaPos = str.indexOf(',');
    let eMailSize = str.length;

    if(atPos > 1 && atPos == atLastPos&&dotPos>3&&spacePos==-1&&commaPos==-1&&commaPos==-1&&atPos+1<dotPos&&dotPos+1<eMailSize)
    	{
    	
    	}
    else{
        alert("e-메일주소형식이 잘못되었습니다\r\n다시 입력해주세요!")
        document.regForm.mem_email.focus();
        return;
    }
    
    if(document.regForm.mem_phone.value==""){
        alert("전화번호를 입력해 주세요");
        document.regForm.mem_phone.focus();
        return;
    }
    if(document.regForm.mem_zipcode.value==""){
        alert("zipcode입력해주세요");
        document.regForm.mem_zipcode.focus();
        return;
    }
    if(document.regForm.mem_address.value==""){
        alert("주소를 입력해 주세요");
        document.regForm.mem_address.focus();
        return;
    }

    if(document.regForm.mem_job.value=="0"){
        alert("직업을 선택해 주세요");
        document.regForm.mem_job.focus();
        return;
    }
    
    document.regForm.submit();

}