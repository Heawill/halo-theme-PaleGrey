<div id="float-menu-category" class="float-menu-category">
    <@categoryTag method="tree">
    <ul>
        <#list categories as category>
            <li>
                <a href="${category.fullPath!}">
                    ${category.name!}
                </a>
            </li>

            <#if category.children?? && category.children?size gt 0>
                <@renderCategories category.children></@renderCategories>
            </#if>
        </#list>
    </ul>
    </@categoryTag>

    <#macro renderCategories categories>
        <ul>
            <#list categories as category>
                <li>
                    <a  href="${category.fullPath!}">
                        ${(category.name)!}
                    </a>
                    <#if category.children?? && category.children?size gt 0>
                        <@renderCategories category.children></@renderCategories>
                    </#if>
                </li>
            </#list>
        </ul>
    </#macro>
</div>

