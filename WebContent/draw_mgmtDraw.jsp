<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//result(0:성공,-1:문제발생)|rwd_type_cd(int)|rwd_id(int)|rwd_nm(str)|rare_degree(int)|rwd_img_no(int)

String P_type 	="T016";
String draw_id 	= request.getParameter("draw_id");	//draw_id
int draw_type_cd = -1;
int result_cd = 0; int draw_rwd_type = 0; int draw_rwd_id = 0; String draw_rwd_nm = ""; int rare_degree = 0;int rwd_img_no=0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_MgmtUserDraw  ("+ user_account + "," + draw_id + "," + draw_type_cd + " )\n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	System.out.println (sql.toString());
	if(rs.next()){
		result_cd		= rs.getInt("result");	
		draw_rwd_type 	= rs.getInt("draw_rwd_type");
		draw_rwd_id		= rs.getInt("draw_rwd_id");
		draw_rwd_nm		= rs.getString("draw_rwd_nm");		
		rare_degree		= rs.getInt("rare_degree");
		rwd_img_no		= rs.getInt("rwd_img_no");
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();   
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%> 
<%=P_type %>|<%=result_cd%>|<%=draw_rwd_type%>|<%=draw_rwd_id %>|<%=draw_rwd_nm%>|<%=rare_degree%>|<%=rwd_img_no%>|