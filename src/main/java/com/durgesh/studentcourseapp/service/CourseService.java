package com.durgesh.studentcourseapp.service;

import com.durgesh.studentcourseapp.entity.Course;
import com.durgesh.studentcourseapp.entity.Student;
import com.durgesh.studentcourseapp.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourseById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }

    public void saveCourse(Course course) {
        courseRepository.save(course);
    }

    public void updateCourse(Course course) {
        courseRepository.save(course);
    }

    public List<Student> getAllStudentsWithCourse() {
        return courseRepository.findAllStudentsWithCourse();
    }
}