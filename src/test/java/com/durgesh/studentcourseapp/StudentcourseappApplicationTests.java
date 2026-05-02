package com.durgesh.studentcourseapp;

import com.durgesh.studentcourseapp.entity.Course;
import com.durgesh.studentcourseapp.entity.Student;
import com.durgesh.studentcourseapp.repository.CourseRepository;
import com.durgesh.studentcourseapp.repository.StudentRepository;
import com.durgesh.studentcourseapp.service.CourseService;
import com.durgesh.studentcourseapp.service.StudentService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class StudentcourseappApplicationTests {

	@Mock
	private CourseRepository courseRepository;

	@Mock
	private StudentRepository studentRepository;

	@InjectMocks
	private CourseService courseService;

	@InjectMocks
	private StudentService studentService;

	// ---- CourseService Tests ----

	@Test
	void testGetAllCourses() {
		Course c1 = new Course("Data Structures", "6 months", 4);
		Course c2 = new Course("Operating Systems", "6 months", 4);
		when(courseRepository.findAll()).thenReturn(Arrays.asList(c1, c2));

		List<Course> courses = courseService.getAllCourses();
		assertEquals(2, courses.size());
		verify(courseRepository, times(1)).findAll();
	}

	@Test
	void testSaveCourse() {
		Course course = new Course("Machine Learning", "6 months", 4);
		courseService.saveCourse(course);
		verify(courseRepository, times(1)).save(course);
	}

	@Test
	void testGetCourseById() {
		Course course = new Course("DBMS", "4 months", 3);
		course.setId(1L);
		when(courseRepository.findById(1L)).thenReturn(Optional.of(course));

		Course result = courseService.getCourseById(1L);
		assertNotNull(result);
		assertEquals("DBMS", result.getTitle());
	}

	@Test
	void testUpdateCourse() {
		Course course = new Course("Cloud Computing", "4 months", 3);
		courseService.updateCourse(course);
		verify(courseRepository, times(1)).save(course);
	}

	// ---- StudentService Tests ----

	@Test
	void testGetAllStudents() {
		Course course = new Course("DSA", "6 months", 4);
		Student s1 = new Student("Durgesh Kumar", "durgesh@bits.edu", "9876543210", course);
		Student s2 = new Student("Rohit Sharma", "rohit@bits.edu", "9876543211", course);
		when(studentRepository.findAll()).thenReturn(Arrays.asList(s1, s2));

		List<Student> students = studentService.getAllStudents();
		assertEquals(2, students.size());
		verify(studentRepository, times(1)).findAll();
	}

	@Test
	void testSaveStudent() {
		Course course = new Course("DSA", "6 months", 4);
		Student student = new Student("Durgesh Kumar", "durgesh@bits.edu", "9876543210", course);
		studentService.saveStudent(student);
		verify(studentRepository, times(1)).save(student);
	}

	@Test
	void testGetStudentById() {
		Course course = new Course("DSA", "6 months", 4);
		Student student = new Student("Priya Singh", "priya@bits.edu", "9876543212", course);
		student.setId(1L);
		when(studentRepository.findById(1L)).thenReturn(Optional.of(student));

		Student result = studentService.getStudentById(1L);
		assertNotNull(result);
		assertEquals("Priya Singh", result.getName());
	}

	@Test
	void testUpdateStudent() {
		Course course = new Course("DSA", "6 months", 4);
		Student student = new Student("Arjun Mehta", "arjun@bits.edu", "9876543213", course);
		studentService.updateStudent(student);
		verify(studentRepository, times(1)).save(student);
	}
}