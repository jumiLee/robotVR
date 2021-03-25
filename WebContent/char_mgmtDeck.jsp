<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
//Packet
//user_account(int)|Res(0:성공,-1:문제발생)

String P_type ="T004";
int job_type = 1;
String char_id = request.getParameter("char_id");

 
CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = "" ; //결과메세지
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call pt_MgmtDeck(?,?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,char_id);
	cs.setInt(4,1);
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_flag
	cs.registerOutParameter(6, java.sql.Types.VARCHAR);	 //result_flag
	cs.execute();
	
	result_cd 	= cs.getInt(5);
	result_msg 	= cs.getString(6);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type %>|<%=user_account %>|<%=result_cd %>|