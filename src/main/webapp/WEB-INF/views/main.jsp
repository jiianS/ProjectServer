<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 매덩여행 </title>
	<link rel="stylesheet" type="text/css" href="resources/css/index.css">
	<link rel='shortcut icon' href='resources/icon/send.png'>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script>

	$(document).ready(function() {

		//slide  & btn***********************************************/
		$.ajax({
			type : "post",
			url : "sbl"
		}).done(function(data) {
			var d = JSON.parse(data)
			var list = d.list;	// list타입이라 list로 받아와서 뽑아낸다
			console.log(list);
			
			var s_html="";
			var b_html="";
			
			$("#s").empty();
			$("#btnList").empty();
			for(var i=0; i< list.length; i++){
				
				if(list[i].listYn == 'Y'){
					s_html = "<div style='background-image:url(";
					s_html += list[i].fileURL + "')> </div>";
					$("#s").append(s_html);	
				}else if(list[i].btnYn == 'Y'){
					b_html = "<li class='b_img' style='background-image:url(";
					b_html += list[i].fileURL + "')>";
					b_html += "<div><p>" + list[i].fileName + "</p></div></li>";
					$("#btnList").append(b_html);
				}				
			}			
		}); //ajax.done() (slide/btn)
		
		// 여행지 리스트(매덩's pick)************************************************/
		$.ajax({
			type : "post",
			url : "dld",
			data : {go : "detail"}	

		}).done(function(data) {
			var d = JSON.parse(data)
			var list = d.list;	// list타입이라 list로 받아와서 뽑아낸다
			//console.log(list);

			$("#ul_list").empty();
			
			for (var i = 0; i < list.length; i++) {
				var html = "<li class='l_list'>"
				
				/***이미지************************************************/
					html += "<div class='l_img'><div class='container_img'>";
					html += "<img src='"+list[i].fileURL+"' class='pick_img'/>";
					html += "<div class='middle_img'><div class='text_img'>";
					html +=  list[i].boardTitle;
					html += "</div></div></div></div>";
				/***text*********************************************/
					html += "<div class='l_r'>"
					html += "<h1>" + list[i].boardTitle + "</h1>";
					html += "<p>" + list[i].boardContents + "</p>"
					html += "</div>"				
				/***************************************************/
				html += "</li>"
				
				$("#ul_list").append(html);
			}
		}); //ajax.done()
		
	}); //document.ready

</script>


