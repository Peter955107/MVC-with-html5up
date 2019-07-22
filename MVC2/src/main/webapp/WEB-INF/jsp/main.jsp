<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" charset="UTF-8">
        <title>你好</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/noscript.css" /></noscript>
		
    </head>

<body>
    <div  id="wrapper">
    <article  id="contact" class="active">
    <c:if test="${user.gender== '男'}">
            <h1 class="major">Welcome, Mr. ${user.account};</h1>
    </c:if>
    <c:if test="${user.gender== '女'}">
            <h1 class="major">Welcome, Miss ${user.account};</h1>
    </c:if>
	   	<table >
		   	<thead>
				<tr>
					<th>姓名</th>
					<th>帳號</th>
					<th>E-MAIL</th>
					<th>性別</th>
					<th>年齡</th>
				</tr>
		 	</thead>
		 	<tbody>
			    <c:forEach items="${dataLists}" var="usr" varStatus="idx">
			        <tr>
						<td>${usr.name}</td>
						<td>${usr.account}</td>
						<td>${usr.email}</td>
						<td>${usr.gender}</td> 
						<td>${usr.age}</td>
			            <td><a href='userDetail.html?accountDetail=${usr.account}'>編輯</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>
	</div>
	<div id="bg"></div>
	<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>