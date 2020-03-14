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
							alert("��й�ȣ�� ��ġ�մϴ�.");
							$("#kmemo").focus();
							
						}else{
							alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���!");
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
							alert("������ �Է��ϼ���");
							$("#ksubject").focus();
							return;
						} 
						if(!kname){
							alert("�̸��� �Է��ϼ���");
							$("#kname").focus();
							return;
						}
						if(!kpw){
							alert("��й�ȣ�� �Է��ϼ���");
							$("#kpw").focus();
							return;
						}
						if(!kmemo){
							alert("������ �Է��ϼ���");
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
					 <td colspan="2" align="center">�Խ��� �۾���</td>
				</tr>
				<tr>
					 <td align="center">�۹�ȣ</td>
					 <td><input type="text" name="kno" id="kno" size="20" readonly value=<%=bvo.getKno() %>></td>
				</tr>
				<tr>
	  				<td align="center"><strong>����÷��</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20" value=<%=bvo.getKimg() %>>
  					</td>
	  			</tr>
				<tr>
					 <td align="center">����</td>
					 <td><input type="text" name="ksubject" id="ksubject" size="53" value="<%=bvo.getKsubject()%>"></td>
				</tr>
				<tr>
					 <td align="center">�̸�</td>
					 <td><input type="text" name="kname" id="kname" size="53" readonly value=<%=bvo.getKname() %>></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="kpw" id="kpw" size="20" value=<%=bvo.getKpw() %>></td>
				</tr>
				<tr>
					<td align="center">��й�ȣȮ��</td>
					<td ><input type="password" name="rkpw" id="rkpw" size="20">
						 <input type="button" id="rkpwCheck" value="��й�ȣ Ȯ��"></td>
				</tr>
				<tr>
					 <td align="center">�Է���</td>
				<td><input type="text" name="kinsertdate" size="20" disabled value=<%=bvo.getKinsertdate() %>></td>
				</tr>
				<tr>
					 <td align="center">������</td>
					 <td><input type="text" name="kupdatedate" size="20" disabled value=<%=bvo.getKupdatedate()%>></td>
				</tr>
				<tr>
					 <td align="center">����</td>
					 <td>
					 	<textarea name="kmemo" id="kmemo" rows="10" cols="50" value=<%=bvo.getKmemo() %>></textarea>
					 </td>
				</tr>
				<tr>
					 <td colspan="2" align="center">
					 	<input type="hidden" id="isudType" name="isudType">
					 	<input type="button" id="sndbtn" name="sndbtn" value="���" >
					 	<input type="button" id="sabtn" name="sabtn" value="�۸��">
					 </td>
				</tr>
				<%} %>
			</table>
		</form>
	</body>
</html>