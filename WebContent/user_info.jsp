<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//user_account(int)UserPoint(int)	로봇파츠(int)	(int)무기1파츠	(int)무기2파츠	(int)무기3파츠	(int)무기4파츠	(int)무기5파츠	소유로봇갯수(int)	(int)소유로봇1	(int)소유로봇2	(int)소유로봇3	소유무기갯수(int)	(int)소유무기1	(int)소유무기2	(int)소유무기3

	String P_type ="T003";
 	
	int user_point=0;
	int tot_cnt=0;;
	int mon_id = 0;
	
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	 
	Map<String, Object> map = null;
	Map<String, Object> map_mon = null;
	Map<String, Object> map_item = null;
	
	List<Map<String, Object>> list1 = null;
	List<Map<String, Object>> list2 = null;
	List<Map<String, Object>> list3 = null;
		
	String result_packet = "" ; //Result Packet
	
try{
	   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

// 사용자 정보  	
	sql.append(" Call pt_getUserDetailInfo (1,"+user_account+ ") \n");
  	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
	if(rs.next()){
	    user_point = rs.getInt("user_point");   	
	}
	
//장착 로봇정보
	sql.setLength(0);
	sql.append(" Call pt_getUserDetailInfo (2,"+user_account+ ") \n");
	pstmt1	= Conn.prepareStatement(sql.toString());
	rs1	 	= pstmt1.executeQuery();	
	list1 	= new ArrayList<Map<String, Object>>();
	
	while(rs1.next()){
	    mon_id = rs1.getInt("mon_id");
	    map = new HashMap();
		map.put("item_id", rs1.getInt("item_id"));
		list1.add(map);	   
	}
	
	result_packet +=  mon_id +"|";
	for(int i=0;i<list1.size();i++){
		result_packet += list1.get(i).get("item_id").toString() +"|";
	}
	//반드시 2개를 세팅해서 보내야 함.
	if(list1.size() <2 ){
		result_packet += "0|";
	}
//소유 로봇정보	
	sql.setLength(0);
	sql.append(" Call pt_getUserDetailInfo (3,"+user_account+ ") \n");
	pstmt2 	= Conn.prepareStatement(sql.toString());
	rs2 	= pstmt2.executeQuery();	
	list2 	= new ArrayList<Map<String, Object>>();	
	
	while(rs2.next()){
	    map_mon = new HashMap();
		//소유로봇갯수(int)|(int)소유로봇1|소유로봇2...
		map_mon.put("mon_id", rs2.getInt("mon_id"));
		map_mon.put("mon_cnt", rs2.getInt("mon_cnt"));
		
		list2.add(map_mon);
		tot_cnt ++;
	}
	result_packet +=  tot_cnt +"|";
	
	for(int i=0;i<list2.size();i++){
		
		result_packet += list2.get(i).get("mon_id").toString() +"|" + list2.get(i).get("mon_cnt").toString() +"|";
	}
	
//소유 아이템정보
	sql.setLength(0);
	sql.append(" Call pt_getUserDetailInfo (4,"+user_account+ ") \n");
	pstmt3	= Conn.prepareStatement(sql.toString());
	rs3	 	= pstmt3.executeQuery();	
	list3 	= new ArrayList<Map<String, Object>>();	
	
	tot_cnt=0;
	while(rs3.next()){
	    map_item = new HashMap();
		map_item.put("item_id", rs3.getInt("item_id"));
		map_item.put("item_cnt", rs3.getInt("item_cnt"));
		map_item.put("use_cnt", rs3.getInt("use_cnt"));
				
		list3.add(map_item);
		tot_cnt ++;
	}
	
	result_packet +=  tot_cnt +"|";
	
	for(int i=0;i<list3.size();i++){
		
		result_packet += list3.get(i).get("item_id").toString() +"|" + list3.get(i).get("item_cnt").toString() +"|" + list3.get(i).get("use_cnt").toString() +"|";
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(rs != null) rs.close();
	if(rs1 != null) rs1.close();
	if(rs2 != null) rs2.close();
	if(rs3 != null) rs3.close();
	if(pstmt != null) pstmt.close();
	if(pstmt1 != null) pstmt1.close();  
	if(pstmt2 != null) pstmt2.close();
	if(pstmt3 != null) pstmt3.close();
}	%>

<%=P_type %>|<%=user_account %>|<%=user_point %>|<%=result_packet%>