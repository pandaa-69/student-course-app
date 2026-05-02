package com.durgesh.studentcourseapp.controller;

import com.durgesh.studentcourseapp.entity.Student;
import com.durgesh.studentcourseapp.service.CourseService;
import com.durgesh.studentcourseapp.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;

    @GetMapping
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("courses", courseService.getAllCourses());
        return "students";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courses", courseService.getAllCourses());
        return "addStudent";
    }

    @PostMapping("/add")
    public String addStudent(@ModelAttribute Student student,
                             @RequestParam Long courseId) {
        try {
            student.setCourse(courseService.getCourseById(courseId));
            studentService.saveStudent(student);
        } catch (Exception e) {
            return "redirect:/students/add?error=true";
        }
        return "redirect:/students";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("student", studentService.getStudentById(id));
        model.addAttribute("courses", courseService.getAllCourses());
        return "editStudent";
    }

    @PostMapping("/edit/{id}")
    public String updateStudent(@PathVariable Long id,
                                @ModelAttribute Student student,
                                @RequestParam Long courseId) {
        student.setId(id);
        student.setCourse(courseService.getCourseById(courseId));
        studentService.updateStudent(student);
        return "redirect:/students";
    }
}