package com.durgesh.studentcourseapp.repository;

import com.durgesh.studentcourseapp.entity.Course;
import com.durgesh.studentcourseapp.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {

    // Custom INNER JOIN query
    @Query("SELECT s FROM Student s INNER JOIN s.course c")
    List<Student> findAllStudentsWithCourse();
}