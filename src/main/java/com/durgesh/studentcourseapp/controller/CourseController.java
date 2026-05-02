package com.durgesh.studentcourseapp.controller;

import com.durgesh.studentcourseapp.entity.Course;
import com.durgesh.studentcourseapp.service.CourseService;
import com.durgesh.studentcourseapp.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("joinResults", courseService.getAllStudentsWithCourse());
        return "courses";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("course", new Course());
        return "addCourse";
    }

    @PostMapping("/add")
    public String addCourse(@ModelAttribute Course course) {
        try {
            courseService.saveCourse(course);
        } catch (Exception e) {
            return "redirect:/courses/add?error=true";
        }
        return "redirect:/courses";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("course", courseService.getCourseById(id));
        return "editCourse";
    }

    @PostMapping("/edit/{id}")
    public String updateCourse(@PathVariable Long id, @ModelAttribute Course course) {
        course.setId(id);
        courseService.updateCourse(course);
        return "redirect:/courses";
    }
}