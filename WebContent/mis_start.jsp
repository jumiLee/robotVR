<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T008";

String mis_id = request.getParameter("mis_id");
String mis_sub_id = request.getParameter("mis_sub_id");

CallableStatement cs = null;
int result_cd = 0;

int tot_cnt ;
int mis_result ;
int mis_type;
int add_mis_gold = 0;

tot_cnt = 0;
mis_result = 0;
mis_type = 0;

StringBuffer sql2 = new StringBuffer();
ResultSet rs2 = null;
PreparedStatement pstmt2 = null;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" Call pt_MissionStart  ("+ user_account + "," + mis_id + "," + mis_sub_id + "," + add_mis_gold + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){		
		
		mis_result = rs.getInt("result");
		mis_type   = rs.getInt("mis_type");
	}	
  
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt2 != null) pstmt2.close();
	if(rs2 != null) rs2.close();	
}	%>
<%=P_type %>|<%=user_account %>|<%=mis_result %>|