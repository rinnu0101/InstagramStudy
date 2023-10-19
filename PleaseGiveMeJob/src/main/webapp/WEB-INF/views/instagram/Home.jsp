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
        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        
        <script src="js/common.js"></script>
        
        <script>
            //레이어팝업 함수
            function fnLayerPopupOpen()
            {
                var oWidth = $("#layerPopup").outerWidth();
                var cWidth = $("#story_layerPopup_contents").width();
                var ml = (oWidth-cWidth)/2;

                var oHeight = $("#layerPopup").outerHeight();
                var cHeight = $("#story_layerPopup_contents").height();
                var mt = (oHeight-cHeight)/2;

                $("#story_layerPopup_contents").css("margin-left", ml);
                $("#story_layerPopup_contents").css("margin-top", mt);
                $("#layerPopup").show();
            }

            function fnLayerPopupClose()
            {
                $("#layerPopup").hide();
            }

            //스토리 재생, 멈춤 버튼 이미지 변경
            $(document).ready(function(){
                init();
            });

            function init()
            { 
                $(".SP_contents_play_btn").click(function(){
                    fn_story_btn_toggle();
                });
                $(".SP_contents_stop_btn").click(function(){
                    fn_story_btn_toggle();
                });
            }

            function fn_story_btn_toggle()
            {  
                if($(".SP_contents_play_btn").css("display") == "none")
                {
                    /*stop 클릭했을 때 play버튼으로 변경*/
                    $(".SP_contents_play_btn").show();
                    $(".SP_contents_stop_btn").hide();
                }
                else
                {
                    /*play 클릭했을 때 stop버튼으로 변경*/
                    $(".SP_contents_play_btn").hide();
                    $(".SP_contents_stop_btn").show();
                }
            }


        </script>
    </head>

    <body>
        <!-- 스토리 레이어팝업 html-->
        <div id="layerPopup">
            <div id="story_layerPopup_bg" onclick="fnLayerPopupClose();">
                <div class="layerPopupClose_btn">
                    <img src="img\icon\close_WT.png">
                </div>
            </div>

            <!-- 스토리 레이어팝업 좌우버튼-->
            <div class="Story_Next_btn_L">
                <img class="Story_Next_btn" src="img\icon\next_WT_L.png">
            </div>
            <div class="Story_Next_btn_R">
                <img class="Story_Next_btn" src="img\icon\next_WT_R.png">
            </div>

            <!-- 스토리 레이어팝업 콘텐츠 html-->
            <div id="story_layerPopup_contents">
                <div class="SP_contents_header">
                    <div class="SP_contents_length">
                        <!-- todo : 스토리 갯수에 따라 칸 일정하게 나눠져 증가하는 바 생성-->
                    </div>
                    <div class="SP_contents_account">
                        <div class="SP_account_profile">
                            <!-- todo : 클릭한 story 계정의 프로필 img 뜨게하기-->
                            <img class='SP_profile_img' src="img\profile_img\1.jpg">
                        </div>
                        <div class="SP_account_ID">asdfasdfasdf</div>
                        <div class="SP_contents_play">
                            <img class="SP_contents_play_btn" src="img\icon\play.png">
                            <img class="SP_contents_stop_btn" src="img\icon\stop.png" style="display: none;">
                        </div>
                    </div>
                </div>
                <div class="SP_contents_reaction">
                    <div class="SP_reaction_effect">
                        <!-- todo : 이모지 누르면 이펙트 구현-->
                    </div>
                    <div class="SP_contents_reaction_area">
                        <div class="SP_reaction_reply">
                            <div class="SP_reaction_reply_text">
                                <input type="text" placeholder="님에게 답장하기..."/>
                            </div>                            
                        </div>
                        <div class="SP_reaction_like">
                            <img class="SP_reaction_btn" src="img\icon\notice_lw.png">
                        </div>
                        <div class="SP_reaction_direct">
                            <img class="SP_reaction_btn" src="img\icon\direct_w.png">
                        </div>
                    </div>
                </div>
                <div class="SP_contents_img">
                    <ul>
                        <!-- todo : 클릭한 story의 img 뜨게하기-->
                        <li>
                            <img src="img\stroy_img\a.jpg">
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        

        <!-- 메인페이지 html-->
        <div id="main">
            <div id="main_left">
                <div id="left_area">
                    <div id="main_logo">
                        <img onclick="goPage('logo');" src="img\icon\logo.png">
                    </div>
    
                    <div id="main_menu">
                        <ul>
                            <li onclick="goPage('home');">
                                <img class='main_menu_icon' src="img\icon\home.png"/>
                                <div id="menu_home">홈</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\search.png"/>
                                <div id="menu_search">검색</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\explore.png"/>
                                <div id="menu_explore">탐색 탭</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\reels.png"/>
                                <div id="menu_reels">릴스</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\direct.png"/>
                                <div id="menu_direct">메시지</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\notice.png"/>
                                <div id="menu_notice">알림</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\upload.png"/>
                                <div id="menu_upload">만들기</div>
                            </li>
                            <li onclick="goPage('profile');">
                                <img class='main_menu_profile' src="img\profile_img\my_profile.jpg"/>
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
                                <img class='main_menu_icon' src="img\icon\moreMenu.png"/>
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
                <div id="middle_area">
                    <div id="main_contents">
                        <div id="main_contents_story">
                            <ul class="story_friend_ul">
                                <!-- todo : ul width auto 처리하기 -->
                                <li onclick="fnLayerPopupOpen();">
                                    <div class="story_profile">
                                        <img class='story_profile_img' src="img\profile_img\1.jpg">
                                    </div>
                                    <div class="story_accountName">asdfasdfasdfasdf</div>
                                </li>
                                <li>친구2</li>
                                <li>친구3</li>
                                <li>친구4</li>
                                <li>친구5</li>
                                <li>친구6</li>
                                <li>친구7</li>
                                <li>친구8</li>
                                <li>친구9</li>
                                <li>친구10</li>
                                <li>친구11</li>
                                <li>친구12</li>
                            </ul>
                        </div>
                        <div id="main_contents_feed">
                            <div class="feed_component">
                                <div class="comp_account">
                                    <div class="comp_account_img">
                                        <!-- todo : 계정 이미지&계정명 DB에서 받아오도록 하기 -->
                                        <img class='feed_profile' src="img\profile_img\my_profile.jpg">
                                        <div class="comp_account_name">계정명</div>
                                        <div class="comp_account_option">
                                            <img class='comp_option_icon' src="img\icon\option.png"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="comp_post">
                                    <ul>
                                        <li>
                                            <img class='post' src="img\feed_img\feed1.jpg">
                                        </li>
                                    </ul>
                                </div>
                                <div class="comp_PIS">
                                    <div class="comp_PIS_L">
                                        <ul>
                                            <li><img class='comp_PIS_icon' src="img\icon\notice.png"/></li>
                                            <li><img class='comp_PIS_icon' src="img\icon\comment.png"/></li>
                                            <li><img class='comp_PIS_icon' src="img\icon\direct.png"/></li>
                                        </ul>
                                    </div>
                                    <div class="comp_PIS_R">
                                        <ul>
                                            <li><img class='comp_bookmark_icon' src="img\icon\bookmark.png"/></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="comp_like">
                                    좋아요 <span></span>개
                                </div>
                                <div class="comp_text">
                                    <!-- todo
                                        - 계정명 DB에서 받아오도록 하기
                                        - 본문 1줄 이상 길어지면 [더 보기]버튼 활성화하여 접어두기 -->
                                    본문 텍스트 영역
                                </div>
                                <div class="comp_comment">
                                    <!-- todo
                                        - 댓글 1개 발생시 [댓글 1개 보기]버튼 활성화, 클릭시 팝업 피드에서 댓글 확인
                                        - 댓글 1개 이상 길어지면 [댓글 N개 모두 보기]버튼으로 변경하기
                                        - 댓글 작성자 계정명 기록하기 -->
                                        댓글 읽기 영역
                                </div>
                                <div class="comp_comment_writing">
                                    댓글 쓰기 영역
                                </div>
                            </div>
                        
                        </div>
                    </div>
                
                    <div id="main_right">
                        <div id="main_recommend">
                            <div id="recommend_myAccount">
                                <div class="myAccount_img">
                                    <img class='myAccount_img_class' src="img\profile_img\my_profile.jpg">
                                </div>
                                <div class="Account_ID">
                                    <div id="Account_myID">계정명</div>
                                    <div id="Account_myIntro">계정한줄소개</div>
                                </div>
                                <div id="myAccount_switch">전환</div>
                            </div>
                            <div id="recommend_otherAccount">
                                <div id="recommend_otherAccount_seeAllList">
                                    회원님을 위한 추천
                                    <!-- todo : 모두보기 버튼 만들기 -->
                                    <div id="seeAllList_btn">모두 보기</div>
                                </div>
                                <div id="recommend_otherAccount_list">
                                    <ul class="recommend_randomList">
                                        <!-- todo : 어떤 기준으로 랜덤하게 계정을 추천할 것인가? -->
                                        <li>
                                            <div class="otherAccount_img">
                                                <img class='otherAccount_img_class' src="img\profile_img\1.jpg">
                                            </div>
                                            <div class="Account_ID">
                                                <div class="Account_otherID">계정명</div>
                                                <div class="Account_otherIntro">계정한줄소개</div>
                                            </div>
                                            <div class="otherAccount_follow">팔로우</div>
                                        </li>
                                        <li>계정추천2</li>
                                        <li>계정추천3</li>
                                        <li>계정추천4</li>
                                        <li>계정추천5</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="main_information_area">
                            약관 및 정보 텍스트 영역
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        
    </body>
</html>