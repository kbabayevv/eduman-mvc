let currentPage = 10;
const pageSize = 10;

// Function to load more users
function loadMoreUsers() {
    // Increment the current page
    currentPage+=10;

    // Call the fetchPersons function to fetch data for the next page
    fetchPersons();
}

document.getElementById("loadMoreBtn").addEventListener("click", loadMoreUsers);


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
        window.location.href = "http://localhost:8080/deleteUser/" + userId;
    }
}


// Function to perform live search
document.getElementById('searchInput').addEventListener('input', function () {
    fetchPersons();
});

function fetchPersons() {
    document.getElementById('userListId').innerHTML = '';

    var userType = document.getElementById('userTypeSelect').value; // Get the selected user type
    var searchInput = document.getElementById('searchInput').value; // Get the current search input value

    // Construct the API URL based on the selected user type
    var apiUrl = userType === 'students' ? '/searchStudents' : '/searchAll';

    // Send AJAX request to backend API with pagination parameters
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
            document.getElementById('userListId').innerHTML += html;
        }
    };
    xhr.open('GET', apiUrl + '?search=' + searchInput + '&page=' + currentPage + '&pageSize=' + pageSize, true);
    xhr.send();
}



