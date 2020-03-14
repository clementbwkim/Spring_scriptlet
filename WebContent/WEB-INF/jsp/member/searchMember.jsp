<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.spring.member.vo.MemberVO" %>
<%@ page import="com.spring.member.controller.MemberController" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.util.List" %>

<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("EUC-KR");

	List<MemberVO> aList = new ArrayList();
	MemberVO kvo = null;
	aList = (ArrayList)request.getAttribute("MemberList");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 tdansitional//EN" "http://www.w3.org/td/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script
			  src="https://code.jquery.com/jquery-1.12.4.min.js"
			  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
			  crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#ubtn").click(function(){
					$("#isudType").val("U");
					$("#scform").attr("action", "/member/updateMember.kbw").submit();
				});
				
				$("#dbtn").click(function(){
					$("#scform").attr("action", "/member/deleteMember.kbw").submit();
				});
				$("#obtn").click(function(){
					$("#scform").attr("action", "/member/logOutMember.kbw").submit();
				});
				
				
				/*$("#boardlist").click(function(){
					$("#scform").attr("action", "/member/listMember.kbw").submit();
				});*/
			});
		</script>
	</head>
	<body>


		<form name="scform"
			  id="scform"
			  method="post"
			  enctype="application/x-www-form-urlencoded">
			<table border="1" align="center">
				<tr>
					 <td colspan="16" align="center"><h3>회원정보</h3></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chkAll" id="chkAll"></td>
					<td>회원번호</td>
					<td>회원 사진</td>
					<td>한국이름</td>
					<td>영어이름</td>
					<td>아이디</td>
					<!-- <td>비밀번호</td> -->
					<td>성별</td>
					<td>휴대폰 번호</td>
					<td>생년월일</td>
					<td>이메일 주소</td>
					<td>우편번호</td>
					<td>자택주소</td>
					<td>삭제여부</td>
					<td>등록일</td>
					<td>수정일</td>
				</tr>
				
			<% 
				for(int i = 0; i < aList.size(); i++){
					kvo = aList.get(i);
			%>
				<tr>
					<td align="center">
					<input type="checkbox" name="kmem" value="<%=kvo.getKmem() %>" onclick="checkOnly(this)">
				   	 </td>			
					 <td><%=kvo.getKmem()%></td>
					 <td><img src="../upload/<%= kvo.getKimg() %>" border="0" width="100" height="100"></td>
					 <td><%=kvo.getKkname()%></td>
					 <td><%=kvo.getKename()%></td>
					 <td><%=kvo.getKid()%></td>
					 <!-- <td><%=kvo.getKpw()%></td> -->
					 <td><%=kvo.getKgender()%></td>
					 <td><%=kvo.getKhp()%></td>
					 <td><%=kvo.getKbirth()%></td>
					 <td><%=kvo.getKemail()%></td>
					 <td><%=kvo.getKpostno()%></td>
					 <td><%=kvo.getKaddr()%></td>
					 <td><%=kvo.getKdeleteyn()%></td>
					 <td><%=kvo.getKinsertdate()%></td>
					 <td><%=kvo.getKupdatedate()%></td>
				</tr>
		<% 	
				}
			%>
				<tr>
					<td align="right" colspan="16">
						<input type="hidden" id="isudType" name="isudType">
						<!-- <input type="button" value="글목록" name="boardlist" id="boardlist"> -->
						<input type="button" value="수정하기" name="ubtn" id="ubtn">
						<input type="button" value="삭제하기" name="dbtn" id="dbtn">
						<input type="button" value="로그아웃" name="obtn" id="obtn">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>