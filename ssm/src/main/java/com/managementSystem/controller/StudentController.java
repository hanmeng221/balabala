package com.managementSystem.controller;


import com.managementSystem.dao.UserMapper;
import com.managementSystem.pojo.*;
import com.managementSystem.service.StudentService;
import com.managementSystem.service.TeacherService;
import com.managementSystem.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/student")
@SessionAttributes("user")
public class StudentController {
    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;


    //首页
    @RequestMapping(value = "/home")
    public String gotoIndex(Model model, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        User studnet = studentService.getUserById(user.getUserId());
        model.addAttribute("student",studnet);
        return "student/home";
    }

    //课程页
    @RequestMapping(value = "/course")
    public String gotoCourse(HttpSession session,HttpServletRequest request, Model model){
        User user = (User) session.getAttribute("currentUser");
        List<Student_Course> scList = studentService.getCourseListByUserId(user.getUserId());
        model.addAttribute("studentCourse",scList);
        return "student/course";
    }

    //课程详细信息
    @RequestMapping(value = "/courseInfo")
    public String gotoCourseInfo(HttpServletRequest request, Model model){
        String courseId = request.getParameter("courseId");
        int id = Integer.parseInt(courseId);
        Course course = teacherService.getCurrentCourse(id);
        User teacher = studentService.getUserById(course.getTeacherId());
        model.addAttribute("course",course);
        model.addAttribute("currentCourseTeacherName",teacher.getUserName());
        return "student/courseInfo";
    }



    //进入作业页
    @RequestMapping(value = "/assignment")
    public String gotoAssignment(HttpSession session, Model model){
        User user = (User) session.getAttribute("currentUser");
        List<Group_Student> gsList = studentService.getGroupStudent(user.getUserId());
        List<String> courseName = studentService.getCourseNameByGroupStudentList(gsList);
        model.addAttribute("group_student",gsList);
        model.addAttribute("courseName",courseName);
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

    //作业上传(成功：跳转至assignment，失败则刷新uploadAssignment)
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public  String uploadAssignment(@RequestParam(value = "assignmentId") String assignmentId,
                                    @RequestParam(value = "groupId")Integer groupId,
                                    @RequestParam(value = "title")String title,
                                    @RequestParam(value="body")String body,
                                    Model model, HttpSession session, HttpServletRequest request)throws ParseException
    {
        //Group_Assignment ga = new Group_Assignment();
        User user = (User) session.getAttribute("currentUser");

        Integer userGroupId = studentService.getGroupIdByStudentId(user.getUserId());
        //小组号校验 && 作业号校验
        if(userGroupId.equals(groupId) && studentService.existAssignment(assignmentId)){
            //如果已有<作业号，小组号>的作业，那么先删除该作业
            if(studentService.existGroupAssignment(assignmentId,groupId)){
                studentService.deleteGroupAssignment(assignmentId,groupId);
            }
            //上传(学生)作业
            String rootPath = "C:\\Users\\marco\\Desktop\\balabala\\assignment\\";
            //添加数据库记录
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            Date date = new Date();
            df.format(date);
            Group_Assignment ga = new Group_Assignment();
            ga.setAssignmentId(assignmentId);
            ga.setGroupId(groupId);
            ga.setTitle(title);
            ga.setBody(rootPath + body);
            ga.setSubmissionTime(date);
            studentService.insertGroupAssignment(ga);
            return  "redirect:/student/assignment";
        }
        else{
            return "redirect:/student/uploadAssignment";
        }
    }

    //进入小组信息页
    @RequestMapping(value = "/group")
    public String gotoGroup(Model model, HttpSession session)
    {
        User user = (User) session.getAttribute("currentUser");
        Integer groupId = studentService.getGroupIdByStudentId(user.getUserId());
        //取出学生所属的小组信息
        Group group = studentService.getGroupByStudentId(groupId);
        model.addAttribute("group",group);
        //取出该小组的所有成员
        List<Group_Student> gsList = teacherService.getGroupStudents(groupId.intValue());
        model.addAttribute("gsList",gsList);
        return "student/group";
    }


    //进入创建小组页
    @RequestMapping(value = "/addGroup")
    public String gotoAddGroup()
    {
        return "student/addGroup";
    }

    //进入添加小组成员页
    @RequestMapping(value = "/addGroupMember")
    public String gotoAddGroupMember(Model model, HttpSession session)
    {
        User user = (User) session.getAttribute("currentUser");
        Integer groupId = studentService.getGroupIdByStudentId(user.getUserId());
        //取出学生所属的小组信息
        Group group = studentService.getGroupByStudentId(groupId);
        model.addAttribute("group",group);
        //取出所有的学生
        List<User> userList = studentService.getAllStudent();
        List<User> studentWithoutGroup = studentService.getGroupByStudentList(userList);
        model.addAttribute("studentWithoutGroup",studentWithoutGroup);
        return "student/addGroupMember";
    }
    @RequestMapping(value = "/selectGroupMember")
    public String gotoSelectGroupMember(Model model, HttpSession session, HttpServletRequest request)
    {
        String studentId = request.getParameter("studentId");
        if(studentId.isEmpty()){ //获取记录失败
            return "redirect:/student/addGroupMember";
        }
        User user = (User) session.getAttribute("currentUser");
        Integer groupId = studentService.getGroupIdByStudentId(user.getUserId());
        Group group = studentService.getGroupByStudentId(groupId);
        Course course = teacherService.getCurrentCourse(group.getCourseId());
        if(user.getUserId().equals(group.getLeaderId())){//只有组长才可以添加组员
            if(studentService.getCountGroupMember(groupId) < course.getGroupCapacityMax()){ //当前小组人数小于课容量
                //group_student表更新

                studentService.insertGroupStudent(groupId,studentId);
            }

        }
        return "redirect:/student/group";
    }

    //增加创建小组功能
    //增加小组成员删除功能



}
