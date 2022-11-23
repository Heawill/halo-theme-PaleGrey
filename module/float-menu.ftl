<div class="float-menu"> 
    <#--  头像  -->
    <img id= "head-ortraits" class="head-ortraits noShowBrower" src="${user.avatar!}"/>

    <#--  右边区域  -->
    <div class="rightArea">

        <div class="personal-details">
            <#--  用户名  -->
            <div class="user-name">
                <a>${user.nickname!}</a>
            </div>

            <#--  功能区  -->
            <div class="function-button">
                <a href="/">
                    <img src="${theme_base!}/source/images/function-menu-home.svg" id="button-home-img" class="button-home-img button-img noShowBrower"/>
                </a>
                <img src="${theme_base!}/source/images/function-menu-search.svg" id="button-serach-img" class="button-serach-img button-img noShowBrower"/>
                <img src="${theme_base!}/source/images/function-menu-category.svg" id="button-category-img" class="button-category-img button-img noShowBrower"/>
                <img src="${theme_base!}/source/images/function-menu-tag.svg" id="button-tag-img" class="button-tag-img button-img noShowBrower"/>
                <#if is_post??>
                    <img src="${theme_base!}/source/images/function-menu-title.svg" id="button-title-img" class="button-title-img button-img noShowBrower"/>
                </#if>
                
                <a href="/admin.html">
                    <img src="${theme_base!}/source/images/function-menu-admin.svg" class="button-admin-img button-img noShowBrower"/>
                </a>
                <a href="javascript:scrollTo(0,0);">
                    <img src="${theme_base!}/source/images/function-menu-top.svg" id="button-top-img" class="button-top-img button-img noShowBrower"/>
                </a>
            </div>
        </div>

        <#--  个人简介  -->
        <div class="brie-introduction">
            <a>${user.description!}</a>
        </div>

    </div>
    
</div>

<script defer>
    //头像
    function clickHeadOrtraits() { 
        window.location.href = "/"
    }
    document.getElementById("head-ortraits").addEventListener("click", clickHeadOrtraits);

    //搜索
    var tagShowSearch = false
    function clickSearch() {
        tagShowTag = false
        document.getElementById("float-menu-tag").style.display = "none"
        tagShowCategory = false
        document.getElementById("float-menu-category").style.display = "none"
        tagShowMenu = false
        document.getElementById("float-menu-menu").style.display = "none"

        if(tagShowSearch){
            tagShowSearch = false
            document.getElementById("float-menu-search").style.display = "none"
        }else{
            tagShowSearch = true
            document.getElementById("float-menu-search").style.display = "flex"
        }
    }
    document.getElementById("button-serach-img").addEventListener("click", clickSearch);

    //文件分类
    var tagShowCategory = false
    function clickCategory() {
        tagShowSearch = false
        document.getElementById("float-menu-search").style.display = "none"
        tagShowTag = false
        document.getElementById("float-menu-tag").style.display = "none"
        tagShowMenu = false
        document.getElementById("float-menu-menu").style.display = "none"

        if(tagShowCategory){
            tagShowCategory = false
            document.getElementById("float-menu-category").style.display = "none"
        }else{
            tagShowCategory = true
            document.getElementById("float-menu-category").style.display = "flex"
        }
    } 
    document.getElementById("button-category-img").addEventListener("click", clickCategory);

    //标签
    var tagShowTag = false
    function clickTag() {
        tagShowSearch = false
        document.getElementById("float-menu-search").style.display = "none"
        tagShowCategory = false
        document.getElementById("float-menu-category").style.display = "none"
        tagShowMenu = false
        document.getElementById("float-menu-menu").style.display = "none"

        if(tagShowTag){
            tagShowTag = false
            document.getElementById("float-menu-tag").style.display = "none"
        }else{
            tagShowTag = true
            document.getElementById("float-menu-tag").style.display = "flex"
        }
        
    } 
    document.getElementById("button-tag-img").addEventListener("click", clickTag);

    //文章菜单
    var tagShowMenu = false
    function clickMenu() {
        tagShowSearch = false
        document.getElementById("float-menu-search").style.display = "none"
        tagShowCategory = false
        document.getElementById("float-menu-category").style.display = "none"
        tagShowTag = false
        document.getElementById("float-menu-tag").style.display = "none"

        if(tagShowMenu){
            tagShowMenu = false
            document.getElementById("float-menu-menu").style.display = "none"
        }else{
            tagShowMenu = true
            document.getElementById("float-menu-menu").style.display = "flex"
        }
        
    } 
    document.getElementById("button-title-img").addEventListener("click", clickMenu); 




    // 控制导航栏是否显示的变量
    var topNavShow = false
    // 声明一个数组存放比对数据
    var scrollData = []
    // 一个响应速度的参数，值越大响应越慢
    var responseSpeed = 2
    // 监听页面滚动，处理菜单栏是否显示/隐藏
    window.addEventListener("scroll", function () {
        var scrollTop =
            document.documentElement.scrollTop ||
            window.pageYOffset ||
            document.body.scrollTop;

        // 只有不在最顶部时才会生效
        if (scrollTop > 1) {
            <#--  console.log(scrollData);  -->
            if (scrollData.length == responseSpeed) {
                if (
                    scrollData[0] <
                    scrollData[responseSpeed - 1]
                ) {
                    // 下划，屏幕往上走，隐藏
                    topNavShow = false;
                }
                if (
                    scrollData[0] >
                    scrollData[responseSpeed - 1]
                ) {
                    // 上划，屏幕往下走，显示
                    topNavShow = true;
                }
            }
            if (scrollData.length >= responseSpeed) {
                scrollData = [];
            } else {
                scrollData.push(scrollTop);
            }
        } else {
            topNavShow = true;
        }

        if(topNavShow){ //上划显示
            $(".float-menu").fadeIn();
            $(".float-menu").fadeIn("slow");
            $(".float-menu").fadeIn(3000);
        }else{ //下滑隐藏
            $(".float-menu").fadeOut();
            $(".float-menu").fadeOut("slow");
            $(".float-menu").fadeOut(3000);

            //其他功能标签打开时顺便隐藏
            if(tagShowSearch) {
                $("#float-menu-search").fadeOut();
                $("#float-menu-search").fadeOut("slow");
                $("#float-menu-search").fadeOut(3000);
                tagShowSearch = false
            }
            if(tagShowCategory) {
                $("#float-menu-category").fadeOut();
                $("#float-menu-category").fadeOut("slow");
                $("#float-menu-category").fadeOut(3000);
                tagShowCategory = false
            }
            if(tagShowTag) {
                $("#float-menu-tag").fadeOut();
                $("#float-menu-tag").fadeOut("slow");
                $("#float-menu-tag").fadeOut(3000);
                tagShowTag = false
            }
            if(tagShowMenu) {
                $("#float-menu-menu").fadeOut();
                $("#float-menu-menu").fadeOut("slow");
                $("#float-menu-menu").fadeOut(3000);
                tagShowMenu = false
            }
        }
    });
</script> 