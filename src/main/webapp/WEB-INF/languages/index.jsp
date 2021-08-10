<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Languages</title>
    </head>
    <body>
        <h1>All Languages</h1>
		<table>
		    <thead>
		        <tr>
		            <th>Title</th>
		            <th>Description</th>
		            <th>Language</th>
		            <th>Number of Pages</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${languages}" var="language">
			        <tr>
			            <td><a href="/language/${language.id}"><c:out value="${language.name}"/></a></td>
			            <td><c:out value="${language.creator}"/></td>
			            <td><c:out value="${language.currentVersion}"/></td>
			            <td>
			            	<a href="/languages/${language.id}/edit">edit</a>
			            	<span> | </span>
			            	<form action="/languages/${language.id}" method="post">
			            		<input type="hidden" name="_method" value="delete"/>
			            		<input type="submit" value="delete"/>
			            	</form>
			            </td>
			        </tr>
		        </c:forEach>
		    </tbody>
		</table>
		 <h1>New Language</h1>
		<form:form action="/languages" method="post" modelAttribute="language">
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
		    <input type="submit" value="Add Language"/>
		</form:form>
    </body>
</html>