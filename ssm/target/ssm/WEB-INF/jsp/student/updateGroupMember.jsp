<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <title>作业管理系统</title>
    <link href="/static/css/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/static/js/jquery.min.js"></script>

    <script type="text/javascript" src="/static/js/plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript" src="/static/js/plugins/spinner/jquery.mousewheel.js"></script>

    <script type="text/javascript" src="/static/js/jquery-ui.min.js"></script>

    <script type="text/javascript" src="/static/js/plugins/charts/excanvas.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/charts/jquery.flot.js"></script>
    <script type="text/javascript" src="/static/js/plugins/charts/jquery.flot.orderBars.js"></script>
    <script type="text/javascript" src="/static/js/plugins/charts/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="/static/js/plugins/charts/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="/static/js/plugins/charts/jquery.sparkline.min.js"></script>

    <script type="text/javascript" src="/static/js/plugins/forms/uniform.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.cleditor.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/autogrowtextarea.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.maskedinput.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.dualListBox.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/jquery.inputlimiter.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/forms/chosen.jquery.min.js"></script>

    <script type="text/javascript" src="/static/js/plugins/wizard/jquery.form.js"></script>
    <script type="text/javascript" src="/static/js/plugins/wizard/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/wizard/jquery.form.wizard.js"></script>

    <script type="text/javascript" src="/static/js/plugins/uploader/plupload.js"></script>
    <script type="text/javascript" src="/static/js/plugins/uploader/plupload.html5.js"></script>
    <script type="text/javascript" src="/static/js/plugins/uploader/plupload.html4.js"></script>
    <script type="text/javascript" src="/static/js/plugins/uploader/jquery.plupload.queue.js"></script>

    <script type="text/javascript" src="/static/js/plugins/tables/datatable.js"></script>
    <script type="text/javascript" src="/static/js/plugins/tables/tablesort.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/tables/resizable.min.js"></script>

    <script type="text/javascript" src="/static/js/plugins/ui/jquery.tipsy.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.collapsible.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.progress.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.timeentry.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.colorpicker.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.jgrowl.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.breadcrumbs.js"></script>
    <script type="text/javascript" src="/static/js/plugins/ui/jquery.sourcerer.js"></script>

    <script type="text/javascript" src="/static/js/plugins/calendar.min.js"></script>
    <script type="text/javascript" src="/static/js/plugins/elfinder.min.js"></script>

    <script type="text/javascript" src="/static/js/custom.js"></script>

    <script type="text/javascript" src="/static/js/charts/chart.js"></script>

    <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  -->
</head>

<body>
<!-- 左侧菜单栏 -->
<div id="leftSide">
    <div class="logo"><a href="/student/home"><img src="/static/images/logo.png" alt="" /></a></div>

    <div class="sidebarSep mt0"></div>

    <!-- 搜索框 -->
    <form action="" class="sidebarSearch">
        <input type="text" name="search" placeholder="search..." id="ac" />
        <input type="submit" value="" />
    </form>

    <div class="sidebarSep"></div>

    <!-- 左侧导航栏 -->
    <ul id="menu" class="nav">
        <li class="dash"><a href="/student/home" title="" class="active"><span>我的主页</span></a></li>
        <li class="tables"><a href="/student/course" title="" ><span>课程管理</span></a></li>
        <li class="tables"><a href="#" title="" class="exp"><span>作业管理</span><strong>2</strong></a>
            <ul class="sub">
                <li class="this"><a href="/student/assignment" title="">查看作业</a></li>
                <li><a href="/student/uploadAssignment" title="">上传作业</a></li>
            </ul>
        </li>
        <li class="tables"><a href="#" title="" class="exp"><span>小组管理</span><strong>2</strong></a>
            <ul class="sub">
                <li class="this"><a href="/student/groupList" title="" >我的小组</a></li>
                <li><a href="/student/course" title="">创建小组</a></li>
            </ul>
        </li>
    </ul>
</div>

<!-- 右侧区域 -->
<div id="rightSide">
    <!-- 顶部导航栏 -->
    <div class="topNav">
        <div class="wrapper">
            <div class="welcome"><a href="#" title=""><img src="/static/images/userPic.png" alt="" /></a><span>欢迎<strong>【<c:out value="${sessionScope.currentUser.userName}"/>】同学</strong>使用本系统</span></div>

            <div class="userNav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/user/toConfigPage" title="" id="userConfig"><img src="/static/images/icons/topnav/profile.png" alt="" /><span>账户</span></a></li>
                    <%--<li><a href="#" title=""><img src="/static/images/icons/topnav/settings.png" alt="" /><span>设置</span></a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/user/logout" title=""><img src="/static/images/icons/topnav/logout.png" alt="" /><span>注销</span></a></li>
                </ul>
            </div>

            <div class="clear"></div>
        </div>
    </div>

    <!-- 标题区 -->
    <div class="titleArea">
        <div class="wrapper">
            <div class="pageTitle">
                <h5>组员评分</h5>
                <%--

                <div class="formRow"><p>姓名: <strong>${student.userName}</strong></p></div>
                <div class="formRow"><p>学号: <strong>${student.userId}</strong></p></div>
                <div class="formRow"><p>性别: <strong>${student.gender}</strong></p></div>
                <div class="formRow"><p>Email:  <strong>${student.email}</strong></p></div>
                <div class="formRow"><p>学院: <strong>${student.department}</strong></p></div>
                <div class="formRow"><p>专业: <strong>${student.major}</strong></p></div>
                <div class="formRow"><p>班级: <strong>${student.classes}</strong></p></div>
                --%>

            </div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="wrapper">
        <div class="widget">
            <form method="post" id="validate" class="form" action="${pageContext.request.contextPath}/student/updateGroupMemberScore">
                <div class="widget">
                    <%
                        String groupId = request.getParameter("groupId");
                        String studentId = request.getParameter("studentId");
                    %>
                    <div class="formRow">
                        <label style="width:10%">小组号</label>
                        <div ><input type="text" name="groupId" value="<%=groupId%>"  readonly style="width:80%;" required/></div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <label style="width:10%">学生号</label>
                        <div ><input type="text" name="studentId" value="<%=studentId%>" readonly  style="width:80%;" required/></div>
                        <div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <label style="width:10%">成绩(60-100)</label>
                        <div ><input type="text" name="grade"  class="validate[required,custom[onlyNumberSp]]" style="width:80%;" required /></div>
                        <div class="clear"></div>
                    </div>
                    <div class="loginControl">
                            <input type="submit" value="确认" class="dblueB logMeIn" />
                        <div class="clear"></div>
                    </div>
                </div>
            </form>

        </div>
    </div>
    <script type="text/javascript">
        $("#validate").validate({
            rules:{
                grade:{
                    digits:true,
                    range:[60,100]
                },
            },
            messages:{
                grade:{
                    required:"此项必填",
                    digits:"只能为数字",
                    range:"成绩范围错误"
                }
            },
            //提交表单后，（第一个）未通过验证的表单获得焦点
            focusInvalid:true,
            //当未通过验证的元素获得焦点时，移除错误提示
            focusCleanup:true,
        });
    </script>
    <!-- Footer line -->
    <div id="footer">
        <div class="wrapper">All rights reserved by <a href="http://hashmap.me">Marco Hao</a></div>
    </div>

    <div class="clear"></div>
</div>
</body>
</html>