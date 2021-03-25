<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	

<%
//Packet
//user_account(int)|(int)my_rank|(int)my_point|(int)my_kill_cnt|(int)my_die_cnt|(int)my_win_cnt|(int)my_lose_cnt|
//RankinglistCnt(int)|(int)rank|(str)RankingNickName1|(int)point|(int)kill_cnt|(int)die_cnt|(int)win_cnt|(int)lose_cnt

int unit_cd = 0;
String P_type = "T014";
String job_type	= request.getParameter("job_type"); 

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt 	= 0;
int my_rank = 0;
int my_point = 0;
int my_kill_cnt =0;
int my_die_cnt = 0;
int my_win_cnt = 0;
int my_lose_cnt = 0;

try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_userRank  ("+job_type+"," + user_account + ") \n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	
	//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		my_rank		 = rs.getInt("my_rank");
		my_point 	 = rs.getInt("my_point");
		my_kill_cnt	 = rs.getInt("my_kill_cnt");
		my_die_cnt	 = rs.getInt("my_die_cnt");
		my_win_cnt	 = rs.getInt("my_win_cnt");
		my_lose_cnt	 = rs.getInt("my_lose_cnt");
		
		map = new HashMap();
		
		map.put("user_nickname"	, rs.getString("user_nickname"));	
		map.put("user_rank"		, rs.getInt("user_rank"));
		map.put("point"			, rs.getInt("point"));
		map.put("kill_cnt"		, rs.getInt("kill_cnt"));		
		map.put("die_cnt"		, rs.getInt("die_cnt"));		
		map.put("win_cnt"		, rs.getInt("win_cnt"));	
		map.put("lose_cnt"		, rs.getInt("lose_cnt"));	
		
		list.add(map); 
		tot_cnt ++;
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=user_account %>|<%=my_rank %>|<%=my_point %>|<%=my_kill_cnt %>|<%=my_die_cnt %>|<%=my_win_cnt %>|<%=my_lose_cnt %>|
<%=tot_cnt %>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("user_rank")%>|<%=list.get(i).get("user_nickname")%>|<%=list.get(i).get("point")%>|<%=list.get(i).get("kill_cnt")%>|<%=list.get(i).get("die_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|
<%}%>