<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 25px; border-radius: 8px; width: 400px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #27ae60; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #2980b9; text-decoration: none; margin-left: 15px; }
        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
<h1>Add New Course</h1>
<c:if test="${param.error}">
    <p class="error">Error: Course could not be saved. Check for duplicates.</p>
</c:if>
<form action="/courses/add" method="post">
    <label>Title:</label>
    <input type="text" name="title" required />
    <label>Duration:</label>
    <input type="text" name="duration" placeholder="e.g. 6 months" required />
    <label>Credits:</label>
    <input type="number" name="credits" required />
    <button type="submit">Save Course</button>
    <a href="/courses">Cancel</a>
</form>
</body>