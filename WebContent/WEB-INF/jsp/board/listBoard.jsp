<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.spring.board.vo.BoardVO" %>
<%@ page import="com.spring.board.controller.BoardController" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>    
<%
	request.setCharacterEncoding("EUC-KR");

	List<BoardVO> aList = new ArrayList();
	BoardVO bvo = null;
	aList = (ArrayList)request.getAttribute("boardList");
	System.out.println("aList >>> : "+aList);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판 목록</title>
		<style type="text/css">
			.tt{
					text-align:center;
					font-weight:bold;
			}
			
		</style>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
				$(document).ready(function(){
					alert("(log) jquery >>>> ");
					$("#ibtn").click(function(){
						alert("(log) #ibtn >>>> ");
						$("#isudType").val("I");
						$("#boardForm").attr("action", "/board/insertBoard.kbw").submit();
					});
					
					$("#ubtn").click(function(){
						alert("(log) #ubtn >>>> ");
						$("#isudType").val("U");
						$("#boardForm").attr("action", "/board/updateBoard.kbw").submit();
					});
					
					$("#dbtn").click(function(){
						alert("(log) #dbtn >>>> ");
						$("#boardForm").attr("action", "/board/deleteBoard.kbw").submit();
						
					});
				});
		</script>
	</head>
	<body>
				<form name="boardForm" id="boardForm" method="POST" enctype="application/x-www-form-urlencoded">
					<table border="2" align="center">
							<thead>
								<tr>
										<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
										<td class="tt">글번호</td>
										<td class="tt">회원사진</td>
										<td class="tt">제목</td>
										<td class="tt">이름</td>
										<td class="tt">비밀번호</td>
										<td class="tt">내용</td>
										<td class="tt">입력일</td>
										<td class="tt">수정일</td>
								</tr>
							</thead>
<% 						
						for(int i = 0; i < aList.size(); i++)
						{
								bvo = aList.get(i);
%>								
								<tbody>
									<tr>
											<td align="center">
												<input type="checkbox" name="kno"
													   id="kno" value=<%= bvo.getKno()%>
													   onclick="checkOnly(this)">
											</td>
											<td align="center"><%=bvo.getKno() %></td>
											<td align="center"><img src=<%= bvo.getKimg() %> border="0" width="100" height="100"></td>
											<td align="center"><%=bvo.getKsubject() %></td>
											<td align="center"><%=bvo.getKname() %></td>
											<td align="center"><%=bvo.getKpw() %></td>
											<td align="center"><%=bvo.getKmemo() %></td>
											<td align="center"><%=bvo.getKinsertdate() %></td>
											<td align="center"><%=bvo.getKupdatedate() %></td>
									</tr>
<% 
						}
%>	
									<tr>
											<td colspan="10" align="right">
													<input type="hidden" name="isudType" id="isudType">
													<input type="button" value="글쓰기" id="ibtn" name="ibtn" >
													<input type="button" value="글수정" id="ubtn" name="ubtn">
													<input type="button" value="글삭제" id="dbtn" name="dbtn">
											</td>
									</tr>
								</tbody>							

						</table>
					</form>
	</body>
</html>