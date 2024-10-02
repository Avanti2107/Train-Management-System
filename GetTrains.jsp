<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Train Information System</title>
</head>
<body>
    <div class="container">
        <h1>Train Information System</h1>
        <form action="fetch_train_info.php" method="POST">
            <div class="form-group">
                <label for="source">Source:</label>
                <select id="source" name="source" required>
                    <option value="">Select Source</option>
                    <!-- Dynamically fetch source options from the database -->
                </select>
            </div>

            <div class="form-group">
                <label for="destination">Destination:</label>
                <select id="destination" name="destination" required>
                    <option value="">Select Destination</option>
                    <!-- Dynamically fetch destination options from the database -->
                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn">Get Train Info</button>
            </div>
        </form>
    </div>
</body>
</html>