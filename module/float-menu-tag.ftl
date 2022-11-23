<div id="float-menu-tag" class="float-menu-tag">
    <@tagTag method="list">
        <#list tags as tag>
            <a class="tags has-addons" href="${tag.fullPath!}">
                <span class="tag name">${tag.name!}</span>
                <span class="tag number">${tag.postCount!}</span>
            </a>
        </#list>
    </@tagTag>
</div>

