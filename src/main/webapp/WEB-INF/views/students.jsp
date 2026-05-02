<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Students</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
    h1 { color: #2c3e50; }
    table { width: 100%; border-collapse: collapse; background: white; margin-bottom: 30px; }
    th { background: #8e44ad; color: white; padding: 10px; }
    td { padding: 10px; border-bottom: 1px solid #ddd; }
    tr:hover { background: #f0f0f0; }
    a { background: #27ae60; color: white; padding: 8px 14px; text-decoration: none; border-radius: 4px; margin-right: 5px; }
    a.edit { background: #2980b9; }
    .btn-add { display: inline-block; margin-bottom: 15px; }
  </style>
</head>
<body>
<h1>All Students</h1>
<a href="/students/add" class="btn-add">+ Add Student</a>
<a href="/courses" class="btn-add" style="background:#2c3e50">View Courses</a>
<table>
  <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Course</th><th>Action</th></tr>
  <c:forEach var="student" items="${students}">
    <tr>
      <td>${student.id}</td>
      <td>${student.name}</td>
      <td>${student.email}</td>
      <td>${student.phone}</td>
      <td>${student.course.title}</td>
      <td><a href="/students/edit/${student.id}" class="edit">Edit</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>