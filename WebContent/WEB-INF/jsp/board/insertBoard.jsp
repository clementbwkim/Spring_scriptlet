<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.spring.board.controller.BoardController" %>
<%@ page import="com.spring.board.vo.BoardVO" %> 
<%@ page import="com.spring.board.service.BoardService" %>    
<%@ page import="com.spring.board.service.BoardServiceImpl" %>    
<%@ page import="java.util.List" %>    
<%@ page import="java.util.ArrayList" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertBoard</title>
	</head>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script> 
		<script type="text/javascript">
			$(document).ready(function(){
			
			<%
				String mode = (String)request.getAttribute("mode");
				System.out.println(mode);
				
				if(mode.equals("update")) {
					System.out.println("update >>>>> ");
					BoardVO kvo = (BoardVO)request.getAttribute("boardList");
			%>

			$("#formTitle").text("�� ����");
			$("#kno").val("<%= kvo.getKno()%>");
			$("#ksubject").val("<%= kvo.getKsubject()%>");
			$("#kname").val("<%= kvo.getKname()%>");
			$("#kpw").val("<%= kvo.getKpw()%>");
			$("#kmemo").val("<%= kvo.getKmemo()%>");
			$("#kdeleteyn").val("<%= kvo.getKdeleteyn()%>");
			$("#kinsertdate").val("<%= kvo.getKinsertdate()%>");
			$("#kupdatedate").val("<%= kvo.getKupdatedate()%>");
<%
		}
%>		
			
				
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
					alert("(log) #sndbtn ���� >>> ");
					
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
				$("#bform").attr("action", "/board/insertBoard.kbw").submit();
					
				});
				
				$("#ubtn").click(function(){
					alert("(log) #ubtn ���� >>> ");
					$("#isudType").val("UOK");
					$("#bform").attr("action", "/board/updateBoard.kbw").submit();
				});
				
				$("#sabtn").click(function(){
					alert("(log) #sabtn ���� >>> ");
					$("#bform").attr("action", "/board/listBoard.kbw").submit();
				});
				
				$('.kmemo-content').keyup(function(){
					cut_300(this);
				});
				$('.kmemo-content').click(function(){
					if(getTextLength($('.kmemo-content').val()) > 300){
						alert("���ڴ� 300����Ʈ ���Ϸ� �����ּ���. ");
						return false;
					}else{
						alert("���ڰ� 300����Ʈ �����Դϴ�.");
					}
				});
			
			});
			
			function getTextLength(str){
				var len = 0;
				for(var i = 0; i < str.length; i++){
					if(escape(str.charAt(i)).length==6){
						len++;
					}
					len++;
				}
				return len;
			}
			function cut_300(obj){
				var text = $(obj).val();
				var leng = text.length;
				while(getTextLength(text) > 300){
					leng--;
					text = text.substring(0, leng);
				}
				$(obj).val(text);
				$('.bytes').text(getTextLength(text));
			}
			
		</script>
	<body>
		<form id="bform" name="bform" method="POST" enctype="application/x-www-form-urlencoded">
			<table border="1" align="center">
				<tr>
					 <td colspan="2" align="center">�Խ��� �۾���</td>
				</tr>
				<tr>
					 <td align="center">�۹�ȣ</td>
					 <td><input type="text" name="kno" id="kno" size="20" readonly="readonly"></td>
				</tr>
				<tr>
	  				<td align="center"><strong>����÷��</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20">
  					</td>
	  			</tr>
				<tr>
					 <td align="center">����</td>
					 <td><input type="text" name="ksubject" id="ksubject" size="53"></td>
				</tr>
				<tr>
					 <td align="center">�̸�</td>
					 <td><input type="text" name="kname" id="kname" size="53"></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="kpw" id="kpw" size="20"></td>
				</tr>
				<tr>
					<td align="center">��й�ȣȮ��</td>
					<td ><input type="password" name="rkpw" id="rkpw" size="20">
						 <input type="button" id="rkpwCheck" value="��й�ȣ Ȯ��"></td>
				</tr>
				<tr>
					 <td align="center">�Է���</td>
				<td><input type="text" name="kinsertdate" id="kinsertdate" size="20" disabled></td>
				</tr>
				<tr>
					 <td align="center">������</td>
					 <td><input type="text" name="kupdatedate" id="kupdatedate" size="20" disabled></td>
				</tr>
				<tr>
					 <td align="center">����</td>
					 <td>
					 	<textarea name="kmemo" id="kmemo" rows="10" cols="50" class="kmemo-content"></textarea>
					 	<div class="bytes-wrapper">
							<span class="bytes">0</span>bytes	
						</div>
					 </td>
				</tr>
				<tr>
					 <td colspan="2" align="center">
					 	<input type="hidden" id="isudType" name="isudType">
					 	<input type="button" id="sndbtn" name="sndbtn" value="���" >
					 	<input type="button" id="ubtn" name="ubtn" value="����" >
					 	<input type="button" id="sabtn" name="sabtn" value="�۸��">
					 </td>
				</tr>
			</table>
		</form>
	</body>
</html>