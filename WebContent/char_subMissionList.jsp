<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//user_account(int)  CampainList(int)    CurrentCampain(int)CampainVal1(str)CampainName1(str)CampainAbout1(int)CampainComplet1
String P_type ="T007";
String mis_id = request.getParameter("mis_id");

ResultSet rs2 = null;
PreparedStatement pstmt2 = null;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt =0; 
int comp_degree =0; int rwd_rcv_flag =0;
int boss_mon_id =0; String boss_mon_nm ="0"; int boss_mon_lv=0; int boss_mon_hp=0; int boss_mon_att=0; int boss_mon_def=0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" Call pt_getUserSubMission  ("+ user_account + "," + mis_id + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		
		comp_degree = rs.getInt("comp_degree");
		
		map.put("mis_id"		, rs.getInt("mis_id"));
		map.put("mis_sub_id"	, rs.getInt("mis_sub_id"));
		map.put("mis_sub_nm"	, rs.getString("mis_sub_nm"));
		map.put("mis_desc"		, rs.getString("mis_desc"));
		map.put("complete_cnt"	, rs.getInt("complete_cnt"));	//미션완료정도
		map.put("cur_flag"		, rs.getInt("cur_flag"));		
		
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
	if(pstmt2 != null) pstmt2.close();
	if(rs2 != null) rs2.close();
}	%>

<%=P_type%>|<%=user_account %>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("cur_flag")%>|<%=list.get(i).get("mis_sub_id")%>|<%=list.get(i).get("mis_sub_nm")%>|<%=list.get(i).get("mis_desc")%>|<%=list.get(i).get("complete_cnt")%>|
<%}%>