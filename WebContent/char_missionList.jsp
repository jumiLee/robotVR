<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//user_account(int)|CampainList-(int)CurrentCampain|(int)CampainVal1|(str)CampainName1|(str)CampainAbout1|(int)CampainComplet1
            
String P_type ="T006";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_getUserMission  ("+ user_account + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	 
	while(rs.next()){
		map = new HashMap();
		map.put("cur_flag"		, rs.getInt("cur_flag"));
		map.put("mis_id"		, rs.getInt("mis_id"));
		map.put("mis_nm"		, rs.getString("mis_nm"));
		map.put("mis_desc"		, rs.getString("mis_desc"));
		map.put("complete_rate"	, rs.getString("complete_rate"));
		
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

<%=P_type %>|<%=user_account %>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("cur_flag")%>|<%=list.get(i).get("mis_id")%>|<%=list.get(i).get("mis_nm")%>|<%=list.get(i).get("mis_desc")%>|<%=list.get(i).get("complete_rate")%>|
<%}%>