</head>
<body>
    <header>
        <div id="main_header">
            <div class=logo></div>
                <h1 onclick="location.href='#'">매덩여행</h1>
            	<c:if test="${sessionScope.user.status == 1}">
						${sessionScope.user.userId} 님 관리자 모드로 접속중
					<a href="logout">로그아웃</a>
				</c:if>    
        </div>
 	</header>
    
    <!--메뉴창-->
    <div class="menu_block">  
         <img id="menu_icon" src="resources/icon/ic_reorder_black_24px.svg"><br>
    <div class="menubar">
        <ul>
            <li><a href="index">HOME</a></li>
            <li><a href="#">유럽</a>
                <ul>
                    <div></div>
                     <li><a href="sub?go=london">런던</a></li>
                     <li><a href="sub?go=barcelona" >바르셀로나</a></li>
                     <li><a href="#">독일</a></li>
                </ul>
            </li>
            <li><a href="#">아시아</a>
             <ul>
                    <div></div>
                     <li><a href="#">일본</a></li>
                     <li><a href="#">중국</a></li>
                </ul>
            </li>
            <li><a href="#">아메리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">미국</a></li>
                     <li><a href="#">캐나다</a></li>
                     <li><a href="#">멕시코</a></li>
                </ul>
            </li>
            <li><a href="#">아프리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">남아공</a></li>
                     <li><a href="#">케냐</a></li>
                </ul>
            </li>
            <li><a href="#">오세아니아</a>
             <ul>
                     <div></div>
                     <li><a href="#">호주</a></li>
                     <li><a href="#">뉴질랜드</a></li>
                </ul>
            </li>
            
            <li id="menu_site"><a href="#" >관리자모드</a> 
             <ul>
				<div></div>
           			<li><a href="admin">관리자 페이지</a></li>
                </ul>
            
            <li id="menu_site"><a href="#" >제휴사이트</a>
             <ul>
                    <div></div>
                     <li><a href="https://www.tripadvisor.co.kr/">Trip Advisor</a></li>
                     <li><a href="https://www.myrealtrip.com/">MyRealTrip</a></li>
                     <li><a href="https://magazine.dingo.tv/dingotravelkorea">Dingo Travel</a></li>
                </ul>
            </li>
        </ul>
    </div>
    </div>

    <div id="blank"></div>
 
   <!-- Contents  -->
    <div id="contents">
    
	    <!--슬라이드 & btn 눌러서 화면 넘기기-->
		<c:if test="${sessionScope.user.status == 1}">
			<span style="text-align: right"> 
				<a href="bList?check=sbl">수정</a>
			</span>
		</c:if>

		<section id="s"></section>    
	    <section id="b">
	        <div>
	            <input type="radio" name="radio" id="b_1" checked>
	            <input type="radio" name="radio" id="b_2">
	            <input type="radio" name="radio" id="b_3">
	            <input type="radio" name="radio" id="b_4">
	            <ul id="btnList"> </ul> 
	        </div>
	    </section>
	    
	    <!--유투브 리스트-->  
	    <section id="v">
	        <div id="v_div1">  
	           <h1>매덩's youtube</h1> <hr>
	            <iframe src="https://www.youtube.com/embed/vjj3opBmJ9w" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> 
	        </div>
	        
	        <!--영상 리스트 -->
	        <div id="v_div2" >
	            
	            <div id="v_icon">
	                <div id="icon2">
	                <img src="resources/icon/playlist_add.svg" id="i_p">
	               </div>
	            </div>
	                      
	             <div id="v_m">
	                <ul>
	                    <li class="v_m_l">
	                       <iframe src="https://www.youtube.com/embed/slnquW49Zwk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	                        <div class="v_m_r">
	                            <h1>괌</h1>
	                            <p>괌에서 꼭 해야할 10가지</p>
	                            <ul>
	                                <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li>
	                                <li>3,737</li>
	                                <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li>
	                                <li>40</li>
	                                <li class="v_share v_icon"></li>
	                                <li class="v_li_r">공유</li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                    <li class="v_m_l">
	                        <iframe src="https://www.youtube.com/embed/cl42CcXQB7E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	                        <div class="v_m_r">
	                            <h1>이탈리아 남부</h1>
	                            <p>남부에서 꼭 해야할 10가지</p>
	                            <ul>
	                                <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li>
	                                <li>4,500</li>
	                                <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li>
	                                <li>25</li>
	                                <li class="v_share v_icon"></li>
	                                <li class="v_li_r">공유</li>
	                            </ul>
	                        </div>
	                    </li>
	                    <li class="v_m_l">
	                        <iframe src="https://www.youtube.com/embed/htrWV4GYNDI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	                        <div class="v_m_r">
	                            <h1>그리스</h1>
	                            <p>그리스에서 해야할 10가지</p>
	                            <ul>
	                               <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li>
	                                <li>1,552</li>
	                                <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li>
	                                <li>30</li>
	                                <li class="v_share v_icon"></li>
	                                <li class="v_li_r">공유</li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                    <li class="v_m_l">
	                        <iframe src="https://www.youtube.com/embed/y1-qAvF0_Xc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	                        <div class="v_m_r">
	                            <h1>바르셀로나</h1>
	                            <p>바르셀로나에서 해야할 15가지</p>
	                            <ul>
	                               <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li>
	                                <li>6,705</li>
	                                <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li>
	                                <li>240</li>
	                                <li class="v_share v_icon"></li>
	                                <li class="v_li_r">공유</li>
	                            </ul>
	                        </div>
	                    </li>
	                    
	                </ul>
	            </div>
	            </div>
	    </section>
	    
	 <!--여행지 리스트(매덩's Pick)-->
	<section id="l">
        <div id="l_div1">  
          <span style="text-align: left;"><h1>매덩's Picks</h1></span>
          <c:if test="${sessionScope.user.status == 1}">
           <span style="text-align: right">
            	<a href="bList?go=detail&check=dld">수정</a>
           </c:if> 	
           <hr> 
        </div>
     <ul id="ul_list"></ul>
    </section>
    
    </div> 
   
    <!--탑버튼-->    
    <div id="top_button">
        <a href="#"><img src="resources/icon/top_icon.png" width="70px"></a>
    </div>

    <footer>
        <div id= "comment" >
            <h4>
                전 세계 우리의 여행 사이트. 풍부한 정보.즐거운 여행    
            
             <div>
            	
                <div id="face"  class="co_icon"onclick="location.href='https://ko-kr.facebook.com/dingo.travel.kr/'"></div>
                <div id="insta" class="co_icon" onclick="location.href='https://www.instagram.com/dingo_travel/'" ></div>
                <div id="twitt" class="co_icon"onclick="location.href='https://twitter.com/myrealtrip'"></div>
            
            </div>
            </h4>
            
            <h5>copyrighter by 갱 and 쟌 and 굥은</h5>
        </div>
    </footer>

</body>
</html>
