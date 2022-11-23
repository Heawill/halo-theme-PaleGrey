<div id="float-menu-search" class="float-menu-search">
    <input type="text" id="searchtext" name="searchtext" placeholder="请输入搜索关键字...">
</div>

<script>
    $("#searchtext").keydown(function (event) {
        if (event.keyCode == 13) {
            window.location.href = ("/search?keyword=" + $("#searchtext").val())
        }
    });
</script>

