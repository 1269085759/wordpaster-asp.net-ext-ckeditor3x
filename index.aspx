﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CKEditor353.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<!--此页面实现Word图片自动批量上传的功能-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>WordPaster For CKEditor3.x,ExtJS</title>
    <link type="text/css" rel="Stylesheet" href="WordPaster/WordPaster.css"/>
    <link type="text/css" rel="stylesheet" href="extjs/resources/css/ext-all.css"/>
    <script type="text/javascript" src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="extjs/ext-all.js"></script>
    <script type="text/javascript" src="WordPaster/w.edge.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/w.app.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/w.file.js" charset="utf-8"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="WordPaster/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/jquery.min.js"></script>
    <script type="text/javascript" src="WordPaster/WordPaster.js" charset="utf-8"></script>
</head>
<body>
	<div style=" font-size:medium; line-height:130%;">
	<p>演示方法：</p>
	<ul style="list-style-type:decimal;">
		<li>打开Word文档，复制多张图片，在编辑器中按下 Ctrl + V 键，编辑器将自动上传所有图片。</li>
		<li>复制电脑中任意图片文件，然后点击编辑器中的粘贴图片按钮<img src="WordPaster/paster.png" width="16px" height="16px"/>。</li>
		<li>通过QQ或其它软件截屏，复制图片，然后点击编辑器中的图片粘贴按钮<img src="WordPaster/paster.png" width="16px" height="16px"/>。</li>
	</ul>
	<p>相关问题：</p>
	<ul style="list-style-type:decimal;">
		<li>WindowsXP如果无法识别数字证书，请先下载运行<a target="_blank" href="http://www.ncmem.com/download/rootsupd.rar">Windows证书补丁</a></li>
		<li>Windows7/Windows2003如果无法识别数字证书，请先下安装<a target="_blank" href="http://www.ncmem.com/download/startcom.cer">数字签名根证书</a></li>
		<li>如果无法安装组件请下载进行安装<a target="_blank" href="http://www.microsoft.com/downloads/details.aspx?FamilyID=9b2da534-3e03-4391-8a4d-074b9f2bc1bf%20">Microsoft Visual C++ 2008 Redistributable Package (x86)</a></li>
		<li>如果有任何问题或建议请向我们<a target="_blank" href="http://www.ncmem.com/blog/guestbook.asp">反馈</a></li>
	</ul>
	</div>
	<!--创建FCKEditor控件-->
	<textarea id="editor1" name="editor1"></textarea>
    <script type="text/jscript" language="javascript">
        //fix:IE9错误,对象不支持“createContextualFragment”属性或方法。
        if ((typeof Range !== "undefined") && !Range.prototype.createContextualFragment)
        {
            Range.prototype.createContextualFragment = function (html)
            {
                var frag = document.createDocumentFragment(),
				div = document.createElement("div");
                frag.appendChild(div);
                div.outerHTML = html;
                return frag;
            };
        }

        var pasterMgr = new WordPasterManager();
        pasterMgr.Config["PostUrl"] = "http://localhost:4416/asp.net/upload.aspx";
        //pasterMgr.Config["PostUrl"] = "http://www.ncmem.com/products/upload_ori.aspx";
        pasterMgr.Config["Cookie"] = 'ASP.NET_SessionId=<%=Session.SessionID%>';
        pasterMgr.Load();//加载控件

        CKEDITOR.on('instanceReady', function (evt)
        {
            pasterMgr.SetEditor(evt.editor);
        });

        //加载CKEditor编辑器
        CKEDITOR.replace('editor1');
	</script>
</body>
</html>
