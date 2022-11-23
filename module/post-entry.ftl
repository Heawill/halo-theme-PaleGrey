<#list posts.content as post>
    <div class="post animated fadeInDown">
        
        <#--  置顶标识  -->
        <#if post.topped == true>
            <p class="topedMark">●</p>
        </#if>

        <#--  文章名称  -->
        <div class="post-title">
            <h3>
                <a href="${post.fullPath!}">${post.title}</a>
            </h3>
        </div>

        <#--  文章内容  -->
        <div class="post-content">
            <div class="p_part">
                <p>${post.summary!}...</p>
            </div>
            <div class="p_part">
                <p></p>
            </div>
        </div>

        <#--  一些信息  -->
        <div class="post-footer">
            <div class="meta">
                <div class="info">
                    <#--  创建日期  -->
                    <i class="fa fa-calendar-o"></i>
                    <span class="tagPost">${post.createTime?string("yyyy-MM-dd hh:mm:ss")}</span>

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

        <#--  封面图  -->
        <#if settings.article_item_background == 'none'>
            <div class="post-right-pic">
                <img class="post-list-thumbnail lazyloadImg nonePic" src='${theme_base!}/source/images/nonePic.png'/>
            </div>
        <#elseif settings.article_item_background == 'settingExist'>
            <#if post.thumbnail?? && post.thumbnail!=''>
                <div class="post-right-pic">
                    <img class="post-list-thumbnail lazyloadImg" src="${post.thumbnail!}" />
                </div>
            <#else>
                <div class="post-right-pic">
                    <img class="post-list-thumbnail lazyloadImg nonePic" src='${theme_base!}/source/images/nonePic.png'/>
                </div>    
            </#if>
        <#elseif settings.article_item_background == 'settingExistRandom'>
            <#if post.thumbnail?? && post.thumbnail!=''>
                <div class="post-right-pic">
                    <img class="post-list-thumbnail lazyloadImg" src="${post.thumbnail!}" />
                </div>
            <#else>
                <div class="post-right-pic">
                    <img class="post-list-thumbnail lazyloadImg randomPic"/>
                </div>
            </#if>
        <#elseif settings.article_item_background == 'random'>
            <div class="post-right-pic">
                <img class="post-list-thumbnail lazyloadImg randomPic"/>
            </div>
        </#if>
        
        <#--  渐变层  -->
        <div class="post-right-shade"></div>
         
    </div>
</#list>

<script>
var right = $(".post-right-shade")
var pic = $(".post-list-thumbnail")

$(".post").each(function(index, element) {
    element.onmouseenter = function () { 
        element.setAttribute('style','background-color:#e7e7e7')
        right.eq(index).css({'background-image':'linear-gradient(to right, rgba(231,231,231,1), rgba(231,231,241,0))'})
    }
    element.onmouseleave = function () {
        element.setAttribute('style','background-color:#f1f1f1')
        right.eq(index).css({'background-image':'linear-gradient(to right, rgba(241,241,241,1), rgba(241,241,241,0))'})
    }

    if(pic.eq(index).attr('class').indexOf('randomPic') != -1){
        //pic.eq(index).attr('src','https://picsum.photos/' + right.eq(index).width() + '/' + right.eq(index).height())
        var picUrl = '${settings.random_item_background!}';
        if(picUrl.indexOf('?') != - 1){
            picUrl = picUrl + "&r="+Math.random()
        }else{
            picUrl = picUrl + "?r="+Math.random()
        }
        pic.eq(index).attr('src',picUrl)
    }
    
    
});



</script>
