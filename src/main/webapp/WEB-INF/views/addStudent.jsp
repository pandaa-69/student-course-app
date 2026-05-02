<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 25px; border-radius: 8px; width: 400px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #27ae60; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #2980b9; text-decoration: none; margin-left: 15px; }
        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
<h1>Add New Student</h1>
<c:if test="${param.error}">
    <p class="error">Error: Student could not be saved. Check for duplicates.</p>
</c:if>
<form action="/students/add" method="post">
    <label>Name:</label>
    <input type="text" name="name" required />
    <label>Email:</label>
    <input type="email" name="email" required />
    <label>Phone:</label>
    <input type="text" name="phone" required />
    <label>Course:</label>
    <select name="courseId" required>
        <c:forEach var="course" items="${courses}">
            <option value="${course.id}">${course.title}</option>
        </c:forEach>
    </select>
    <button type="submit">Save Student</button>
    <a href="/students">Cancel</a>
</form>
</body>
</html>