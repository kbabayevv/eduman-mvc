<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Determinant Calculator</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
        }

        form {
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
            resize: none;
        }

        button[type="button"], input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="button"]:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 30px;
            text-align: center;
        }

        .result h2 {
            color: #343a40;
            margin-bottom: 10px;
        }

        .result p {
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Determinant Calculator</h1>

    <form id="determinantForm" action="${pageContext.request.contextPath}/calculate" method="post"
          onsubmit="calculateDeterminant(event)">
        <label for="matrix">Enter Matrix:</label><br>
        <textarea id="matrix" name="matrix" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="Calculate Determinant">
    </form>

    <div class="result" id="resultSection" style="display: none;">
        <h2>Result:</h2>
        <p id="result"></p>
    </div>
</div>

<script>
    function calculateDeterminant(event) {
        event.preventDefault(); // Prevent the default form submission

        var form = document.getElementById('determinantForm');
        var formData = new FormData(form);

        fetch(form.action, {
            method: 'POST',
            body: formData
        })
            .then(response => response.text())
            .then(data => {
                // Update the result section with the calculated determinant
                document.getElementById('result').textContent = "The determinant is: " + data;
                document.getElementById('resultSection').style.display = 'block'; // Show the result section
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>
</body>
</html>
