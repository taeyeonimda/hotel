<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage='true' %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<h3>시스템 에러가 발생했습니다.</h3>
<%
	Logger logger = null;
	if(application.getAttribute("logger")!=null)
		logger = (Logger)application.getAttribute("logger");
	else {
		logger = LogManager.getLogger();
		application.setAttribute("logger", logger);
	}
	
	logger.error(exception);
%>