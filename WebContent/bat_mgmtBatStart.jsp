<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T012";
int job_type = 1;	//1:PVP
String curr_room_seq= request.getParameter("curr_room_seq");//room no


List<Map<String, Object>> list = null;
Map<String, Object> map = null;
CallableStatement cs = null;

int result_cd = 0; //업데이트 결과 

try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call pt_BattleStart(?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,curr_room_seq);
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	 //Update Result
	cs.execute();
	result_cd = cs.getInt(4);
		 
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();  
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%>
<%=P_type %>|<%=user_account %>|<%=result_cd%>|