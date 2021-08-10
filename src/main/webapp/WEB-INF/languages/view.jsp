<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><c:out value="${language.title}"></c:out></title>
    </head>
    <body>
    	<a href="/languages">Dashboard</a>
        <h1><c:out value="${language.name}"></c:out></h1>
        <p>Description: <c:out value="${language.creator}"></c:out></p>
        <p>Language: <c:out value="${language.currentVersion}"></c:out></p>
        <a href="/languages/${language.id}/edit">Edit</a>
        <form action="/languages/${language.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
    </body>
</html>