<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	//String Driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; //MSSQL Driver
	String Driver = "com.mysql.jdbc.Driver";  //MySQL Driver
	Class.forName(Driver); 
	//System.out.println("Ok Driver");
}catch(Exception e){
	System.out.println("JDBC 드라이버 연결 오류 : " + e);
	e.printStackTrace();
}  
String DB_url = "jdbc:mysql://edeninstance1.cqka8xbywsmf.ap-northeast-2.rds.amazonaws.com:33062/nb";	//Amazon Global Live (MYSQL / 노블리스)	
String DB_url_replica = "jdbc:mysql://edeninstance1.cqka8xbywsmf.ap-northeast-2.rds.amazonaws.com:33062/nb";	//Amazon Live Replica (MYSQL / 노블리스)


//String DB_url = "jdbc:mysql://192.168.1.24:3306/NB";	//LOCAL QA (MYSQL / 노블리스)
//String DB_url_replica = "jdbc:mysql://192.168.1.24:3306/NB";	//LOCAL QA (MYSQL / 노블리스)

String DB_pwd = "dpeps1234";
//String DB_url = "jdbc:sqlserver://192.168.1.27:1433;DatabaseName=NB";	//QA (SQL SERVER / 몬스터왕국)
String DB_user = "edenweb";
//String DB_pwd = "dpeps1@3$";

StringBuffer sql = new StringBuffer();
ResultSet rs = null; 
PreparedStatement pstmt = null;
Connection Conn = null;
int re = -1;
%>  