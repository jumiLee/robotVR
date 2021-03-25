<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
//Packet
//user_account(int)|RoomVal|result(0:성공,-1:방수최대, -2:진입실패)
String job_type = request.getParameter("job_type");
String p_type = "T010";
if(job_type.equals("2")) {	
	p_type ="T011";
}
String curr_room_seq = request.getParameter("curr_room_seq");

CallableStatement cs = null;
int result = 0;
int room_seq = 0;

try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	cs = Conn.prepareCall("{call pt_BattleRoomMgmt(?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,curr_room_seq);
	
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	 //room_no
	cs.registerOutParameter(5, java.sql.Types.VARCHAR);	 //result
	cs.execute();
	
	room_seq 	= cs.getInt(4);
	result 		= cs.getInt(5);

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
}%>
<%
if(job_type.equals("1")) {	%>
	<%=p_type%>|<%=user_account %>|<%=room_seq%>|<%=result%>|
<%}else{ %>
	<%=p_type%>|<%=user_account %>|<%=result%>|
<%} %>