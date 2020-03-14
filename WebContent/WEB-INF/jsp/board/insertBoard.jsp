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

			$("#formTitle").text("글 수정");
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
						alert("비밀번호가 일치합니다.");
						$("#kmemo").focus();
						
					}else{
						alert("비밀번호가 일치하지 않습니다. 다시 입력하세요!");
						$("#kpw").focus('');
					}
				});
	
				$("#sndbtn").click(function(){
					alert("(log) #sndbtn 들어옴 >>> ");
					
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
				$("#bform").attr("action", "/board/insertBoard.kbw").submit();
					
				});
				
				$("#ubtn").click(function(){
					alert("(log) #ubtn 들어옴 >>> ");
					$("#isudType").val("UOK");
					$("#bform").attr("action", "/board/updateBoard.kbw").submit();
				});
				
				$("#sabtn").click(function(){
					alert("(log) #sabtn 들어옴 >>> ");
					$("#bform").attr("action", "/board/listBoard.kbw").submit();
				});
				
				$('.kmemo-content').keyup(function(){
					cut_300(this);
				});
				$('.kmemo-content').click(function(){
					if(getTextLength($('.kmemo-content').val()) > 300){
						alert("문자는 300바이트 이하로 적어주세요. ");
						return false;
					}else{
						alert("문자가 300바이트 이하입니다.");
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
					 <td colspan="2" align="center">게시판 글쓰기</td>
				</tr>
				<tr>
					 <td align="center">글번호</td>
					 <td><input type="text" name="kno" id="kno" size="20" readonly="readonly"></td>
				</tr>
				<tr>
	  				<td align="center"><strong>사진첨부</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20">
  					</td>
	  			</tr>
				<tr>
					 <td align="center">제목</td>
					 <td><input type="text" name="ksubject" id="ksubject" size="53"></td>
				</tr>
				<tr>
					 <td align="center">이름</td>
					 <td><input type="text" name="kname" id="kname" size="53"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="kpw" id="kpw" size="20"></td>
				</tr>
				<tr>
					<td align="center">비밀번호확인</td>
					<td ><input type="password" name="rkpw" id="rkpw" size="20">
						 <input type="button" id="rkpwCheck" value="비밀번호 확인"></td>
				</tr>
				<tr>
					 <td align="center">입력일</td>
				<td><input type="text" name="kinsertdate" id="kinsertdate" size="20" disabled></td>
				</tr>
				<tr>
					 <td align="center">수정일</td>
					 <td><input type="text" name="kupdatedate" id="kupdatedate" size="20" disabled></td>
				</tr>
				<tr>
					 <td align="center">내용</td>
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
					 	<input type="button" id="sndbtn" name="sndbtn" value="등록" >
					 	<input type="button" id="ubtn" name="ubtn" value="수정" >
					 	<input type="button" id="sabtn" name="sabtn" value="글목록">
					 </td>
				</tr>
			</table>
		</form>
	</body>
</html>