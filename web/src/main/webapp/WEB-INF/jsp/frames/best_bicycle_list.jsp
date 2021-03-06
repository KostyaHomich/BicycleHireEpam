<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="lang" tagdir="/WEB-INF/tags" %>
<%@ page import="epam.project.entity.UserRole" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table table-striped jambo_table bulk_action">

        <thead>
        <tr class="headings">
            <th class="column-title"><fmt:message key="bicycle.name"/></th>
            <th class="column-title"><fmt:message key="bicycle.description"/></th>
            <th class="column-title no-link last"><span class="nobr"><fmt:message key="page.button.action"/></span></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${requestScope.bicycles}" var="bicycle">
            <tr class="even pointer">

                <td class=" ">${bicycle.getName()}</td>
                <td class=" ">${bicycle.getDescription()}</td>
                <td>
                    <input value="<fmt:message key="page.button.show"/>" type="button" onclick="location.href='${bicycle.getLink()}'" />

                    <c:if test="${sessionScope.signInUser.getRoles().contains(UserRole.ROLE_USER)}">
                    <form style="display: inline-block;"
                          action="${pageContext.request.contextPath}/bicycle_best/delete"
                          method="post">
                        <input type="hidden" name="bicycleId" value="${bicycle.getId()}">
                        <input type="hidden" name="command" value="${DELETE_BEST_BICYCLE}">
                        <input type="submit" value="<fmt:message key="page.button.delete"/>">
                    </form>
                    </c:if>

                </td>

            </tr>
        </c:forEach>

        </tbody>

</table>


