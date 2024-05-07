<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Person Details</title>
</head>
<body>
<h1>Person Details</h1>
<table border="1">
    <tr>
        <th>Full Name</th>
        <th>Active</th>
        <th>Birth Date</th>
        <th>Sex</th>
        <th>Organization Name</th>
        <th>Accepted Year</th>
        <th>Photo URL</th>
        <th>Full Address</th>
        <th>Specialty</th>
        <th>Username</th>
        <th>Password</th>
        <th>UOMG Ball</th>
        <th>Mother ID</th>
        <th>Father ID</th>
        <th>Mother Name</th>
        <th>Father Name</th>
    </tr>
    <c:forEach items="${personDetails}" var="person">
        <tr>
            <td>${person.fullName}</td>
            <td>${person.active}</td>
            <td>${person.birthDate}</td>
            <td>${person.sex}</td>
            <td>${person.organizationName}</td>
            <td>${person.acceptedYear}</td>
            <td>${person.photoUrl}</td>
            <td>${person.fullAddress}</td>
            <td>${person.specialty}</td>
            <td>${person.username}</td>
            <td>${person.password}</td>
            <td>${person.uomgBall}</td>
            <td>${person.motherId}</td>
            <td>${person.fatherId}</td>
            <td>${person.motherName}</td>
            <td>${person.fatherName}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
