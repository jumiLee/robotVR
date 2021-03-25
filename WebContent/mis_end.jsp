<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
//Packet
//user_account(int)|result(-11:미션정보없음, -12:등록된 보상 없음)|획득 포인트|달성횟차(횟차가 늘수록 포인트 적다)
String P_type ="T009";
String mis_id 	  = request.getParameter("mis_id");
String mis_sub_id = request.getParameter("mis_sub_id");
String mis_result   = request.getParameter("mis_result");
String comp_degree= request.getParameter("comp_degree"); //획득한 완성도(별) 개수 

CallableStatement cs = null;
int result_cd = 0;

int tot_cnt = 0;
int result = 0;
int levelup_flag = 0;
int comp_cnt = 0;
int get_point = 0;
	
try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//미션 수행에 따른 처리
	sql.setLength(0);
	sql.append(" Call pt_MissionAction  ("+ user_account + "," + mis_id + "," + mis_sub_id + "," + mis_result + "," + comp_degree + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){		
		result 			= rs.getInt("result");
		levelup_flag 	= rs.getInt("levelup_flag");		
		comp_cnt 		= rs.getInt("comp_cnt");		
		get_point 		= rs.getInt("get_point");		
	}
%>
<% 
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
}%>
<%=P_type%>|<%=user_account %>|<%=result%>|<%=get_point%>|<%=comp_cnt%>|
