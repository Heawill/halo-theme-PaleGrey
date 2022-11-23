<#--  顶部页脚宏定义  -->
<#macro head title>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>${title!}</title>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta name="theme-color" content="${settings.google_color!'#fff'}">
    <meta name="author" content="${user.nickname!}" />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <@global.head />
    
    <link href="${theme_base!}/source/plugins/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>

    <#--自定义相关样式-->
    <link href="${theme_base!}/source/css/global.css" type="text/css" rel="stylesheet" />
    <link href="${theme_base!}/source/css/post.css" type="text/css" rel="stylesheet" />
    <link href="${theme_base!}/source/css/float-menu.css" type="text/css" rel="stylesheet" />
    <link href="${theme_base!}/source/css/error.css" type="text/css" rel="stylesheet" />
    <link href="${theme_base!}/source/css/up-down-button.css" type="text/css" rel="stylesheet" />
    <link href="${theme_base!}/source/css/bottom-area.css" type="text/css" rel="stylesheet" />

    <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="${atom_url!}">

    <script type="text/javascript" src="${theme_base!}/source/js/jquery-1.9.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<body>
</#macro>

<#--  底部页脚宏定义  -->
<#macro footer>
</body>
    <div id="bottomArea">${settings.bottom_html!}</div>
</html>
</#macro>

<#--  悬浮菜单  -->
<#macro menu>
    <#include "float-menu.ftl">
    <#include "float-menu-search.ftl">
    <#include "float-menu-tag.ftl">
    <#include "float-menu-category.ftl">
    <#include "float-menu-menu.ftl">
    <#include "float-menu-head.ftl">
</#macro>

