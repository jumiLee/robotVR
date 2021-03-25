<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	int user_account=19;
%>
user_account : <%=user_account %> <br>
[공통] <br>

<a href="./user_create.jsp?ch_type=0&ch_id=0&ch_nm=GM" target="_blank">[T000] 사용자 생성</a> <br>
<a href="./user_login_ap.jsp?id=test&pwd=test" target="_blank">[T001] 사용자 로그인</a> <br>
<a href="./user_server.jsp?user_account=<%=user_account%>&serverNo=1" target="_blank">[T002] 서버선택</a> <br>
<a href="./user_info.jsp?user_account=<%=user_account%>" target="_blank">[T003] 캐릭터정보요청</a> <br>
<a href="./char_mgmtDeck.jsp?job_type=1&user_account=<%=user_account%>&char_id=2" target="_blank">[T004] 주캐릭설정</a> <br>
<a href="./char_equipItem.jsp?job_type=3&user_account=<%=user_account%>&char_id=1&item_id=3110001" target="_blank">[T005] 장착</a> <br>
<a href="./char_missionList.jsp?user_account=<%=user_account%>" target="_blank">[T006] 캠페인리스트요청</a> <br>
<a href="./char_subMissionList.jsp?user_account=<%=user_account%>&mis_id=1" target="_blank">[T007] 서브캠페인리스트요청</a> <br>
<a href="./mis_start.jsp?user_account=<%=user_account%>&mis_id=1&mis_sub_id=1" target="_blank">[T008] 캠페인시작</a> <br>
<a href="./mis_end.jsp?user_account=<%=user_account%>&mis_id=1&mis_sub_id=1&mis_result=0&comp_degree=100" target="_blank">[T009] 캠페인종료</a> <br>
<a href="./bat_mgmtRoom.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">[T010] 대전방진입</a> <br>
<a href="./bat_mgmtRoom.jsp?user_account=<%=user_account%>&job_type=2&curr_room_seq=1" target="_blank">[T011] 대전방나가기</a> <br>
<a href="./bat_mgmtBatStart.jsp?user_account=<%=user_account%>&curr_room_seq=1" target="_blank">[T012] 대전시작</a> <br>
<a href="./bat_mgmtBatEnd.jsp?user_account=<%=user_account%>&bat_result=1&killCount=1&dieCount=0" target="_blank">[T013] 대전 결과</a> <br>
<a href="./bat_rank.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">[T014] 랭킹요청 </a> <br>
<a href="./shop_ItemTypeList.jsp?draw_type_cd=5" target="_blank">[T015] 가차리스트</a> <br>
<a href="./draw_mgmtDraw.jsp?user_account=<%=user_account%>&draw_id=11" target="_blank">[T016] 가차뽑기</a> <br>
