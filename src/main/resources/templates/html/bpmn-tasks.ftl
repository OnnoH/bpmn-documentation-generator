<#import "../bpmn-template-util.ftl" as util/>
<#import "bpmn-extensions.ftl" as extensions>

<#macro listTasks processElements>

<#assign taskTypes = [
{ "serviceTask": "Service Tasks" },
{ "userTask": "User Tasks" },
{ "sendTask": "Send Tasks" },
{ "receiveTask": "Receive Tasks" },
{ "businessRuleTask": "Business Rule Tasks" },
{ "scriptTask": "Script Tasks" },
{ "anonymousTask": "Anonymous Tasks" }
]/>

<#assign noTasks = processElements?filter(element -> element.flowType?ends_with("Task"))/>

<details>
    <summary><h4>Tasks</h4></summary>
    <#if (noTasks?size > 0)>
        <#list taskTypes as type>
            <#list type as taskType, title>
                <#assign tasks = processElements?filter(element -> element.flowType == taskType)/>
                <#if (tasks?size > 0)>
                    <h5>${title}</h5>
                    <ul>
                        <#list tasks as task>
                            <li><@util.emptyOrNull task.name "task" /> (${task.id})</li>
                        </#list>
                    </ul>
                </#if>
            </#list>
        </#list>
    <#else>
        <p>No tasks.</p>
    </#if>
</details>
<#if (noTasks?size > 0)>
    <#list taskTypes as type>
        <#list type as taskType, title>
            <#assign tasks = processElements?filter(element -> element.flowType == taskType)/>
            <#if (tasks?size > 0)>
                <details>
                    <summary><h4>${title}</h4></summary>
                        <#list tasks as task>
                            <p>
                                <strong><@util.emptyOrNull task.name "task" /></strong>
                                <table>
                                    <tr>
                                        <th>Property</th>
                                        <th>Value</th>
                                        <th>Version</th>
                                    </tr>
                                    <tr>
                                        <td>ID</td>
                                        <td>${task.id}</td>
                                        <td>n/a</td>
                                    </tr>
                                    <tr>
                                        <td>Template</td>
                                        <td><@util.emptyOrNull task.template.name "template" /></td>
                                        <td><@util.emptyOrNull task.template.version "template version" /></td>
                                    </tr>
                                </table>
                                <#if task.documentation?has_content>
                                    <blockquote>${task.documentation}</blockquote>
                                <#else>
                                    <blockquote>Not documented.</blockquote>
                                </#if>
                            </p>
                            <p>
                                <#if task.extensions?has_content>
                                    <@extensions.listExtensions task.extensions />
                                </#if>
                            </p>
                        </#list>
                </details>
            </#if>
        </#list>
    </#list>
</#if>

</#macro>