<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Courses</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1, h2 { color: #2c3e50; }
        table { width: 100%; border-collapse: collapse; background: white; margin-bottom: 30px; }
        th { background: #2c3e50; color: white; padding: 10px; }
        td { padding: 10px; border-bottom: 1px solid #ddd; }
        tr:hover { background: #f0f0f0; }
        a { background: #27ae60; color: white; padding: 8px 14px; text-decoration: none; border-radius: 4px; margin-right: 5px; }
        a.edit { background: #2980b9; }
        .btn-add { display: inline-block; margin-bottom: 15px; }
    </style>
</head>
<body>
<h1>All Courses</h1>
<a href="/courses/add" class="btn-add">+ Add Course</a>
<a href="/students" class="btn-add" style="background:#8e44ad">View Students</a>

<table>
    <tr><th>ID</th><th>Title</th><th>Duration</th><th>Credits</th><th>Action</th></tr>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.id}</td>
            <td>${course.title}</td>
            <td>${course.duration}</td>
            <td>${course.credits}</td>
            <td><a href="/courses/edit/${course.id}" class="edit">Edit</a></td>
        </tr>
    </c:forEach>
</table>

<h2>Students Enrolled (Inner Join Result)</h2>
<table>
    <tr><th>Student Name</th><th>Email</th><th>Phone</th><th>Course</th></tr>
    <c:forEach var="student" items="${joinResults}">
        <tr>
            <td>${student.name}</td>
            <td>${student.email}</td>
            <td>${student.phone}</td>
            <td>${student.course.title}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>