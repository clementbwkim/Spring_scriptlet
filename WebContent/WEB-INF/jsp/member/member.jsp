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
			
			$("#formTitle").text("ȸ����������");
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
						alert("���̵� �Է����ּ���..");
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
								alert("��밡���� ���̵��Դϴ�.");
								$("#kpw").focus();
							}else{
								alert("������� ���̵��Դϴ�.");
								$("#kid").val("").focus();
							}
						}
					}
				});
				$("#rkpwCheck").click(function(){
					var kpw = $("#kpw").val();
					var rkpw = $("#rkpw").val();
					
					if(kpw == rkpw){
						alert("��й�ȣ�� ��ġ�մϴ�.");
						$("#kgender").focus();
						kpwFlag = true;
					}else{
						alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�, �ٽ� �Է��ϼ���.");
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
		                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

		                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
		                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
		                var extraRoadAddr = ''; // ���� �׸� ����

		                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
		                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
		                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
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
						<strong>ȸ������</strong>
						</td>
				</tr>
				<tr>
					<td width="100" align="center">ȸ����ȣ</td>
					<td width="250">
							&nbsp;<input type="text" name="kmem" id="kmem" readonly="readonly"><br>
							<font size="2">*����/����/��ȸ �� ȸ����ȣ ���</font>
					</td>
				</tr>
				<tr>
	  				<td align="center"><strong>ȸ������</strong></td>
	  				<td><input type="file" id="kimg" name="kimg" size="20">
  					</td>
	  			</tr>
				<tr>
					<td align="center">�ѱ��̸�</td>
					<td>&nbsp;<input type="text" name="kkname" id="kkname"></td>
				</tr>
				<tr>
					<td align="center">�����̸�</td>
					<td>&nbsp;<input type="text" name="kename" id="kename"></td>
				</tr>
				<tr>
					<td align="center">���̵�</td>
					<td><input type="text" name="kid" id="kid" size="20">
					<input type="button" name="kidCheck" id="kidCheck" value="���̵�Ȯ��"></td>
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
					<td align="center">����</td>
					<td>&nbsp;<input type="text" id="kgender" name="kgender"></td>
				</tr>
				<tr>
					<td align="center" width="110" height="50">�޴�����ȣ</td>
					<td>&nbsp;<input type="text" id="khp" name="khp"></td>
				</tr>
				<tr>
					<td align="center">�������</td>
					<td>&nbsp;<input type="text"  name="kbirth" id="kbirth"></td>
				</tr>
				<tr>
					<td align="center">�̸����ּ�</td>
					<td><input type="text" name="kemail" id="kemail" size="20">@
						<select name="eselect" id="eselect">
							<option>gmail.com</option>
							<option>hotmail.com</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>yahoo.co.kr</option>
							<option>�����Է�</option>
						</select>
			       </td>
				</tr>
				<tr>
					<td align="center">�����ȣ</td>
					<td>
					<!-- input type="text" name="kpostNo"-->
						&nbsp;<input type="text" id="kpostno" size="20" name="kpostno" placeholder="�����ȣ">
						&nbsp;<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
					</td>
				</tr>
				<tr>
					<td align="center">�����ּ�</td>
					<td>
					<!--<input type="text" name="kaddr">-->
							<input type="text" id="kaddr" name="kaddr" size="30" placeholder="���θ��ּ�">
							<input type="text" id="kaddrdetail" name="kaddrdetail" size="30" placeholder="���ּ�">
					</td>
				</tr>
				<tr>
					<td align="center">��������</td>
					<td>&nbsp;<input type="text" name="kdeleteYN" disabled="disabled"></td>
				</tr>
				<tr>
					<td align="center">�����</td>
					<td>&nbsp;<input type="text" id="kinsertdate" name="kinsertdate" disabled="disabled"></td>
				</tr>
				<tr>
					<td align="center">������</td>
					<td>&nbsp;<input type="text" id="kupdatedate" name="kupdatedate" disabled="disabled"></td>
				</tr>
				<tr>
					<td colspan="5" align="center">
						<input type="hidden" id="isudType" name="isudType">
						<input type="button" value="����" id="ibtn">
						<!-- <input type="button" value="��ȸ" id="sbtn">-->
						<input type="button" value="����" id="ubtn" name="ubtn">
						<input type="button" value="����" id="dbtn">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="���" id="cbtn" name="cbtn">
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>