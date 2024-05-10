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
    <script>
        function sortTable(columnIndex) {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("personTable");
            switching = true;
            while (switching) {
                switching = false;
                rows = table.getElementsByTagName("tr");
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("td")[columnIndex];
                    y = rows[i + 1].getElementsByTagName("td")[columnIndex];
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
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
    </script>
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
    <table id="personTable" class="table table-bordered">
        <thead>
        <tr>
            <th><a href="#" onclick="sortTable(0)">ID</a></th>
            <th><a href="#" onclick="sortTable(1)">Name</a></th>
            <th><a href="#" onclick="sortTable(2)">Surname</a></th>
            <th><a href="#" onclick="sortTable(3)">Middle Name</a></th>
            <th>Edit</th>
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
                    <a href="${pageContext.request.contextPath}/redirectPerson?id=${person.id}" class="btn btn-primary">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
