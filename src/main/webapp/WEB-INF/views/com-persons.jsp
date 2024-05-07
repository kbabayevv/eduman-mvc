<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Person List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: rgba(105,71,255,0.3)">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand">Person List</a>
        </div>
    </nav>
</header>
<br>
<div class="container col-md-10">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Middle Name</th>
            <th>Edit</th> <!-- New column for Edit -->
        </tr>
        </thead>
        <tbody>
        <c:forEach var="person" items="${personList}">
            <tr>
                <td>${person.id}</td>
                <td>${person.name}</td>
                <td>${person.surname}</td>
                <td>${person.middleName}</td>
                <td>
                    <!-- Edit link redirecting to another JSP file -->
                    <a href="${pageContext.request.contextPath}/redirectPerson?id=${person.id}" class="btn btn-primary">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
