<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: rgb(96,71,255)">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand">Edit User</a>
        </div>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/updateUser" method="post">
                <fieldset class="form-group">
                    <label>User Name</label>
                    <input type="text" class="form-control" name="name" required>
                </fieldset>

                <fieldset class="form-group">
                    <label>User Surname</label>
                    <input type="text" class="form-control" name="surname" required>
                </fieldset>

                <fieldset class="form-group">
                    <label>User father name</label>
                    <input type="text" class="form-control" name="middleName" required>
                </fieldset>

                <!-- Hidden field to store the person's ID -->
                <input type="hidden" name="id" value="${param.id}">

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
