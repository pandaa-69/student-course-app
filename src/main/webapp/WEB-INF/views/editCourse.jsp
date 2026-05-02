<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; }
        h1 { color: #2c3e50; }
        form { background: white; padding: 25px; border-radius: 8px; width: 400px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input { width: 100%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #2980b9; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        a { color: #2980b9; text-decoration: none; margin-left: 15px; }
    </style>
</head>
<body>
<h1>Edit Course</h1>
<form action="/courses/edit/${course.id}" method="post">
    <label>Title:</label>
    <input type="text" name="title" value="${course.title}" required />
    <label>Duration:</label>
    <input type="text" name="duration" value="${course.duration}" required />
    <label>Credits:</label>
    <input type="number" name="credits" value="${course.credits}" required />
    <button type="submit">Update Course</button>
    <a href="/courses">Cancel</a>
</form>
</body>
</html>