<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>註冊</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" /></noscript>
		<script>
			<c:if test="${accountCheck==false}">
				alertOut();
			</c:if>
			function alertOut(){alert("帳號已經存在!");}
			function checkSignUp(){
				var signUpPasswd = document.getElementById("signUpPasswd").value;
				var signUpConfirmPasswd = document.getElementById("signUpConfirmPasswd").value;
				var signUpAge = document.getElementById("signUpAge").value;
				if(signUpPasswd != signUpConfirmPasswd ){
				    alert("密碼不符合");
				    return false;
				}
				else if( signUpAge<0 || signUpAge>99 || !(Math.floor(signUpAge) == signUpAge)){
					alert("年齡有效範圍[0~99]");
					return false;
				}
			}
        </script>
	</head>
	
	<body>
		<div id="wrapper">
			<div style="width:70%;">
			<c:if test="${accountCheck==false}">
				<div align="center" ><font color="red">帳號已經存在!</font></div>
			</c:if>
		        <article  id="contact" class="active">
		        	<h1 class="major">註冊</h1>
			        <form action="<c:url value="/signUpCheck.html" />" method="post"  onsubmit="return checkSignUp()">
			        	<div class="fields">
							<div class="field">
								<label for="editName">姓名</label>
								<input type="text" name="signUpName"/>
							</div>
							<div class="field">
								<label for="editAccount">帳號</label>
								<input type="text" name="signUpAccount"/>
							</div>
							<div class="field">
								<label for="editPasswd">密碼</label>
								<input type="password" name="signUpPasswd" id="signUpPasswd" required/>
							</div>
							<div class="field">
								<label for="confirmPasswd">確認密碼</label>
								<input type="password" name="signUpConfirmPasswd" id="signUpConfirmPasswd" required/>
							</div>
							<div class="field">
								<label for="editEmail">E-MAIL</label>
								<input type="email" name="signUpEmail" required/>
							</div>
							<div class="field">
							<label for="editGender">性別</label>
							</div>
								<div class="field half">
									<input type="radio" id="man" name="signUpGender" value='男' required>
									<label for="man">男</label>
								</div>
								<div class="field half">
									<input type="radio" id="woman" name="signUpGender" value='女'>
									<label for="woman">女</label>
								</div>
							<div class="field">
								<label for="editAge">年齡</label>
								<input type="text" name="signUpAge" id="signUpAge" required/>
							</div>
						</div>
						
						<ul class="actions">
							<li><input type="submit" value="註冊" class="primary" /></li>
							<li><input type="reset" value="重置" /></li>
						</ul>
			        </form>
		        </article>
	        </div>
        </div>
        <div id="bg"></div>
		<!--
		<form action="<c:url value="/signUpCheck.html" />" method="post"  onsubmit="return checkSignUp()">
		<table align="center" border=1>
			
			<tr>
	        	<td>姓名：</td><td><input type="text" name="signUpName" required/></td>
	        </tr>	
	        <tr>
	        	<td>帳號：</td><td><input type="text" name="signUpAccount" required/></td>
	        </tr>    
	        <tr>
	            <td>密碼：</td><td><input type="password" name="signUpPasswd" id="signUpPasswd" required/></td>
	        <tr/>
	        <tr>
	            <td>確認密碼：</td><td><input type="password" name="signUpConfirmPasswd" id="signUpConfirmPasswd" required/></td>
	        <tr/>
	        <tr>
	        	<td>E-MAIL：</td><td><input type="email" name="signUpEmail" required/></td>
	        </tr>
	        <tr>
				<td>
					<input type='radio' name='signUpGender' value='男' >男 
					<input type='radio' name='signUpGender' value='女' >女 
				</td>
	        </tr>
	        <tr>
	        	<td>年齡：</td><td><input type="text" name="signUpAge" id="signUpAge" required/></td>
	        </tr>
	        <tr>
		        <td colspan="2" align="center">
		            <input type="submit" value="註冊" id="check" />
		            <input type="reset" value="重設" />
		        </td>
	        </tr>        
		</table>
		</form>
		  -->
	  <!-- Scripts -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	</body>
</html>