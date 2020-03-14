<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.spring.member.controller.MemberController" %>
<%@ page import="com.spring.member.vo.MemberVO" %> 
<%@ page import="com.spring.member.service.MemberService" %>    
<%@ page import="com.spring.member.service.MemberServiceImpl" %>    
<%@ page import="java.util.List" %>    
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			$(function(){
	<%
		String mode = (String)request.getAttribute("mode");
		System.out.println(mode);
	
		if(mode.equals("update")){
			System.out.println("update>>>>>>>>>>>");
			MemberVO kvo = (MemberVO)request.getAttribute("MemberList");
	%>
			alert("jquery >>>> ");
			
			$("#formTitle").text("회원정보수정");
			$("#kmem").val("<%= kvo.getKmem() %>");
			$("#kkname").val("<%= kvo.getKkname() %>");
			$("#kename").val("<%= kvo.getKename() %>");
			$("#kid").val("<%= kvo.getKid() %>");
			$("#kpw").val("<%= kvo.getKpw() %>");
			$("#kgender").val("<%= kvo.getKgender() %>");
			$("#khp").val("<%= kvo.getKhp() %>");
			$("#kbirth").val("<%= kvo.getKbirth() %>");
			$("#kemail").val("<%= kvo.getKemail() %>");
			$("#kpostno").val("<%= kvo.getKpostno() %>");
			$("#kaddr").val("<%= kvo.getKaddr() %>");
			$("#kdeleteyn").val("<%= kvo.getKdeleteyn() %>");
			$("#kinsertdate").val("<%= kvo.getKinsertdate() %>");
			$("#kupdatedate").val("<%= kvo.getKupdatedate() %>");
			<%-- $("#kimg").val("<%= kvo.getKimg() %>"); --%>
<%		
	}
%>
				$("#ibtn").click(function(){
					alert("ibtn>>>>");
					//http://localhost:8088/babyServlet/member
					
					if(kid == ""){
						alert("아이디를 입력해주세요..");
						$("#kid").focus();
						return;
					}
					$("#sform").attr("action", "/member/insertMember.kbw").submit();
				});
				$("#kidCheck").click(function(){
					alert("kidCheck >>> ");
					
					chkId(); //callAjax
					
					function chkId(){
						$.ajax({
							type : "post",
							url : "/member/idCheckMember.kbw",
							data : {
									kid : $("#kid").val()
							},
							success : whenSuccess,
						});
						
						function whenSuccess(data){
							var result = data;
							
							if(data == 0){
								alert("사용가능한 아이디입니다.");
								$("#kpw").focus();
							}else{
								alert("사용중인 아이디입니다.");
								$("#kid").val("").focus();
							}
						}
					}
				});
				$("#rkpwCheck").click(function(){
					var kpw = $("#kpw").val();
					var rkpw = $("#rkpw").val();
					
					if(kpw == rkpw){
						alert("비밀번호가 일치합니다.");
						$("#kgender").focus();
						kpwFlag = true;
					}else{
						alert("비밀번호가 일치하지 않습니다, 다시 입력하세요.");
						$("#kpw").focus('');
					}
				});
				
				$("#sbtn").click(function(){
					$("#isudType").val("S");
					$("#sform").attr("action", "/member/selectMember.kbw").submit();			
				});
				
				$("#ubtn").click(function(){
					$("#isudType").val("UOK");
					$("#sform").attr("action", "/member/updateMember.kbw").submit();			
				});
				
				$("#dbtn").click(function(){
					$("#isudType").val("D");
					$("#sform").attr("/member/deleteMember.kbw").submit();
				});
				$("#cbtn").click(function(){
					$("#sform").attr("action", "/member/loginMember.kbw").submit();
				});
				
		});
			
			function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('kpostno').value = data.zonecode;
		                document.getElementById("kaddr").value = roadAddr;
		            }
		        }).open();
		    }
			
			
			
			
			
			
		</script>
	<body>
		<form class="form" id="sform" name="sform" method="post" enctype="multipart/form-data">
			<table border="2" align="center">
				<tr>
						<td colspan="2" align="center" id="formTitle">
						<strong>회원가입</strong>
						</td>
				</tr>
				<tr>
					<td width="100" align="center">회원번호</td>
					<td width="250">
							&nbsp;<input type="text" name="kmem" id="kmem" readonly="readonly"><br>
							<font size="2">*수정/삭제/조회 시 회원번호 사용</font>
					</td>
				</tr>
				<tr>
	  				<td align="center"><strong>회원사진</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20">
  					</td>
	  			</tr>
				<tr>
					<td align="center">한글이름</td>
					<td>&nbsp;<input type="text" name="kkname" id="kkname"></td>
				</tr>
				<tr>
					<td align="center">영어이름</td>
					<td>&nbsp;<input type="text" name="kename" id="kename"></td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="kid" id="kid" size="20">
					<input type="button" name="kidCheck" id="kidCheck" value="아이디확인"></td>
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
					<td align="center">성별</td>
					<td>&nbsp;<input type="text" id="kgender" name="kgender"></td>
				</tr>
				<tr>
					<td align="center" width="110" height="50">휴대폰번호</td>
					<td>&nbsp;<input type="text" id="khp" name="khp"></td>
				</tr>
				<tr>
					<td align="center">생년월일</td>
					<td>&nbsp;<input type="text"  name="kbirth" id="kbirth"></td>
				</tr>
				<tr>
					<td align="center">이메일주소</td>
					<td><input type="text" name="kemail" id="kemail" size="20">@
						<select name="eselect" id="eselect">
							<option>gmail.com</option>
							<option>hotmail.com</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>yahoo.co.kr</option>
							<option>직접입력</option>
						</select>
			       </td>
				</tr>
				<tr>
					<td align="center">우편번호</td>
					<td>
					<!-- input type="text" name="kpostNo"-->
						&nbsp;<input type="text" id="kpostno" size="20" name="kpostno" placeholder="우편번호">
						&nbsp;<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td align="center">자택주소</td>
					<td>
					<!--<input type="text" name="kaddr">-->
							<input type="text" id="kaddr" name="kaddr" size="30" placeholder="도로명주소">
							<input type="text" id="kaddrdetail" name="kaddrdetail" size="30" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td align="center">삭제여부</td>
					<td>&nbsp;<input type="text" name="kdeleteYN" disabled="disabled"></td>
				</tr>
				<tr>
					<td align="center">등록일</td>
					<td>&nbsp;<input type="text" id="kinsertdate" name="kinsertdate" disabled="disabled"></td>
				</tr>
				<tr>
					<td align="center">수정일</td>
					<td>&nbsp;<input type="text" id="kupdatedate" name="kupdatedate" disabled="disabled"></td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<input type="hidden" id="isudType" name="isudType">
						<input type="button" value="가입" id="ibtn">
						<!-- <input type="button" value="조회" id="sbtn">-->
						<input type="button" value="수정" id="ubtn" name="ubtn">
						<input type="button" value="삭제" id="dbtn">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="취소" id="cbtn" name="cbtn">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>