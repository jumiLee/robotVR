<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T001";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

String ID = request.getParameter("id");
String PWD = request.getParameter("pwd");
int result = 0;
//int user_account = 0;
int curr_svr_no = 0;
String user_nickname = "0";
String server_list="";
try{   
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_getUserInfoByUserID  ('" + ID + "','" + PWD + "' )\n") ;
	
	System.out.println (sql.toString());
	
	pstmt = Conn.prepareStatement(sql.toString());	
	rs = pstmt.executeQuery();  
	if(rs.next()){		
		result 		 	= rs.getInt("result");
		user_account 	= rs.getString("user_account");
		curr_svr_no 	= rs.getInt("server_no");
		user_nickname 	= rs.getString("user_nickname");
	}
	
	//Server List
	sql.setLength(0);
	sql.append(" Call pt_getServerList ()\n") ;
		
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
	    server_list += rs.getInt(1) +"|" + rs.getString(2) +"|";
		tot_cnt++;
	}
	
//Packet
//user_account(int)	result_cd(int)	NickName(str)	ClientVer(int)	CurrentServNo(int)	serverlist(int)	ServNo(int)1	ServName(str)1	ServNo(int)2	ServName(str)2	ServNo(int)3	ServName(str)3

%>
<%=P_type%>|<%=user_account %>|<%=result %>|<%=StringUtils.defaultString(user_nickname,"0") %>|<%=clientVer%>|<%=curr_svr_no %>|<%= tot_cnt%>|<%=server_list %>
<%	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%>