<#include "module/macro.ftl">

<@head title="文章：${post.title!}"/>
<div id="post-main" class="main">
    <div class="autopagerize_page_element">
        <div class="content">
            <div class="post-page">
                <div class="post animated fadeInDown">
                    <div class="post-title-post">
                        <h1>
                            <a>${post.title}</a>
                        </h1>
                    </div>
                    
                    <div id="post-content" class="post-content">
                       ${post.formatContent!}
                    </div>


                    <div class="post-footer">
                        <div class="meta">
                            <div class="info">
                                <#--  创建日期  -->
                                <i class="fa fa-calendar-o"></i>
                                <span class="tagPost">${post.createTime?string("yyyy-MM-dd hh:mm:ss")}</span>

                                <#--  更新日期  -->
                                <i class="fa fa-calendar-plus-o"></i>
                                <span class="tagPost">${post.updateTime?string("yyyy-MM-dd hh:mm:ss")}</span>

                                <#--  字数  -->
                                <i class="fa fa-keyboard-o"></i>
                                <span class="tagPost">${post.wordCount!}</span>

                                <#--  浏览数  -->
                                <i class="fa fa-eye"></i>
                                <span class="tagPost">${post.visits!}</span>

                                <#--  评论数  -->
                                <#if settings.global_comment_switch == 'open'>
                                    <i class="fa fa-comment-o"></i>
                                    <span class="tagPost">${post.commentCount!}</span>
                                </#if>

                                <#--  标签  -->
                                <#if post.tags?size gt 0>
                                    <i class="fa fa-bookmark-o"></i>
                                    <#list post.tags as tag>
                                        <a href="${tag.fullPath}" class="tagPost markerTagPost">&nbsp;${tag.name}</a>
                                        <#if tag_has_next>/</#if>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pagination">
                    <ul class="clearfix">
                        <#if nextPost??>
                            <li class="next pagbuttons">
                                <a class="btn" role="navigation" href="${nextPost.fullPath!}" title="${nextPost.title}">下一篇</a>
                            </li>
                        </#if>
                        <#if prevPost??>
                            <li class="pre pagbuttons">
                                <a class="btn" role="navigation" href="${prevPost.fullPath!}" title="${prevPost.title}">上一篇</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <#--  底栏  -->
    <@menu/>

    <#--  评论  -->
    <#if settings.global_comment_switch == 'open'>
        <div id="commentArea">
            <@global.comment target=post type="post" />
        </div>
    </#if>

    <#--  进度  -->
    <div id="readProgress">
        0%
    </div>

</div>
<@footer/>

<#--  代码高亮  -->
<link href="${theme_base!}/source/highlight/styles/kimbie-light.min.css" type="text/css" rel="stylesheet"/>
<script src="${theme_base!}/source/highlight/highlight.min.js"></script>

<#--  图片查看器  -->
<link  href="${theme_base!}/source/plugins/viewerjs/viewer.min.css" rel="stylesheet">
<script src="${theme_base!}/source/plugins/viewerjs/viewer.min.js"></script>

<script>
//代码高亮
hljs.highlightAll();

//文章目录
$(document).ready(function(e) {
    $("#post-content").children().each(function(index, element) {
        var tagName=$(this).get(0).tagName;
        if(tagName.substr(0,1).toUpperCase() === "H"){
            console.log(tagName);
            var contentH=$(this).html();//获取内容
            var markid="mark-"+tagName+"-"+index.toString();
            $(this).attr("id",markid);//为当前h标签设置id
             let spaceNum =  "";
            if (tagName === 'H1') {
                spaceNum =  "";
            } else if (tagName === 'H2') {
                spaceNum =  "1.5";
            }  else if (tagName === 'H3') {
                spaceNum =  "3";
            } else if (tagName === 'H4') {
                spaceNum =  "4.5";
            } else if (tagName === 'H5') {
                spaceNum =  "6";
            } else if (tagName === 'H6') {
                spaceNum =  "7.5";
            }
            $("#menu-content").append("<a onClick='hideMenu()' href='#" + markid + "'" + " style='text-indent: " + spaceNum + "em'" + ">" + contentH + "</a>");//在目标DIV中添加内容
        }
    });
});

//隐藏目录弹窗
function hideMenu(){
    tagShowMenu = false;
    document.getElementById("float-menu-menu").style.display = "none"
}

//图片浏览器
const viewer = new Viewer(document.getElementById('post-main'), {
    inline: false,
    backdrop: true,
    zIndex: 9999,
    filter: function(image) {   //忽略底部菜单栏相关图片
        if(image.className.indexOf('noShowBrower') == -1){
            return true
        }else{
            return false
        }
    }
});

//进度
document.addEventListener('scroll', function(e) {
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop; // 已经读过被卷起来的文档部分
    var scrollHeight = document.documentElement.scrollHeight // 文档总高度
    var clientHeight = document.documentElement.clientHeight // 窗口可视高度
    var readProgress = parseInt((scrollTop/(scrollHeight-clientHeight))*100) + '%'
    $('#readProgress').text(readProgress)
})
</script>





