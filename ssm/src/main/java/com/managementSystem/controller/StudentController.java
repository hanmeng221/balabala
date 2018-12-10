package com.managementSystem.controller;


import com.managementSystem.pojo.*;
import com.managementSystem.service.StudentService;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
@SessionAttributes("user")
public class StudentController {
    @Autowired
    StudentService studentService;

    //进入首页
    @RequestMapping(value = "/home")
    public String gotoIndex(Model model, HttpSession session){
        return "student/home";
    }
    //进入课程页
    @RequestMapping(value = "/course")
    public String gotoCourse(){
        return "student/course";
    }

    //进入作业页
    @RequestMapping(value = "/assignment")
    public String gotoAssignment(HttpSession session, Model model){
        User user = (User) session.getAttribute("currentUser");
        List<Group_Student> gsList = studentService.getGroupStudent(user.getUserId());
        List<Group> groups = studentService.getGroupByGroupStudentList(gsList);
        model.addAttribute("group_student",gsList);
        model.addAttribute("groups",groups);
        return "student/assignment";
    }

    //查看作业列表
    @RequestMapping(value = "/browseAssignment")
    public String gotoBrowseAssignment(HttpServletRequest request, Model model){
        String id = request.getParameter("groupId");
        Integer groupId = Integer.parseInt(id);
        List<Group_Assignment> ga = studentService.getGroupAssignmentByGroupId(groupId);
        model.addAttribute("group_assignment",ga);
        return "student/browseAssignment";
    }

    //进入作业上传页
    @RequestMapping(value = "/uploadAssignment")
    public String gotoUploadAssignment(){
        return "student/uploadAssignment";
    }
    //进入小组信息页
    @RequestMapping(value = "/group")
    public String gotoGroup(){
        return "student/group";
    }
    //进入添加小组页
    @RequestMapping(value = "/addGroup")
    public String gotoAddGroup(){
        return "student/addGroup";
    }




}
