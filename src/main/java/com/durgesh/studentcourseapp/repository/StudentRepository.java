package com.durgesh.studentcourseapp.repository;

import com.durgesh.studentcourseapp.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {
}