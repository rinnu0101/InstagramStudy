<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
        <script>
	      	//새 게시물 레이어팝업 함수
	        function fnUploadOpen()
	        {
	            var oWidth = $("#upload_feed").outerWidth();
	            var cWidth = $("#upload_layerPopup_contents").width();
	            var ml = (oWidth-cWidth)/2;
	
	            var oHeight = $("#upload_feed").outerHeight();
	            var cHeight = $("#upload_layerPopup_contents").height();
	            var mt = (oHeight-cHeight)/2;
	
	            $("#upload_layerPopup_contents").css("margin-left", ml);
	            $("#upload_layerPopup_contents").css("margin-top", mt);
	            $("#upload_feed").show();
	        }
	
	        function fnUploadClose()
	        {
	            $("#upload_feed").hide();
	        }
        
            //레이어팝업 함수
            function fnLayerPopupOpen()
            {
                var oWidth = $("#layerPopup_feed").outerWidth();
                var cWidth = $("#feed_layerPopup_contents").width();
                var ml = (oWidth-cWidth)/2;

                var oHeight = $("#layerPopup_feed").outerHeight();
                var cHeight = $("#feed_layerPopup_contents").height();
                var mt = (oHeight-cHeight)/2;

                $("#feed_layerPopup_contents").css("margin-left", ml);
                $("#feed_layerPopup_contents").css("margin-top", mt);
                $("#layerPopup_feed").show();
            }

            function fnLayerPopupClose()
            {
                $("#layerPopup_feed").hide();
                fnFileReset();
            }
		</script>
    </head>

    <body>
    	<!-- 새 게시물 업로드 레이어팝업 html-->
        <div id="upload_feed">
            <div class="upload_layerPopup_bg" onclick="fnUploadClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- 새 게시물 업로드 레이어팝업 콘텐츠 html-->
            <div id="upload_layerPopup_contents">
                <div id="upload_top">
                    <div id="upload_backstep">
                        <img class="upload_backstep_btn" src="images\icon\arrow-left.png">
                    </div>
                    <div id="new_upload">
                        	새 게시물 만들기
                    </div>
                    <div id="upload_btn">
                        	공유하기
                    </div>
                </div>
                <div id="upload_main">
                    <div id="upload_contents"></div>
                    <div id="upload_options">
                        <div id="upload_profile">
                            <div id="upload_profile_img">
                                <img src="images\profile_img\my_profile.jpg">
                                <!-- todo : 계정 이미지 불러오기 -->
                            </div>
                            <div id="upload_profile_id">
                                asdfasdfasdfasdf
                                <!-- todo : 계정 ID 불러오기 -->
                            </div>
                        </div>
                        <div id="upload_text">
                            <textarea  placeholder="문구를 입력하세요..."></textarea>
                        </div>
                        <div id="upload_emoji">
                            <div id="upload_emoji_btn">
                                <img src="images\icon\emoji.png">
                            </div>
                            <div id="upload_text_charnum"></div>
                        </div>
                        <div id="upload_file">
                            <!-- todo : 파일업로드 구현 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
	        
        <!-- 프로필 피드 레이어팝업 html-->
        <div id="layerPopup_feed">
            <div id="feed_layerPopup_bg" onclick="fnLayerPopupClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- 레이어팝업 좌우버튼-->
            <div class="Next_btn_L">
                <img class="Next_btn" src="images\icon\next_WT_L.png">
            </div>
            <div class="Next_btn_R">
                <img class="Next_btn" src="images\icon\next_WT_R.png">
            </div>

            <!-- 피드 레이어팝업 콘텐츠 html-->
            <div id="feed_layerPopup_contents">
                <div id="FP_contents_img">
                    <ul>
                        <!-- todo : 클릭한 post의 img 뜨게하기-->
                        <li>
                            <img src="images\feed_img\feed1.jpg">
                        </li>
                    </ul>
                </div>
                <div id="FP_contents_post">
                    <div id="FPCP_account">
                        <div id="FPCP_account_area">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\my_profile.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                asdfasdfasdfasdf
                            </div>
                        </div>
                        <div id="FPCP_account_option">
                            <img src="images\icon\option.png"/>
                        </div>
                    </div>
                    <div id="FPCP_body">
                        <div id="FPCP_body_log">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\my_profile.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                asdfasdfasdfasdf
                            </div>
                            <div class="FPCP_text">
                             	   본문 텍스트 영역
                            </div>
                        </div>
                        <div class="FPCP_body_comment">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\1.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                lkjlkjlkjlkj
                            </div>
                            <div class="FPCP_text">
                             	   댓글 텍스트 영역
                            </div>
                        </div>
                    </div>
                    <div id="FPCP_PIS">
                        <div id="FPCP_PIS_btn">
                            <div class="FPCP_PIS_btn_L">
                                <ul>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\notice.png"/></li>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\comment.png"/></li>
                                </ul>
                            </div>
                            <div class="FPCP_PIS_btn_R">
                                <ul>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\bookmark.png"/></li>
                                </ul>
                            </div>
                        </div>
                        <div id="FPCP_PIS_like">
                            <span></span>님 외 <span></span>명이 좋아합니다
                        </div>
                        <div id="FPCP_PIS_date">업로드일자</div>
                    </div>
                    <div id="FPCP_reply">
                        <div id="FPCP_reply_emoji">
                            <img src="images\icon\emoji.png">
                        </div>
                        <div id="FPCP_reply_text">                            
                            <input type="text" placeholder="댓글 달기"/>
                        </div>
                        <div id="FPCP_reply_btn">
                            <!-- todo : 텍스트 없으면 비활성화-->
                      	      게시
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 메인페이지 html-->
        <div id="main">
            <div id="main_left">
                <div id="left_area">
                    <div id="main_logo">
                        <img onclick="goPage('logo');" src="images\icon\logo.png">
                    </div>
    
                    <div id="main_menu">
                        <ul>
                            <li onclick="goPage('home');">
                                <img class='main_menu_icon' src="images\icon\home.png"/>
                                <div id="menu_home">홈</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="images\icon\search.png"/>
                                <div id="menu_search">검색</div>
                            </li>
                            <!-- <li>
                                <img class='main_menu_icon' src="images\icon\explore.png"/>
                                <div id="menu_explore">탐색 탭</div>
                            </li> -->
                            <!-- <li>
                                <img class='main_menu_icon' src="images\icon\reels.png"/>
                                <div id="menu_reels">릴스</div>
                            </li> -->
                            <li>
                                <img class='main_menu_icon' src="images\icon\direct.png"/>
                                <div id="menu_direct">메시지</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="images\icon\notice.png"/>
                                <div id="menu_notice">알림</div>
                            </li>
                            <li onclick="fnUploadOpen();">
                                <img class='main_menu_icon' src="images\icon\upload.png"/>
                                <div id="menu_upload">만들기</div>
                            </li>
                            <li onclick="goPage('profile');">
                                <img class='main_menu_profile' src="images\profile_img\my_profile.jpg"/>
                                <!-- todo : 
                                    - DB에서 내 프로필 이미지 가져오기
                                    - 프로필 이미지 없으면 "icon\profile.png" 자동으로 띄우기 -->
                                <div id="menu_profile">프로필</div>
                            </li>
                        </ul>
                    </div>
    
                    <div id="main_moreMenu">
                        <ul>
                            <li>
                                <img class='main_menu_icon' src="images\icon\moreMenu.png"/>
                                <div id="moreMenu">
                                    <!-- todo : 더보기 내 메뉴 구현하기 -->
                                    	더 보기
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="main_middle">
                <div id="profile_middle_area">
                    <div id="profile_Top">
                        <div id="profile_TopImgArea">
                            <!-- todo : 내 계정에서만 클릭 활성화, 프로필사진 바꾸기 등 기능 넣기 -->
                            <div style="text-align: center;">
                                <img id='profile_TopImg' src="images\profile_img\my_profile.jpg">
                            </div>
                        </div>
                        <div id="profile_TopInfo">
                            <div id="Info_ID">
                                <!-- todo : 내ID불러오기 -->
                                <div id="Info_ID_name">계정ID</div>
                                <div id="Info_ID_option">
                                    <img src="images\icon\setting.png"/>
                                </div>
                            </div>
                            <div id="Info_Account">
                                <ul>
                                    <!-- todo : 게시물, 팔로워, 팔로우 숫자 불러오기 -->
                                    <li>
                                        	게시물<span></span>
                                    </li>
                                    <li>
                                        <div id="follower" style="cursor: pointer;">
                                           	 팔로워<span></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="follow" style="cursor: pointer;">
                                            	팔로우<span></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div id="Info_Text">
                                <div id="Info_Text1">한줄소개글</div>
                                <div id="Info_Text2">상세설명글</div>
                            </div>
                        </div>
                    </div>

                    <div id="profile_feedMenu">
                        <div id="feedMenu_log">
                            <img style="width: 12px; height: 12px; object-fit: cover; margin-right: 5px;" src="images\icon\grid.png"/>
                        	    게시물
                        </div>
                    </div>

                    <div id="profile_feedContents">
                        <ul class="feedContents_line">
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed1.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : 좋아요, 댓글 숫자 불러오기 -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed2.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : 좋아요, 댓글 숫자 불러오기 -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed3.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : 좋아요, 댓글 숫자 불러오기 -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>