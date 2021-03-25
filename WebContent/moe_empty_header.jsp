<%
int h_user_level =0; int h_max_exp	 =0; int h_user_exp =0; int h_max_AP =0; int h_cur_AP=0; int h_user_gold=0;
int h_user_coin  =0; int h_user_point=0; int h_user_img =0; int h_cur_wp =0; int h_max_wp=0;
String h_user_nickname = "0";
int empty_user_account=0;
int max_party_h = 3;
String deck_packet = "";
	
    String Deck[] =new String[max_party_h];
    for(int des = 0;des<Deck.length;des++)
    {
    	Deck[des]="-1|-1|-1|-1|-1|-1|-1|";
    } 
	for(int des = 0;des<Deck.length;des++) 
    {
		deck_packet+=Deck[des] ;
    }
%>
<%=h_user_level%>|<%=h_max_exp%>|<%=h_user_exp%>|<%=h_max_AP%>|<%=h_cur_AP%>|<%=h_user_gold%>|<%=h_user_coin%>|<%=h_user_point%>|<%=h_user_img%>|<%=h_user_nickname%>|<%=h_cur_wp%>|<%=h_max_wp%>|<%=empty_user_account%>|<%=max_party_h%>|<%=deck_packet %>