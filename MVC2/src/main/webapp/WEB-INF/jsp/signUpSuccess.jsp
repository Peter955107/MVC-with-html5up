<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>error</title>
</head>
    <body>
        <form action="<c:url value="/index.html" />" method="post">
        <table align="center" >
            <tr>
                <td>註冊成功</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="返回" />
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>