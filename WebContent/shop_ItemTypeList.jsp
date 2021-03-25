<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Packet
//user_account(int)	ClientVer(int)	GaChaKind(int)-상점종류(1:Mech,2:Arm)	ShopList(int)	(int)ShopVal1	(str)ShopName1	(str)ShopAbout1	(int)ShopVal2	(str)ShopName2	(str)ShopAbout2	(int)ShopVal3	(str)ShopName3	(str)ShopAbout3
            
int unit_cd = 0;
String P_type = "T015";
String draw_type_cd = request.getParameter("draw_type_cd");

String result_packet = "" ; //Result Packet
int tot_cnt 	= 0;
String d_item_id = ""; String item_id = "";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;


List<Map<String, Object>> list_c = null;
Map<String, Object> map_c = null;
ResultSet rs_c = null;
PreparedStatement pstmt_c = null;


try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call pt_getDrawList  (2," + draw_type_cd + " )\n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		//total_cnt|draw_id|draw_nm|unit_cd|draw_price|dis_price|draw_desc|img_no|draw_rwd_type|draw_rwd_id|
		map.put("draw_id"		, rs.getInt("draw_id"));		//가차 아이디
		map.put("draw_type_cd"	, rs.getInt("draw_type_cd"));		//가차 타입
		map.put("draw_nm"		, rs.getString("draw_nm"));		//가차명
		map.put("unit_cd"		, rs.getInt("unit_cd"));		//결제단위코드
		map.put("draw_price"	, rs.getInt("draw_price"));		//가차가격
		map.put("dis_price"		, rs.getInt("dis_price"));		//할인가격
		map.put("draw_desc"		, rs.getString("draw_desc"));	//가차명
		map.put("img_no"		, rs.getInt("img_no"));			//이미지번호
		map.put("draw_rwd_type"	, rs.getInt("draw_rwd_type"));	
		map.put("draw_rwd_id"	, rs.getInt("draw_rwd_id"));	
		
		list.add(map);
		tot_cnt++;
	}
	/*

	if (draw_type_cd.equals("5")) {	//코스튬일 경우 아이템상세 정보 추가(15-04-24)
		sql.setLength(0);
		sql.append(" Call abn_getMstItemList  (3,8,81,0); \n") ;	//코스튬 정보 조회
		
		//System.out.println (P_type + ": " + sql.toString());
		
		pstmt_c = Conn.prepareStatement(sql.toString());
		rs_c = pstmt_c.executeQuery();
		
		list_c = new ArrayList<Map<String, Object>>();
		
		//item_nm|item_category|item_type|item_price|unit_cd|item_desc|item_value|item_cnt|class|rare_degree|ATT|DEF|HP|SP|abnormal|speedup_all|speedup|exp_up|critical_up|reinforce_up|limit_lv|
		//item_period_flag|item_period|item_dup_flag|item_new_flag|item_order|item_img_no|item_equip_flag|item_grade|item_rfc_flag|item_rfc_mtr_flag|socket_equip_flag|
		
		while(rs_c.next()){
			map_c = new HashMap();
			
			map_c.put("item_id"			, rs_c.getInt("item_id"));
			map_c.put("item_nm"			, rs_c.getString("item_nm"));  
			map_c.put("item_category"	, rs_c.getInt("item_category"));
			map_c.put("item_type"		, rs_c.getInt("item_type"));	
			map_c.put("item_price"		, rs_c.getInt("item_price"));
			map_c.put("unit_cd"			, rs_c.getInt("unit_cd"));
			map_c.put("item_desc"		, rs_c.getString("item_desc"));
			map_c.put("item_value"		, rs_c.getInt("item_value"));
			map_c.put("item_cnt"		, rs_c.getInt("item_cnt"));
			map_c.put("class"			, rs_c.getInt("class"));
			map_c.put("rare_degree"		, rs_c.getInt("rare_degree"));
			
			map_c.put("ATT"			, rs_c.getInt("ATT"));
			map_c.put("DEF"			, rs_c.getInt("DEF"));
			map_c.put("HP"			, rs_c.getInt("HP"));
			map_c.put("SP"			, rs_c.getInt("SP"));
			map_c.put("abnormal"	, rs_c.getInt("abnormal"));
			map_c.put("speedup_all"	, rs_c.getInt("speedup_all"));
			map_c.put("speedup"		, rs_c.getInt("speedup"));
			map_c.put("exp_up"		, rs_c.getInt("exp_up"));
			map_c.put("critical_up"	, rs_c.getInt("critical_up"));
			map_c.put("reinforce_up"	, rs_c.getInt("reinforce_up"));
			map_c.put("limit_lv"		, rs_c.getInt("limit_lv"));
			
			map_c.put("item_period_flag"	, rs_c.getInt("item_period_flag"));
			map_c.put("item_period"	, rs_c.getInt("item_period"));
			map_c.put("item_dup_flag"	, rs_c.getInt("item_dup_flag"));
			map_c.put("item_new_flag"	, rs_c.getInt("item_new_flag"));
			map_c.put("item_order"	, rs_c.getInt("item_order"));
			map_c.put("item_img_no"	, rs_c.getInt("item_img_no"));
			map_c.put("item_equip_flag"	, rs_c.getInt("item_equip_flag"));
			map_c.put("item_grade"	, rs_c.getInt("item_grade"));
			
			map_c.put("item_rfc_flag"		, rs_c.getInt("item_rfc_flag"));
			map_c.put("item_rfc_mtr_flag"	, rs_c.getInt("item_rfc_mtr_flag"));
			map_c.put("socket_equip_flag"	, rs_c.getInt("socket_equip_flag"));
			
			list_c.add(map_c);
		}
	}
	
	result_packet += tot_cnt +"|";

	for(int i=0;i<list.size();i++){
		
		d_item_id = list.get(i).get("draw_rwd_id").toString() ;
		
		result_packet +=  	
				list.get(i).get("draw_id").toString() 		+"|"+
				list.get(i).get("draw_type_cd").toString()	+"|"+
				list.get(i).get("draw_nm").toString()		+"|"+
				list.get(i).get("unit_cd").toString()		+"|"+
				list.get(i).get("draw_price").toString()	+"|"+
				list.get(i).get("dis_price").toString()		+"|"+
				list.get(i).get("draw_desc").toString()		+"|"+
				list.get(i).get("img_no").toString()		+"|"+
				list.get(i).get("draw_rwd_type").toString()	+"|"+
				list.get(i).get("draw_rwd_id").toString()	+"|";
		
		
		if (draw_type_cd.equals("5")) {	//코스튬상점일 경우 아이템 상세정보 같이 조회
			
			for(int c=0; c<list_c.size(); c++){
				
				item_id = list_c.get(c).get("item_id").toString() ;
				
				if(d_item_id.equals(item_id)){
					
					result_packet +=  	
					list_c.get(c).get("item_nm").toString() 		+"|"+
					list_c.get(c).get("item_category").toString()	+"|"+
					list_c.get(c).get("item_type").toString()		+"|"+
					list_c.get(c).get("item_price").toString()		+"|"+
					list_c.get(c).get("unit_cd").toString()	+"|"+
					list_c.get(c).get("item_desc").toString()		+"|"+
					list_c.get(c).get("item_value").toString()		+"|"+
					list_c.get(c).get("item_cnt").toString()		+"|"+
					list_c.get(c).get("class").toString()	+"|"+
					list_c.get(c).get("rare_degree").toString()	+"|" +
					
					list_c.get(c).get("ATT").toString() 	+"|"+
					list_c.get(c).get("DEF").toString()		+"|"+
					list_c.get(c).get("HP").toString()		+"|"+
					list_c.get(c).get("SP").toString()		+"|"+
					list_c.get(c).get("abnormal").toString()+"|"+
					list_c.get(c).get("speedup_all").toString()		+"|"+
					list_c.get(c).get("speedup").toString()		+"|"+
					list_c.get(c).get("exp_up").toString()		+"|"+
					list_c.get(c).get("critical_up").toString()	+"|"+
					list_c.get(c).get("reinforce_up").toString()	+"|" +
					list_c.get(c).get("limit_lv").toString()	+"|" +
					
					list_c.get(c).get("item_period_flag").toString() 		+"|"+
					list_c.get(c).get("item_period").toString()	+"|"+
					list_c.get(c).get("item_dup_flag").toString()		+"|"+
					list_c.get(c).get("item_new_flag").toString()		+"|"+
					list_c.get(c).get("item_order").toString()	+"|"+
					list_c.get(c).get("item_img_no").toString()		+"|"+
					list_c.get(c).get("item_equip_flag").toString()		+"|"+
					list_c.get(c).get("item_grade").toString()		+"|"+
					list_c.get(c).get("item_rfc_flag").toString()	+"|"+
					list_c.get(c).get("item_rfc_mtr_flag").toString()	+"|" +
					list_c.get(c).get("socket_equip_flag").toString()	+"|" ;
				}//end if				
			}//end for
		}//end if		
	}//end for
	*/
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_c != null) pstmt_c.close();
	if(rs_c != null) rs_c.close();	
}	%>
<%=P_type %>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("draw_id")%>|<%=list.get(i).get("draw_nm")%>|<%=list.get(i).get("draw_desc")%>|
<%}%>