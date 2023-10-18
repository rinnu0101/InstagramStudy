<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>         
        <!-- Slick 불러오기 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/LayerPopup.css">

        <script>
	
        	//레이어팝업
		    function layer_popup(idx){
				
		    	$.ajax({
	               url : "/getStory.do", //라우팅
	               type : "POST", //POST
	               data : { 
	            	   user_idx : idx,
	               },
	               success : function(p)
	               {	            	   
	            	   
	                  console.log(p);
	                  var list = JSON.parse(p).list;
	                  var cnt = list.length;		                  	                  
	                  for(var i=0; i<cnt; i++){
	                	  var item = list[i];
	                	  console.log(item);
	                	  $(".story_img img").attr("src", "/images/" + item.img_path);
	                  }
	               },
	               error : function(p)
	               {
	                  
	               }
               });
        		
        		
		        var $el = $("#layer2");    //레이어의 id를 $el 변수에 저장
		        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수
		
		        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
		
		        var $elWidth = ~~($el.outerWidth()),
		            $elHeight = ~~($el.outerHeight()),
		            docWidth = $(document).width(),
		            docHeight = $(document).height();
		
		        // 화면의 중앙에 레이어를 띄운다.
		        if ($elHeight < docHeight || $elWidth < docWidth) {
		            $el.css({
		                marginTop: -$elHeight/2,
		                marginLeft: -$elWidth/2
		            })
		        } else {
		            $el.css({top: 0, left: 0});
		        }
		
		        $('.btn-layerClose').click(function(){
		            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		            return false;
		        });
		
		        $('.layer .dimBg').click(function(){
		            $('.dim-layer').fadeOut();
		            return false;
		        });
		
		    }     
        
        
        
	        String.prototype.format = function() {
	            var formatted = this;
	            for( var arg in arguments ) {
	                formatted = formatted.replace("{" + arg + "}", arguments[arg]);
	            }
	            return formatted;
	        };
        	$(document).ready(function() {   

	            $.ajax({
	               url : "/getStoryList.do", //라우팅
	               type : "POST", //POST
	               data : { },
	               success : function(p)
	               {
	                  console.log(p);
	                  var list = JSON.parse(p).list;
	                  var cnt = list.length;
	                  var liter = '<li onclick=\"layer_popup({0});\">'
	                            + '<img class=\"story_li_img {1}\" src=\"images/{2}\"/>'
	                            + '</br>'
	                            + '<span class=\"story_li_text\">{3}</span>'
	                            + '</li>';
	                  	                  
	                  for(var i=0; i<cnt; i++){
	                	  var item = list[i];
	                	  
                          var classNm = "story_dont_view";
                          if(item.view_yn == "1")
                          {
                        	  classNm = "story_already_view";
                          }
	                	  
	                	  $("#friend_ul").append(liter.format(item.idx, classNm, item.img_path, item.user_name));
	                  }
	               },
	               error : function(p)
	               {
	                  
	               }
               });
            });
            
        
            function goMypage()
            {
                location.href='jjabstar_mypage.html?name=userName&age=31'
            }

            function fn_leftSlide_btn()
            {                     
                $("#friend_ul").animate({marginLeft: "+=80px"}, 500, function()
                {  

                });
                
                fn_count("left");
                if(_StoryCnt < 1)
                {
                    $(".storyButtonL").hide();
                }
                else if(_StoryCnt < _MaxStoryCnt)
                {
                    $(".storyButtonR").show();
                }

            }
            function fn_rightSlide_btn()
            {
                $("#friend_ul").animate({marginLeft: "-=80px"}, 500);
                fn_count("right");
                if(_StoryCnt >= (_MaxStoryCnt - _PrintStoryCnt))
                {
                    $(".storyButtonR").hide();
                }
                else if(_StoryCnt > 0)
                {
                    $(".storyButtonL").show();
                }
            }

            //스토리 버튼 클릭 수 세기 - 카운트하여 움직임 제한 두기에 활용
            let _StoryCnt = 0;
            let _MaxStoryCnt = 20; // 추후에 DB에서 수를 가져와 사용
            let _PrintStoryCnt = 6; // 추후에 DB에서 수를 가져와 사용
            function fn_count(type)
            {
                if(type == "right")
                {
                    _StoryCnt = parseInt(_StoryCnt) + 1;
                }
                
                else if(type == "left")
                {
                    _StoryCnt = parseInt(_StoryCnt) - 1;
                }

                console.log(_StoryCnt);
            }

        </script>
    </head>

    <body>

		<div class="dim-layer">
		    <div class="dimBg btn-layerClose"></div>
		    <div id="layer2" class="pop-layer">
		        <div class="pop-container">
		            <div class="pop-conts">
		                <!--content //-->
		                <p class="story_img">
		                	<img src="images/1.jpg">
		                </p>
		                <!--// content-->
		            </div>
		        </div>
		    </div>
		</div>
		
		
		
        <div id="main">
            <div id="main_left">
                <div id="logo">
                    <div>
                        <img src="images\Instagram.png"/>
                    </div>
                </div>

                <div id="menu">
                    <ul>
                        <li> 
                            <div>
                                <img src="images\home.png"/>
                            </div>
                            <div class="menu_label"> HOME </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\search.png"/>
                            </div>
                            <div class="menu_label"> 검색 </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\explore.png"/>
                            </div>
                            <div class="menu_label"> 탐색 </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\reels.png"/>
                            </div>
                            <div class="menu_label"> 릴스 </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\Direct.png"/>
                            </div>
                            <div class="menu_label"> 메시지 </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\notice.png"/>
                            </div>
                            <div class="menu_label"> 알림 </div>
                        </li>
                        <li>
                            <div>
                                <img src="images\plus.png"/>
                            </div>
                            <div class="menu_label"> 만들기 </div>
                        </li>
                        <li onclick="goMypage();">
                                <div>
                                    <img src="images\home.png"/>
                                </div>
                                <div class="menu_label"> 프로필 </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div id="main_middle">
                <div id="feed">
                    <div id="feed_story">
                        <div style="
                        overflow: hidden;
                        width: 468px;
                        display: flex;">

                            <!-- 피드 스토리 영역 -->
                            <!-- 친구의 스토리가 있을때만 보여줄것 -->
                            <ul id="friend_ul" style="width: 500000px; display: flex;">
                                                        
                            </ul>
                        </div>
                    </div>

                    <div class="storyButtonL"
                        style="
                            position: absolute;
                            display: none;
                            align-items: center;
                            cursor : pointer;
                        ">
                        <img src="images\storyButtonR.png" onclick="fn_leftSlide_btn();">

                    </div>

                    <div class="storyButtonR"
                        style="
                            position: absolute;
                            margin-left: 440px;
                            display: flex;
                            align-items: center;
                            cursor : pointer;
                        ">
                        <img src="images\storyButtonL.png" onclick="fn_rightSlide_btn();">

                        <!-- if friend_ul_li length와 같아지면 pointer-events : none -->

                    </div>
        
                    <div id="feed_body">
                        <!-- 피드 바디 영역 -->
                        <div id="top">
                           	 상단 계정 영역
                        </div>
                        <div id="contents">
                           	 사진/영상 영역
                        </div>
                        <div id="bottom">
                            <!-- 하단 본문 영역 -->
                            <div id="PIS">
                                	좋아요,댓글,공유 영역
                            </div>
                            <div id="like">
                               	 좋아요 카운트 영역
                            </div>
                            <div id="text">
                                <!-- 본문 텍스트 영역 -->
                                <ul>
                                    <li>피드본문영역 50%</li>
                                    <li>댓글모두보기 버튼영역 50%</li>
                                </ul>
                            </div>
                            <div id="upload_time">
                                	업로드 시간
                            </div>
                            <div id="comment">
                                	댓글 영역
                            </div>
                        </div>
                    </div>

                    <!-- <div id="main_right">
                        <div id="account">
                           	 계정 추천 영역
                        </div>
                    </div> -->
                </div>
            </div>

        </div>
		        
    </body>
</html>