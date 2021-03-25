<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T013";
int job_type 		= 1; //1:PVP
String killCount 	= request.getParameter("killCount"); 
String dieCount 	= request.getParameter("dieCount");
String bat_result	= request.getParameter("bat_result"); 

int result_cd = 0; int get_score=0; int cur_score=0; int cont_win_cnt=0; int get_gold=0;

try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_BattleEnd  ("+job_type+"," + user_account + "," + killCount + ","+ dieCount + "," + bat_result + ") \n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		//result|get_score(획득점수)|cur_score(현재점수)|cont_win_cnt(연승회수)|get_gold(획득골드)|
		result_cd 	= rs.getInt("result"); 
		get_score	= rs.getInt("get_score");
		cur_score	= rs.getInt("point");
		cont_win_cnt= rs.getInt("cont_win_cnt");
		get_gold	= rs.getInt("get_gold");	
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
<%=P_type %>|<%=user_account %>|<%=bat_result %>|<%=get_gold %>|