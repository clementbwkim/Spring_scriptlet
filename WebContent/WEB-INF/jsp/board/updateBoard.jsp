<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.spring.board.vo.BoardVO" %>
<%@ page import="com.spring.board.controller.BoardController" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
    
<% 
		request.setCharacterEncoding("EUC-KR");
%>

<% 
		List<BoardVO> aList = new ArrayList<>();
		BoardVO bvo = new BoardVO();
		
		Object obj = request.getAttribute("aList");
		aList = (ArrayList)obj;
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
				$(document).ready(function(){
					alert("(log) jquery >>> ");
					
					$("#rkpwCheck").click(function(){
						var kpw = $("#kpw").val();
						var rkpw = $("#rkpw").val();
						
						if(kpw == rkpw){
							alert("비밀번호가 일치합니다.");
							$("#kmemo").focus();
							
						}else{
							alert("비밀번호가 일치하지 않습니다. 다시 입력하세요!");
							$("#kpw").focus('');
						}
					});
					
					$("#sndbtn").click(function(){
						alert("(log) #sndbtn >>> ");
						
						var kpw = $("#kpw").val();
						var ksubject = $("#ksubject").val();
						var kname = $("#kname").val();	
						var kmemo = $("#kmemo").val();
						
						if(ksubject == ""){
							alert("제목을 입력하세요");
							$("#ksubject").focus();
							return;
						} 
						if(!kname){
							alert("이름을 입력하세요");
							$("#kname").focus();
							return;
						}
						if(!kpw){
							alert("비밀번호를 입력하세요");
							$("#kpw").focus();
							return;
						}
						if(!kmemo){
							alert("내용을 입력하세요");
							$("#kmemo").focus();
							return;
						}
						alert(" >>>>>> ");
							$("#mform").attr("action", "/board/updateBoard.kbw").submit();
						
						});
					});
				
					$("#sabtn").click(function(){
						alert("(log) #sabtn >>> ");
						$("#mform").attr("action", "/board/listBoard.kbw").submit();
					});
		</script>
				
	<body>
		<form id="mform" name="mform" method="POST" enctype="multipart/form-data">
			<table border="1" align="center">
<% 
			for(int i = 0; i < aList.size(); i++){
				bvo = aList.get(i);
%>
				<tr>
					 <td colspan="2" align="center">게시판 글쓰기</td>
				</tr>
				<tr>
					 <td align="center">글번호</td>
					 <td><input type="text" name="kno" id="kno" size="20" readonly value=<%=bvo.getKno() %>></td>
				</tr>
				<tr>
	  				<td align="center"><strong>사진첨부</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20" value=<%=bvo.getKimg() %>>
  					</td>
	  			</tr>
				<tr>
					 <td align="center">제목</td>
					 <td><input type="text" name="ksubject" id="ksubject" size="53" value="<%=bvo.getKsubject()%>"></td>
				</tr>
				<tr>
					 <td align="center">이름</td>
					 <td><input type="text" name="kname" id="kname" size="53" readonly value=<%=bvo.getKname() %>></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="kpw" id="kpw" size="20" value=<%=bvo.getKpw() %>></td>
				</tr>
				<tr>
					<td align="center">비밀번호확인</td>
					<td ><input type="password" name="rkpw" id="rkpw" size="20">
						 <input type="button" id="rkpwCheck" value="비밀번호 확인"></td>
				</tr>
				<tr>
					 <td align="center">입력일</td>
				<td><input type="text" name="kinsertdate" size="20" disabled value=<%=bvo.getKinsertdate() %>></td>
				</tr>
				<tr>
					 <td align="center">수정일</td>
					 <td><input type="text" name="kupdatedate" size="20" disabled value=<%=bvo.getKupdatedate()%>></td>
				</tr>
				<tr>
					 <td align="center">내용</td>
					 <td>
					 	<textarea name="kmemo" id="kmemo" rows="10" cols="50" value=<%=bvo.getKmemo() %>></textarea>
					 </td>
				</tr>
				<tr>
					 <td colspan="2" align="center">
					 	<input type="hidden" id="isudType" name="isudType">
					 	<input type="button" id="sndbtn" name="sndbtn" value="등록" >
					 	<input type="button" id="sabtn" name="sabtn" value="글목록">
					 </td>
				</tr>
				<%} %>
			</table>
		</form>
	</body>
</html>