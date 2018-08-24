<%@page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/background/taglibs.jsp"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
    <base href="<%=path%>">
    <title>日程信息:</title>
    <!--框架必需start-->
    <script type="text/javascript" src="<%=path%>/libs/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/libs/js/language/cn.js"></script>
    <script type="text/javascript" src="<%=path%>/libs/js/framework.js"></script>
    <link href="<%=path%>/libs/css/import_basic.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" id="skin" prePath="<%=path%>/" />
    <link rel="stylesheet" type="text/css" id="customSkin" />
    <!--框架必需end-->

    <link rel="stylesheet" href="/system/mainpages/layer/skin/default/layer.css">
    <script type="text/javascript" src="/system/mainpages/layer/layer.js"></script>

    <style>
        .tableStyle .viewModeEven {
            text-align: left;
        }
        .liSingleName {
            float: left;
            margin:10px;
            position: relative;
            padding: 1px 1px;
            padding-right: 26px;
            width:auto;
            background-color: #fff;
            border:1px solid #0b96e9;
            border-radius:3px;
            color: #0b96e9;
            font-size: 14px;
            line-height:22px;
        }
        .deletetheName {
            position: absolute;
            color: #0b96e9;
            font-size: 20px;
            line-height: 20px;
            top: 50%;
            right: 3px;
            cursor: pointer;
            margin-top: -10px;
        }
        .lifjs {
            border-bottom:1px dashed #ccc;
        }
        .lifjs a{
            display:block;
            padding:5px;
            color: #0b96e9;
            cursor:pointer;
            line-height: 24px;
        }
        .all_attachment {
            border:1px solid #D8E3EF;
            border-radius: 3px;
            padding: 10px;
            margin-bottom: 15px;
            min-height: 80px;
        }
        .attachment_cell {
            font-size: 14px;
            color: #0b96e9;
            display:inline-block;
            margin-right: 10px;
            border:1px solid #0b96e9;
            padding: 5px;
            line-height: 14px;
            padding-right: 80px;
            position: relative;
            margin-bottom: 8px;
        }
        .attachment_cell.nm_attachment_cell {
            padding-right: 5px;
        }
        .attachment_cell.sound_file_box {
            padding-right: 50px;

        }
        .soundToWords {
            width: 20px;
            text-align: center;
            right: 15px;
            top:1px;
            height: 20px;
            line-height: 20px;
            font-size: 12px;
            color: #000;
            /*background-color: #0b96e9;*/
            border:1px solid #0b96e9;
            border-radius:50%;
            position: absolute;
            cursor: pointer;
            transition: all .3s ease-in-out;
        }
        .soundToWords:hover {
            background-color: #0b96e9;
            color: #fff;
        }
        .soundToWords:before {
            content: '';
            position: absolute;
            width: 4px;
            height: 1px;
            background-color: #0b96e9;
            left: -6px;
            top: 9px;
        }
        .soundToWords:after {
            content: '';
            position: absolute;
            width: 4px;
            height: 1px;
            background-color: #0b96e9;
            right: -6px;
            top: 9px;
        }
        .sound_file_box2 .soundToWords{
            color: #ccc;
            border-color: #ccc;
        }
        .sound_file_box2 .soundToWords:hover {
            color: #ccc;
            background-color: #fff;
        }

        /* 采访内容样式 start */
        .interviewBox {
            background-color: #fff;
            padding: 10px;
            position: relative;
            overflow: auto;
            padding-bottom: 66px;
        }
        .interviewBox-textarea {
            height: 100%;
        }
        .interview_msg_box {
            width: 80%;
            padding:8px 10px;
            padding-right: 40px;
            position: relative;
            border:1px solid #ccc;
            border-radius:5px;
            background-color: #fff;
        }
        .msg_left_ico {
            margin-right: 10px;
        }
        .cen_msg_txt {
            color: #333;
            font-size: 12px;
            line-height: 12px;
        }
        .cen_msg_txt p {
            color: #333;
            margin-bottom: 8px;
        }
        .cen_msg_txt p.txtgray {
            color: #aaa;
            margin-bottom: 0;
        }
        .msg_del_btn {
            color: #333;
            font-size: 26px;
            line-height: 26px;
            position: absolute;
            width: 40px;
            text-align: center;
            top: 50%;
            margin-top: -13px;
            right: 0;
            border-left:1px solid #f1f1f1;
        }

        /* 采访内容样式 end */
    </style>
