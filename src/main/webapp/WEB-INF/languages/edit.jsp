<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
    
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Language</title>
    </head>
    <body>
       	<a href="/languages">Dashboard</a> 
		<h1>Edit Language</h1>
		<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
		    <input type="hidden" name="_method" value="put">
		    <p>
		        <form:label path="name">Name</form:label>
		        <form:input path="name"/>
		        <form:errors path="name"/>
		    </p>
		    <p>
		        <form:label path="creator">Creator</form:label>
		        <form:input path="creator"/>
		        <form:errors path="creator"/>
		    </p>
		    <p>
		        <form:label path="currentVersion">Current Version</form:label>
		        <form:input path="currentVersion"/>
		        <form:errors path="currentVersion"/>
		    </p>  
		    <input type="submit" value="Update"/>
		</form:form>
    </body>
</html>