<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script>
        function compareAzerbaijaniStrings(a, b) {
            return a.localeCompare(b, 'az', { sensitivity: 'base' });
        }


        function sortTableForAzerbaijani(columnIndex) {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("userTable");
            switching = true;
            while (switching) {
                switching = false;
                rows = table.getElementsByTagName("tr");
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("td")[columnIndex];
                    y = rows[i + 1].getElementsByTagName("td")[columnIndex];
                    if (compareAzerbaijaniStrings(x.innerHTML, y.innerHTML) > 0) {
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }

        function sortTableForID(columnIndex) {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("userTable");
            switching = true;
            while (switching) {
                switching = false;
                rows = table.getElementsByTagName("tr");
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = parseInt(rows[i].getElementsByTagName("td")[columnIndex].innerHTML);
                    y = parseInt(rows[i + 1].getElementsByTagName("td")[columnIndex].innerHTML);
                    if (x > y) {
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }


        function deleteUser(userId) {
            if (confirm("Are you sure you want to delete this user?")) {
                window.location.href = "${pageContext.request.contextPath}/deleteUser/" + userId;
            }
        }
    </script>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: rgb(96,71,255)">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand">User List</a>
        </div>
    </nav>
</header>
<br>
<div class="container col-md-10">
    <table id="userTable" class="table table-bordered">
        <thead>
        <tr>
            <th><a href="#" onclick="sortTableForID(0)">ID</a></th>
            <th><a href="#" onclick="sortTableForAzerbaijani(1)">Name</a></th>
            <th><a href="#" onclick="sortTableForAzerbaijani(2)">Surname</a></th>
            <th><a href="#" onclick="sortTableForAzerbaijani(3)">Middle Name</a></th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <tbody>
        <button onclick="window.location.href='${pageContext.request.contextPath}/redirectToAdd'" class="btn btn-success">
            ADD NEW USER
        </button>
        <br>
        <br>
        </tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${user.middleName}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/redirectUser?id=${user.id}"
                       class="btn btn-primary">Edit</a>
                </td>
                <td>
                    <button onclick="deleteUser(${user.id})" class="btn btn-danger">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