</head>
<body>
<div class="box1" id="formContent" whiteBg="true">
    <table class="tableStyle" formMode="view">
        <tr>
            <th colspan="4">采访信息: </th>
        </tr>
        <tr>
            <td width="20%" >主题: </td>
            <td width="80%" >${calendar.theme}</td>
        </tr>
        <tr>
            <td width="20%" >采访时间: </td>
            <td width="80%" ><fmt:formatDate value='${calendar.starttime}' type='both' pattern='yyyy-MM-dd HH:mm'/></td>
        </tr>
        <tr>
            <td width="20%" >类型: </td>
            <td width="80%" >
                <c:if test="${calendar.state == 1}">求证</c:if>
                <c:if test="${calendar.state == 2}">电话采访</c:if>
                <c:if test="${calendar.state == 3}">实地采访</c:if>
                <c:if test="${calendar.state == 4}">接访</c:if>
                <c:if test="${calendar.state == 5}">调研</c:if>
                <c:if test="${calendar.state == 6}">参会</c:if>
                <c:if test="${calendar.state == 7}">其他</c:if>
            </td>
        </tr>
        <c:if test="${calendar.state != 10}">
            <tr>
                <td width="20%" >状态: </td>
                <td width="80%" >
                    <c:if test="${calendar.type ==0}">待完成</c:if>
                    <c:if test="${calendar.type ==1}">完成</c:if>
                    <c:if test="${calendar.type ==2}">取消</c:if>
                    <c:if test="${calendar.type ==3}">延迟</c:if>
                </td>
            </tr>
        </c:if>
        <tr>
            <td width="20%" >采访对象: </td>
            <td width="80%">
                <ul class="ulAllName">
                    <c:forEach items="${visitbooks}" var="s" >
                        <li class="liSingleName">
                            <span title="${s.treenodename}">${s.name}</span>
                        </li>
                    </c:forEach>

                </ul>
            </td>
        </tr>
        <tr>
            <td width="20%" >标签: </td>
            <td width="80%">
                <ul class="ulAllName">
                    <c:forEach items="${labels}" var="s" >
                        <li class="liSingleName">
                            <span title="${s}">${s}</span>
                        </li>
                    </c:forEach>

                </ul>
            </td>
        </tr>
        <tr>
            <td width="20%" >采访提纲: </td>
            <td width="80%" >${calendar.visitoutline}</td>
        </tr>
        <tr>
            <td width="20%" >采访内容: </td>
            <td>
                <div id="interviewContent"  class="interviewBox interviewBox-textarea" contenteditable="false" style="-webkit-user-select: auto;height: 500px;border:1px solid #000;">
                    ${calendar.visitcontent}
                </div>
            </td>
            <%--<td width="80%" >${calendar.visitcontent}</td>--%>
        </tr>
        <tr>
            <td>附件：</td>
            <td>
                <ul class="all_attachment filelist-ul">
                    <%--<li class="attachment_cell sound_file_box sound_file_box2">
                        <a href=""><span class="attachment_name">录音名称</span></a>
                        <div class="soundToWords" title="音源转文字" style="font-family: -webkit-pictograph;">文</div>
                    </li>
                    <li class="attachment_cell sound_file_box ">
                        <a href=""><span class="attachment_name">录音名称</span></a>
                        <div class="soundToWords" title="音源转文字" style="font-family: -webkit-pictograph;">文</div>
                    </li>
                    <li class="attachment_cell sound_file_box nm_attachment_cell">
                        <a href=""><span class="attachment_name">普通附件</span></a>
                    </li>--%>
                </ul>

            </td>
        </tr>
    </table>
