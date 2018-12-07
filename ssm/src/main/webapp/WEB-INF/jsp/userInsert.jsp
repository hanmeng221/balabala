<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <link href="/static/css/main.css" rel="stylesheet" type="text/css" />


    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <!--md5加密插件-->
    <script type="text/javascript" src="/static/jquery/jquery.md5.js"></script>
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

<!-- 右侧区域 -->

<!-- 输入信息区域 -->
<c:if test="${roleName=='student'}">
    <div class="wrapper">
        <div class="widget" style="width:80%;">
            <div class="title"><h6>新建学生</h6></div>
            <!-- 表单数据 -->
            <form class="form" onsubmit="return false" id="sForm">
                <fieldset>
                    <div class="formRow">
                        <label for="userId">学号</label>
                        <br>
                            <input type="text" name="userId"  id="userId" placeholder = "请输入学号" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="userName">姓名</label>
                        <br>
                        <input type="text" name="userName" placeholder = "请输入姓名" id="userName" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label >性别</label>
                        <br>
                        <label><input type="radio" name="gender" id="gender_male" value="男" checked/>男</label>
                        <label><input type="radio" name="gender" id="gender_female" value="女"/>女</label>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="department">学院</label>
                        <br>
                        <input type="text" name="department"  placeholder = "请输入学院" id="department" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="major">专业</label>
                        <br>
                        <input type="text" name="major"  placeholder = "请输入专业" id="major" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="classes">班级</label>
                        <br>
                        <input type="text" name="classes"  placeholder = "请输入班级" id="classes" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="email">Email</label>
                        <br>
                        <input type="text" name="email"  placeholder = "请输入电子邮箱" id="email" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formSubmit">
                        <button class="btn dredB" id = "sInsert">确认</button>
                        <button class="btn dblueB" id = "sReturn">返回</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</c:if>
<c:if test="${roleName=='teacher'}">
    <div class="wrapper">
        <div class="widget" style="width:80%;">
            <div class="title"><h6>新建老师</h6></div>
            <!-- 表单数据 -->
            <form class="form" onsubmit="return false" id="tForm">
                <fieldset>
                    <div class="formRow">
                        <label for="userId">工号</label>
                        <br>
                        <input type="text" name="userId" class="validate[required]" id="userId" placeholder = "请输入工号" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="userName">姓名</label>
                        <br>
                        <input type="text" name="userName" class="validate[required]" placeholder = "请输入姓名" id="userName" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label >性别</label>
                        <br>
                        <label><input type="radio" name="gender" class="validate[required]"id="gender_male" value="男" checked/>男</label>
                        <label><input type="radio" name="gender" class="validate[required]"id="gender_female" value="女"/>女</label>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="department">学院</label>
                        <br>
                        <input type="text" name="department" class="validate[required]" placeholder = "请输入学院" id="department" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formRow">
                        <label for="email">Email</label>
                        <br>
                        <input type="text" name="email" class="validate[required]" placeholder = "请输入电子邮箱" id="email" style="width:60%;"/>
                        <div class="clear"></div>
                    </div>

                    <div class="formSubmit">
                        <button class="btn dredB" id = "tInsert">确认</button>
                        <button class="btn dblueB" id = "tReturn">返回</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</c:if>

<script type="text/javascript">
    //初始化校验规则
    jQuery.validator.addMethod("checkId", function(value, element) {
        var tel = /^[a-zA-Z0-9_-]{3,16}$/;
        return this.optional(element) || (tel.test(value));
    }, "用户id格式错误，应为3到16位的字母数字组合");
    jQuery.validator.addMethod("checkName", function(value, element) {
        var tel = /(^[a-zA-Z_-]{1,10}$)|(^[\u2E80-\u9FFF]{2,5})/;
        return this.optional(element) || (tel.test(value));
    }, "用户名格式错误，应为1到10位的字母或2到5位的中文");
    jQuery.validator.addMethod("checkEmail", function(value, element) {
        var tel = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        return this.optional(element) || (tel.test(value));
    }, "Email格式错误");

    var svalidator = $("#sForm").validate({
        rules:{
            userId:{
                required:true,
                checkId:true,
            },
            userName:{
                required:true,
                checkName:true,
            },
            email:{
                checkEmail:true,
            }
        },
        messages:{
            userId:{
                required:"此项必填",
            },
            userName:{
                required:"此项必填",
            }
        },
        //提交表单后，（第一个）未通过验证的表单获得焦点
        focusInvalid:true,
        //当未通过验证的元素获得焦点时，移除错误提示
        focusCleanup:true,
    });

    var tvalidator = $("#tForm").validate({
        rules:{
            userId:{
                required:true,
                checkId:true,
            },
            userName:{
                required:true,
                checkName:true,
            },
            email:{
                checkEmail:true,
            }
        },
        messages:{
            userId:{
                required:"此项必填",
            },
            userName:{
                required:"此项必填",
            }
        },
        //提交表单后，（第一个）未通过验证的表单获得焦点
        focusInvalid:true,
        //当未通过验证的元素获得焦点时，移除错误提示
        focusCleanup:true,
    });

    //新增学生
    $("#sInsert").click(function () {
        var roleId = ${roleId};
        var datas = $("#sForm").serialize();
        //密码加密
        var encryptedPWD = $.md5($("#userId").val());
        datas =datas + "&" + $.param({"password":encryptedPWD,"roleId":roleId});


       if(roleId==""){
            alert("角色不存在！");
            $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=student');
            return;
        }
        //校验数据
        if(svalidator.form()){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/addUsersWithJson",
                data:datas,
                type:"POST",
                success:function(result){
                    alert(result.message);
                    if(result.code==100)
                    $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=student');
                }
            });
        }
    });
    //返回
    $("#sReturn").click(function(){
        $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=student');
    });



    //新增老师
    $("#tInsert").click(function () {
        var roleId = ${roleId};
        var datas = $("#tForm").serialize();
        //密码加密
        var encryptedPWD = $.md5($("#userId").val());
        datas =datas + "&" + $.param({"password":encryptedPWD,"roleId":roleId});
        //alert(datas);

        if(roleId==""){
            alert("角色不存在！");
            $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=teacher');
            return;
        }
        //校验数据
        if(tvalidator.form()){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/addUsersWithJson",
                data:datas,
                type:"POST",
                success:function(result){
                    alert(result.message);
                    if(result.code==100)
                    $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=teacher');
                }
            });
        }
    });
    //返回
    $("#tReturn").click(function(){
        $("#content").load('${pageContext.request.contextPath}/user/selectUsers?roleName=teacher');
    });
</script>

</body>

</html>