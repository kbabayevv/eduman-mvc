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
            background-color: rgb(71, 80, 255);
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
            background-color: rgb(71, 80, 255);
            color: #fff;
            cursor: pointer;
        }

        th a {
            color: inherit;
            text-decoration: none;
        }

        th:hover {
            background-color: rgb(71, 80, 255);
        }

        td {
            background-color: #f5f5f5; /* Change the background color of table cells */
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

        /* Add some padding and margin to the search form and user type select */
        #searchForm, #userTypeSelect {
            margin-bottom: 20px;
        }

        /* Style the search input and button */
        #searchInput {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #searchInput:focus {
            outline: none;
            background-color: rgb(71, 80, 255);
        }

        #searchForm button {
            padding: 8px 15px;
            background-color: rgb(71, 80, 255);
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #searchForm button:hover {
            background-color: rgb(71, 80, 255);
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

    <br>
    <!-- Pagination Button -->
    <div id="pagination">
        <button id="loadMoreBtn" class="btn btn-primary">See More</button>
    </div>

</div>

<script src="/com-users.js"></script>
</body>
</html>