</div>
<script>
    var enclosure = '${calendar.enclosure}';
</script>
<link rel="stylesheet" href="/secnews/css/fileupload.css" type="text/css"/>
<script type="text/javascript" src="/shzq/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/libs/js/other/progressbar.js"></script>
<script type="application/javascript" src="/secnews/js/UploadAction.js"></script>
<script type="application/javascript" src="/secnews/js/underscore-1.8.3.js"></script>
<script type="application/javascript" src="/secnews/js/UploadTypeConstans.js"></script>
<script type="application/javascript" src="/secnews/js/RestAPIHelper.js"></script>
<script type="application/javascript" src="/secnews/js/kindeditor-all.js"></script>
<script type="application/javascript" src="/secnews/js/fish.fileupload.js"></script>
<script type="application/javascript" src="/secnews/sec/home/visit/action/CalendarAction.js"></script>
<script type="text/javascript" src="/secnews/js/zooming.js"></script>
<script type="application/javascript">
    var zooming = new Zooming();

    $(function () {
        zooming.listen('.img-zoomable');
    });

    function playVideotape() {
        layer.msg('PC端暂不支持此功能，请在手机端播放视频');
    }
    function playRecord() {
        layer.msg('PC端暂不支持此功能，请在手机端播放音频');
    }
    function deleteVideo() {

    }

    $('body').on('click','.deletetheName',function () {
        $(this).closest('.liSingleName').remove();
    });

    if(enclosure) {
        $.post("/filestore/selectByDocId.jhtml", {arr : enclosure}, function (result) {
            $.each(result, function(idx, fileRespObj){
                var $li = $('<li class="attachment_cell"/>');
                $li.data("fileRespObj", fileRespObj);
                if(fileRespObj.statusCd == 1) {
                    $(".filelist-ul").append(
                        '<li class="attachment_cell sound_file_box sound_file_box2">\n' +
                            '<a href="/filestore/download.jhtml?docNbr='+ fileRespObj.docNbr +'"><span class="attachment_name">'+fileRespObj.docName+'</span></a>\n' +
                            '<div class="soundToWords" title="音频文件暂未处理好" style="font-family: -webkit-pictograph;">文</div>\n' +
                        '</li>'
                    );
                } else if(fileRespObj.statusCd == 2) {
                    $(".filelist-ul").append(
                        '<li class="attachment_cell sound_file_box nm_attachment_cell">' +
                        '<a href="/filestore/download.jhtml?docNbr='+ fileRespObj.docNbr +'"><span class="attachment_name">'+fileRespObj.docName+'</span></a>\n' +
                        '</li>'
                    );
                } else if(fileRespObj.statusCd == 3) {
                    $(".filelist-ul").append(
                        '<li class="attachment_cell sound_file_box nm_attachment_cell">' +
                        '<a href="/filestore/download.jhtml?docNbr='+ fileRespObj.docNbr +'"><span class="attachment_name">'+fileRespObj.docName+'</span></a>\n' +
                        '</li>'
                    );
                } else if(fileRespObj.statusCd == 4) {
                    $(".filelist-ul").append(
                        '<li class="attachment_cell sound_file_box">\n' +
                        '<a href="/filestore/download.jhtml?docNbr='+ fileRespObj.docNbr +'"><span class="attachment_name">'+fileRespObj.docName+'</span></a>\n' +
                        '<div class="soundToWords" title="音频文件暂未处理好" style="font-family: -webkit-pictograph;">文</div>\n' +
                        '</li>'
                    );
                } else {
                    $(".filelist-ul").append(
                        '<li class="attachment_cell sound_file_box nm_attachment_cell">' +
                        '<a href="/filestore/download.jhtml?docNbr='+ fileRespObj.docNbr +'"><span class="attachment_name">'+fileRespObj.docName+'</span></a>\n' +
                        '</li>'
                    );
                }
            });

        });
    }

</script>
</body>
</html>
