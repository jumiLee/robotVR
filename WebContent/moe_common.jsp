<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Random"%>
<%@ page import="java.util.regex.*" %>
<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.security.NoSuchAlgorithmException"%>

<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.*"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page import="java.net.URLEncoder"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page errorPage="./ma_error.jsp" %>
<%@ include file="./DBConnection.jsp"%>
<%
String user_account = request.getParameter("user_account"); 
int clientVer = 0;
%>