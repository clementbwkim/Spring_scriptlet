<%@page import="com.spring.common.BabySession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(BabySession.getSession(request) != null){
%>
	<script>
		alert("세션이 연결되어 있음");
		history.back();
	</script>	
<%
}
%>


	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script type="text/javascript">
					$(document).ready(function(){ 
						$("#logbtn").click(function(){
							alert("(log)logbtn >>>> ");
							 $("#logform").attr("action", "/member/loginMember.kbw").submit();
					 });
						$("#signupbtn").click(function(){
							alert("(log)signupbtn >>>> ");
							$("#isudType").val("I");
							 $("#logform").attr("action", "/member/insertMember.kbw").submit();					 
					 });
				});
			</script>
		<body>
			<form name="logform"
				  id="logform"
				  method="post"
				  enctype="application/x-www-form-urlencoded">
				<table align="center" border="1">
					<tr>
						<td colspan="2" align="center"> 
							<strong>LOG IN</strong>
						</td>
					</tr>
					<tr>
						<td align="center">ID</td>
						<td>
						<input type="text" name="kid" id="kid">
						</td>
					</tr>
					<tr>
						<td align="center">PASSWORD</td>
						<td>
						<input type="password" name="kpw" id="kpw"><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="hidden" id="isudType" name="isudType">
						<input type="button" value="로그인" id="logbtn" name="logbtn">
						<input type="button" value="회원가입" id="signupbtn" name="signupbtn">
						<input type="reset" value="다시">
						</td>
					</tr>				
				</table>	  	
	  	  	</form>
		</body>
</html>