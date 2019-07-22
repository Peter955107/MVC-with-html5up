<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${userDetail.account}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" /></noscript>
		<script>
			<c:if test="${editAccountCheck}">
				alertOut();
			</c:if>
			function alertOut(){alert("更新成功!");}
             function checkPassword(){
                var editPasswd = document.getElementById("editPasswd").value;
                var confirmPasswd = document.getElementById("confirmPasswd").value;
                var editAge = document.getElementById("editAge").value;
                if(editPasswd != confirmPasswd ){
                    alert("密碼不符合");
                    return false;
                }
                else if( editAge<0 || editAge>99 || !(Math.floor(editAge) == editAge)){
                	alert("年齡有效範圍[0~99]");
                	return false;
                }
            }
        </script>
	</head>
	
	<body >
		<div id="wrapper">
		<div style="width:70%;">
	        <article  id="contact" class="active">
	        	<h1 class="major">編輯資料</h1>
		        <form action="<c:url value="/userDetail.html" />" method="post"  onsubmit="return checkPassword()">
		        	<div class="fields">
						<div class="field">
							<label for="editName">姓名</label>
							<input type="text" name="editName" value='${userDetail.name}' readonly="readonly"/>
						</div>
						<div class="field">
							<label for="editAccount">帳號</label>
							<input type="text" name="editAccount" value='${userDetail.account}' readonly="readonly"/>
						</div>
						<div class="field">
							<label for="editPasswd">密碼</label>
							<input type="password" name="editPasswd" value='${userDetail.passwd}' id="editPasswd" required/>
						</div>
						<div class="field">
							<label for="confirmPasswd">確認密碼</label>
							<input type="password" name="confirmPasswd" value='${userDetail.passwd}' id="confirmPasswd" required/>
						</div>
						<div class="field">
							<label for="editEmail">E-MAIL</label>
							<input type="email" name="editEmail" value='${userDetail.email}' required/>
						</div>
						<div class="field">
						<label for="editGender">性別</label>
						</div>
							<c:if test="${userDetail.gender=='男'}">
									<div class="field half">
										<input type="radio" id="man" name="editGender" value='男' checked="true">
										<label for="man">男</label>
									</div>
									<div class="field half">
										<input type="radio" id="woman" name="editGender" value='女'>
										<label for="woman">女</label>
									</div>
							</c:if>
							<c:if test="${userDetail.gender=='女'}">
									<div class="field half">
										<input type="radio" id="man" name="editGender" value='男' >
										<label for="man">男</label>
									</div>
									<div class="field half">
										<input type="radio" id="woman" name="editGender" value='女' checked="true">
										<label for="woman">女</label>
									</div>
							</c:if>
						<div class="field">
							<label for="editAge">年齡</label>
							<input type="text" name="editAge" value='${userDetail.age}' id="editAge" required/>
						</div>
					</div>
					
					<ul class="actions">
						<li><input type="submit" value="更新" class="primary" /></li>
						<li><input type="reset" value="重置" /></li>
						<li><input type="button" value="刪除" onclick="location.href='userDelete.html'"/></li>
						<li><input type="button" value="離開" onclick="location.href='main.html'"/></li>
					</ul>
		        </form>
	        </article>
        </div>
        </div>
        <div id="bg"></div>
		<!--
		<form action="<c:url value="/userDetail.html" />" method="post"  onsubmit="return checkPassword()">
		<table align="center" border=1>
			
			<tr>
	        	<td>姓名：</td><td><input type="text" name="editName" value='${userDetail.name}' readonly="readonly" /></td>
	        </tr>	
	        <tr>
	        	<td>帳號：</td><td><input type="text" name="editAccount" value='${userDetail.account}' readonly="readonly"/></td>
	        </tr>    
	        <tr>
	            <td>密碼：</td><td><input type="password" name="editPasswd" value='${userDetail.passwd}' id="editPasswd" required/></td>
	        <tr/>
	        <tr>
	            <td>確認密碼：</td><td><input type="password" name="confirmPasswd" value='${userDetail.passwd}' id="confirmPasswd" required/></td>
	        <tr/>
	        <tr>
	        	<td>E-MAIL：</td><td><input type="email" name="editEmail" value='${userDetail.email}' required/></td>
	        </tr>
	        <tr>
	        	
	        	<td>性別：</td>
		        	<c:if test="${userDetail.gender== '男'}">
						<td>
							<input type='radio' name='editGender' value='男' checked="true">男 
							<input type='radio' name='editGender' value='女'>女 
						</td>
					</c:if>
					
					<c:if test="${userDetail.gender== '女'}">
						<td>
							<input type='radio' name='editGender' value='男'>男 
							<input type='radio' name='editGender' value='女' checked="true">女 
						</td>
					</c:if>
	        	
	        </tr>
	        <tr>
	        	<td>年齡：</td><td><input type="text" name="editAge" value='${userDetail.age}' id="editAge" required/></td>
	        </tr>
	        <tr>
		        <td colspan="2" align="center">
		            <input type="submit" value="更新" id="check" />
		            <input type="reset" value="重設" />
		            <input type="button" value="刪除" onclick="location.href='userDelete.html'">
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