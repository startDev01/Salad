<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <!-- css 적용 -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
 	<link href="../resources/css/header.css" rel="stylesheet" type="text/css" >
	<link href="../resources/css/footer.css" rel="stylesheet" type="text/css" >
	<style>
		.login-form {
           display: inline-block;
            justify-content: center;
            align-items: center;
            margin: 30px;
        }
         .fixed_join{
         padding:5px;
         }
        .btnCen{
        margin-top:30px;
        }
   
	</style>
<c:if test='${result==not empty message }'>
<script>
window.onload=function()
{
	alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}

</script>
</c:if>

</head>

<body>
<h1 align="center">회원 로그인 </h1>
<div id="login_table">
 	<!-- 로그인 클릭 시 /user/login.do로 요청  -->
	<form action="${contextPath}/user/login.do" method="post" class="login-form">
		<table border="1" >
			<tbody>
				<tr class="dot_line"  align="center">
					<td class="fixed_join">아이디</td>
					<td><input name="userId" type="text" size="20" /></td>
				</tr>
				<tr class="solid_line"  align="center">
					<td class="fixed_join">비밀번호</td>
					<td><input name="userPwd" type="password" size="20" /></td>
				</tr>
			</tbody>
		</table>
		<div class="btnCen">
			<input type="submit" value="로그인" class="btnLogin"/> 
			<input type="reset" value="다시입력" class="btnCancel"/>
			<input type="button" onclick="location.href='${contextPath}/user/userForm.do'" value="회원가입" />
		</div>
	</form>	
</div>
</body>
</html>