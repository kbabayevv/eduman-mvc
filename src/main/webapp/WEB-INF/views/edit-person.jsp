<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Edit Person</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand">Edit Person</a>
        </div>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/updatePerson" method="post">
                <fieldset class="form-group">
                    <label>Person Name</label>
                    <input type="text" class="form-control" name="name" required>
                </fieldset>

                <fieldset class="form-group">
                    <label>Person Surname</label>
                    <input type="text" class="form-control" name="surname">
                </fieldset>

                <fieldset class="form-group">
                    <label>Person Middle Name</label>
                    <input type="text" class="form-control" name="middleName">
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
