<%-- 
    Document   : pie
    Created on : 26 feb. 2024, 17:02:08
    Author     : IsmaelJJL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date"/> 
<!--Pie principalmente funciona-->
<footer class="d-flex flex-wrap flex-column p-5 pb-3" >
    <ul class="nav justify-content-end list-unstyled d-flex" id="footerUl">
        <li class="px-3">
            <a class="text-body-secondary" href="#">
                <i class="bi bi-instagram"></i>
            </a>
        </li>
        <li class="px-3">
            <a class="text-body-secondary" href="#">
                <i class="bi bi-facebook"></i>
            </a>
        </li>
        <li class="px-3">
            <a class="text-body-secondary" href="#">
                <i class="bi bi-whatsapp"></i>
            </a>
        </li>
    </ul>
    <div class="d-flex justify-content-center py-3">
        <h6 class="mb-0 text-body-secondary">
            ©FIpository <c:out value="${1900+now.year}"/>, por: José Antonio Fajardo, Ismael J. Jiménez
        </h6>
    </div>
</footer>

