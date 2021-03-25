<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//user_account(int)	serverNo(int)	Res(0:성공,-1:문제발생)

String P_type ="T002";
String svr_no = request.getParameter("serverNo");

CallableStatement cs = null;
int result_cd = 0;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call pt_SetServer(?,?,?)}");
	cs.setString(1,user_account);
	cs.setString(2,svr_no);
		
	cs.registerOutParameter(3, java.sql.Types.INTEGER);	
	cs.execute();
	result_cd 	= cs.getInt(3);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(cs != null) cs.close();
	if(pstmt != null) pstmt.close();	
	if(rs != null) rs.close();
}	
%>
<%=P_type%>|<%=user_account %>|<%=svr_no%>|<%=result_cd%>|