<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #735dff;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            margin-top: 20px;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #605dff;
            color: #fff;
            cursor: pointer;
        }

        th a {
            color: inherit;
            text-decoration: none;
        }

        th:hover {
            background-color: #4540a5;
        }

        td {
            background-color: #fff;
            vertical-align: middle;
        }

        .btn {
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0069d9;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }
    </style>
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

    <form id="searchForm" method="get">
        <input type="text" name="search" id="searchInput" placeholder="Search by name">
        <button type="submit">Search</button>
    </form>


    <div>
        <select id="userTypeSelect" class="form-control">
            <option value="select">Select</option>
            <option value="all">All Users</option>
            <option value="students">Students</option>
        </select>
    </div>
    <br>


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
        <button onclick="window.location.href='${pageContext.request.contextPath}/redirectToAdd'"
                class="btn btn-success">
            ADD NEW USER
        </button>
        <br>
        <br>
        </tbody>
        <tbody id="userListId">
        </tbody>
    </table>
</div>

<script>

    fetchPersons();

    document.getElementById('userTypeSelect').addEventListener('change', function () {
        fetchPersons();
    });

    function compareAzerbaijaniStrings(a, b) {
        return a.localeCompare(b, 'az', {sensitivity: 'base'});
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

    // Function to perform live search
    document.getElementById('searchInput').addEventListener('input', function() {
        fetchPersons();
    });

    // Function to handle dropdown change
    function fetchPersons() {
        document.getElementById('userListId').innerHTML = '';

        var userType = document.getElementById('userTypeSelect').value // Get the selected user type
        var searchInput = document.getElementById('searchInput').value; // Get the current search input value

        // Construct the API URL based on the selected user type
        var apiUrl = userType === 'students' ? '/searchStudents' : '/searchAll';

        // Send AJAX request to backend API
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Update user table with new HTML content
                var persons = JSON.parse(xhr.responseText);
                var html = ''; // Initialize an empty string to store HTML

                // Iterate over each user in the array
                persons.forEach(function (user) {
                    // Construct HTML for each user row
                    html += '<tr>';
                    html += '<td>' + user.id + '</td>';
                    html += '<td>' + user.name + '</td>';
                    html += '<td>' + user.surname + '</td>';
                    html += '<td>' + user.middleName + '</td>';
                    html += '<td><a href="http://localhost:8080/redirectUser?id=' + user.id + '" class="btn btn-primary">Edit</a></td>';
                    html += '<td><button onclick="deleteUser(' + user.id + ')" class="btn btn-danger">Delete</button></td>';
                    html += '</tr>';
                });

                // Update the user table with the generated HTML
                document.getElementById('userListId').innerHTML = html;
            }
        };
        xhr.open('GET', apiUrl + '?search=' + searchInput, true);
        xhr.send();
    }


</script>
</body>
</html>