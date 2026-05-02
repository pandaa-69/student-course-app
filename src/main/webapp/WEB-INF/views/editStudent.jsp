<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 25px; border-radius: 8px; width: 400px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #2980b9; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #2980b9; text-decoration: none; margin-left: 15px; }
    </style>
</head>
<body>
<h1>Edit Student</h1>
<form action="/students/edit/${student.id}" method="post">
    <label>Name:</label>
    <input type="text" name="name" value="${student.name}" required />
    <label>Email:</label>
    <input type="email" name="email" value="${student.email}" required />
    <label>Phone:</label>
    <input type="text" name="phone" value="${student.phone}" required />
    <label>Course:</label>
    <select name="courseId" required>
        <c:forEach var="course" items="${courses}">
            <option value="${course.id}" ${student.course.id == course.id ? 'selected' : ''}>${course.title}</option>
        </c:forEach>
    </select>
    <button type="submit">Update Student</button>
    <a href="/students">Cancel</a>
</form>
</body>
</html>