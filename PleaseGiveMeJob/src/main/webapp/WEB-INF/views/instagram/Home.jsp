<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        <script type="importmap">
            {
              "imports": {
                "vue": "https://unpkg.com/vue@3/dist/vue.esm-browser.js"
              }
            }
        </script>
        <script src="js/common.js"></script>
        
    </head>
    <body>
    	<div id="app">
		    <!-- 파일 전송용 form -->
	    	<form name="tempForm" id="tempForm"></form>
	    
	        <!-- 피드 공통 팝업 추가 -->
	        <jsp:include page="FeedPop.jsp"></jsp:include>
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
	                    <div id="upload_btn" onclick="fnSaveNewFeed();">
	                        	공유하기
	                    </div>
	                </div>
	                <div id="upload_main">
	                    <div id="upload_contents">
	                        <div id="file_insert">
		                    	<div class="file_insert_info">
		                    		사진과 동영상을 여기에 끌어다 놓으세요
		                    	</div>
		                    	<div class="file_insert_btn" onclick="fnFileSelect();">
		                    		컴퓨터에서 선택
		                    	</div>
	                            <div style="display: none;">
	                                <input id="input_file_feed" type="file" multiple="multiple"/>
	                            </div>
	                    	</div>
	                        <!-- upload file li 받는 ul -->
	                    	<ul class="upload_contents_ul" style="display:none;">
	                        </ul>
	                        <!-- li 슬라이드 버튼 -->
	                        <!-- todo : li 수량이 2개 이상일 때만 버튼 show, 맨 왼쪽/오른쪽 도달시 한쪽 버튼 hide -->
	                        <div class="upload_contents_arrow" style="display:none;">
	                            <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
	                                <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	                            </a>
	                            <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
	                                <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	                            </a>
	                        </div>
	                        <!-- todo : 파일 선택 후 활성화 -->
	                    	<!-- <ul class="upload_contents_ul">
	                            <li>
	                            	<img class='upload_contents_img' src="images\feed_img\feed1.jpg">
	                            </li>
	                            <li>
	                            	<img class='upload_contents_img' src="images\feed_img\feed2.jpg">
	                            </li>
	                            <li>
	                            	<img class='upload_contents_img' src="images\feed_img\feed3.jpg">
	                            </li>
	                            <li>
	                            	<img class='upload_contents_img' src="images\feed_img\feed4.jpg">
	                            </li>
	                            <li>
	                            	<img class='upload_contents_img' src="images\feed_img\feed5.jpg">
	                            </li>
	                        </ul>
	                        <div class="upload_contents_arrow">
	                            <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
	                                <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	                            </a>
	                            <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
	                                <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	                            </a>
	                        </div> -->
	                    </div>
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
	
	        <!-- 새 스토리 업로드 레이어팝업 html-->
	        <div id="upload_story">
	            <div class="upload_layerPopup_bg" onclick="fnStoryUploadClose();">
	                <div class="layerPopupClose_btn">
	                    <img src="images\icon\close_WT.png">
	                </div>
	            </div>
	
	            <!-- 새 스토리 콘텐츠 html-->
	            <div id="upload_story_contents">
	                <div id="story_file_insert">
	                    <div class="file_insert_info">
	                        	사진과 동영상을 여기에 끌어다 놓으세요
	                    </div>
	                    <div class="file_insert_btn" onclick="fnStoryFileSelect();">
	                        	컴퓨터에서 선택
	                    </div>
	                    <div style="display:none;">
	                        <input id="input_file_story" type="file" multiple="multiple" />
	                    </div>
	                </div>
	                <!-- upload file li 받는 ul -->
	                <ul class="upload_story_contents_ul" style="display:none;">
	                </ul>
	                <!-- li 슬라이드 버튼 -->
	                <!-- todo : li 수량이 2개 이상일 때만 버튼 show, 맨 왼쪽/오른쪽 도달시 한쪽 버튼 hide -->
	                <div class="upload_story_arrow" style="display:none;">
	                    <a href="javascript:;" class="prev" onclick="fnStoryMoveUploadSlide(this);">
	                        <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	                    </a>
	                    <a href="javascript:;" class="next" onclick="fnStoryMoveUploadSlide(this);">
	                        <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	                    </a>
	                </div>
	                <div id="upload_story_btn" style="display:none;" onclick="fnSaveNewStory();">
	                    	내 스토리
	                </div>
	            </div>
	        </div>
	    	
	        <!-- 스토리 레이어팝업 html-->
	        <div id="layerPopup_story">
	            <div id="story_layerPopup_bg" onclick="fnLayerPopupClose();">
	                <div class="layerPopupClose_btn">
	                    <img src="images\icon\close_WT.png">
	                </div>
	            </div>
	
	            <!-- 스토리 레이어팝업 좌우버튼-->
	            <div class="Story_Next_btn_L">
	                <img class="Story_Next_btn" src="images\icon\next_WT_L.png">
	            </div>
	            <div class="Story_Next_btn_R">
	                <img class="Story_Next_btn" src="images\icon\next_WT_R.png">
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
	                            <img class='SP_profile_img' src="images\profile_img\1.jpg">
	                        </div>
	                        <div class="SP_account_ID">asdfasdfasdf</div>
	                        <div class="SP_contents_play">
	                            <img class="SP_contents_play_btn" src="images\icon\play.png">
	                            <img class="SP_contents_stop_btn" src="images\icon\stop.png" style="display: none;">
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
	                            <img class="SP_reaction_btn" src="images\icon\notice_lw.png">
	                        </div>
	                        <div class="SP_reaction_direct">
	                            <img class="SP_reaction_btn" src="images\icon\direct_w.png">
	                        </div>
	                    </div>
	                </div>
	                <div class="SP_contents_img">
	                    <ul>
	                        <!-- todo : 클릭한 story의 img 뜨게하기-->
	                        <li>
	                            <img src="images\stroy_img\a.jpg">
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
	                <div id="middle_area">
	                    <div id="main_contents">
	                        <div id="main_contents_story">
	                            <ul class="story_friend_ul">
	                                <li class="story_upload" onclick="fnStoryUpload();">
	                                    <div class="story_upload_btn">
	                                        <img class='story_upload_btn_img' src="images\icon\upload.png">
	                                    </div>
	                                    <div class="story_accountName">새 스토리</div>
	                                </li>
	                                <li onclick="fnLayerPopupOpen();">
	                                    <div class="story_profile">
	                                        <img class='story_profile_img' src="images\profile_img\1.jpg">
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
	                            <div class="story_arrow_prev">
	                                <a href="javascript:;" class="prev" onclick="fnMoveStorySlide(this);">
	                                    <img class='story_arrow_img' src="images\icon\next_WT_L.png">
	                                </a>
	                            </div>
	                            <div class="story_arrow_next">
	                                <a href="javascript:;" class="next" onclick="fnMoveStorySlide(this);">
	                                    <img class='story_arrow_img' src="images\icon\next_WT_R.png">
	                                </a>
	                            </div>
	                            <!-- <div class="story_arrow">
	                                <a href="javascript:;" class="prev" onclick="fnMoveStorySlide(this);">
	                                    <img class='story_arrow_img' src="images\icon\next_WT_L.png">
	                                </a>
	                                <a href="javascript:;" class="next" onclick="fnMoveStorySlide(this);">
	                                    <img class='story_arrow_img' src="images\icon\next_WT_R.png">
	                                </a>
	                            </div> -->
	                        </div>
	                        <div id="main_contents_feed" v-for="(f, index) in feed_list" v-if="feed_show == true">
	                            <div class="feed_component"> 
	                                <div class="comp_account">
	                                    <div class="comp_account_img">
	                                        <!-- todo : 계정 이미지&계정명 DB에서 받아오도록 하기 -->
	                                        <img class='feed_profile' src="images\profile_img\my_profile.jpg">
	                                        <div class="comp_account_name">{{f.user_nickname}}</div>
	                                        <div class="comp_account_option">
	                                            <img class='comp_option_icon' src="images\icon\option.png"/>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="comp_post">
	                                    <ul v-bind:id="'file_' + index">
	                                        <li v-for="file_path in f.file_names">
	                                            <img class='post' :src="'images/feed_img/' + file_path">
	                                        </li>
	                                    </ul>
										<div class="feed_contents_arrow">
											<a href="javascript:;" class="prev">
												<img class='upload_arrow_img' v-if="f.file_length != 1 && f.file_index != 0" src="images\icon\next_WT_L.png"  @click="fnMovefeedSlide(index, 'prev')">
											</a>
											<a href="javascript:;" class="next">
												<img class='upload_arrow_img' v-if="f.file_length != (f.file_index + 1)"  src="images\icon\next_WT_R.png" @click="fnMovefeedSlide(index, 'next')">
											</a>
										</div>
	                                </div>
	                                <div class="comp_PIS">
	                                    <div class="comp_PIS_L">
	                                        <ul>
	                                            <li @click="fnLikeClick(f.feed_idx, f.like_type, index);">
													<img class="comp_PIS_icon" :src="f.like_type == null ? 'images\\icon\\notice.png' 
																										 : 'images\\icon\\notice_r.png'">
												</li>
	                                            <li @click="fnFeedPopup(f.feed_idx);"><img class="comp_PIS_icon" src="images\icon\comment.png"></li>
	                                            <li><img class="comp_PIS_icon" src="images\icon\direct.png"></li>
	                                        </ul>
	                                    </div>
	                                    <div class="comp_PIS_R">
	                                        <ul>
	                                            <li><img class="comp_bookmark_icon" src="images\icon\bookmark.png"></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="comp_like">
	                                    	좋아요 <span>{{f.like_count}}</span>개
	                                </div>
	                                <div class="comp_text">
	                                    <!-- todo
	                                        - 계정명 DB에서 받아오도록 하기
	                                        - 본문 1줄 이상 길어지면 [더 보기]버튼 활성화하여 접어두기 -->
	                                   	 본문 텍스트 영역
	                                   	 {{f.feed_contents}}
	                                   	 <div v-if="f.feed_contents.length > 4">더 보기</div>
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
	                                    <img class='myAccount_img_class' src="images\profile_img\my_profile.jpg">
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
	                                                <img class='otherAccount_img_class' src="images\profile_img\1.jpg">
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
        </div>     
    </body>
</html>
<!-- 파일 업로드 js 적용 -->
<script src="js/upload.js"></script>
<!-- 화면 초기화 및 기본 기능 적용 -->
<script>
    $(document).ready(function(){
        init();
    });
</script>
<!-- vue.js 적용  -->
<script type="module">
    import { createApp } from 'vue'
    createApp({
        data() {
            return {
				feed_list : [],
				feed_show : false,
				file_margin : [],
				feed_pop_info : {},
				now_feed_idx : 0
            }
        },
		mounted: function() 
		{
			//document.(ready) 와 동일한 역할
			this.fnGetFeedList();
		},			
		methods: {
			//홈 화면의 피드 리스트 불러오기 처리함수
			fnGetFeedList: function(){						
				//POST
				$.ajax({
					url : "/getFeedTemp.do",
					type : "POST",
					data : {},
					context: this,
					success : function(p)
					{
						var cnt = p.length;
						for(var i=0; i<cnt; i++)
						{
							p[i].file_names = JSON.parse(p[i].file_names);
							p[i].file_index = 0;
							p[i].file_length = p[i].file_names.length;
						}
						this.feed_list = p;
						this.feed_show = true;
						//todo
						//this.loading_progress = false;
					},
					error : function(p)
					{
					console.log("실패");		                  
					}
				});
			},
			//홈 화면 피드의 사진 슬라이드 처리 함수 
			fnMovefeedSlide: function(index, target)
			{
				var f = this.feed_list[index];
				if (target == 'next')
				{
					if (f.file_index != f.file_length)
					{
						f.file_index = f.file_index + 1;
						var trs = (468 * f.file_index) * -1;
						$("#file_" + index).animate({marginLeft : trs});
					}
				}
				else if (target == 'prev')
				{
					if (f.file_index != 0)
					{
						f.file_index = f.file_index -1;
						var trs = (468 * f.file_index) * -1;
						$("#file_" + index).animate({marginLeft : trs});
					}
				}
			},
			//홈 화면의 피드 좋아요 처리 함수
			fnLikeClick: function(feed_idx, like_type, index)
			{
				$.ajax({
					url : "/setLikeClick.do",
					type : "POST",
					data : {
						"feed_idx" : feed_idx,
						"like_type" : !like_type ? "0" : like_type,
					},
					context: this,
					success : function(p)
					{

					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
				if(this.feed_list[index].like_type == null)
				{
					this.feed_list[index].like_count = this.feed_list[index].like_count + 1;
				}
				else
				{
					this.feed_list[index].like_count = this.feed_list[index].like_count - 1;
				}
				this.feed_list[index].like_type = this.feed_list[index].like_type == null ? "1" : null;
			},
			//선택 피드 팝업 함수
			fnFeedPopup : function(feed_idx)
			{			
				this.now_feed_idx = feed_idx;
				$.ajax({
					url : "/getFeedPopup.do",
					type : "POST",
					data : {
						"feed_idx" : feed_idx
					},
					context: this,
					success : function(p)
					{
						$("#popFileList").css("margin-left", "0px");
						//DB에서 파일 정보 가져오기
						p.file_names = JSON.parse(p.file_names);
						p.file_index = 0;
						p.file_length = p.file_names.length;
						//댓글 배열에 값 있을때만 feed_reply_list 띄우기
						var jsonReply = JSON.parse(p.feed_reply_list);
						if(jsonReply[0].user_idx != null)
						{
							p.feed_reply_list = jsonReply.sort(function(a, b)
												{ return a.feed_reply_idx - b.feed_reply_idx });
						}
						else
						{
							p.feed_reply_list = [];
						}
						//feed_pop_info에 DB에서 가져온 모든 p값을 넣어준다
						this.feed_pop_info = p;
						$("#layerPopup_feed").show();
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
				fnPopFeed();
			},
			//팝업 피드의 사진 슬라이드 처리 함수
			fnPopMovefeedSlide : function(target)
			{
				var f = this.feed_pop_info;
				if (target == 'next')
				{
					if (f.file_index != f.file_length)
					{
						f.file_index = f.file_index + 1;
						var trs = (875 * f.file_index) * -1;
						$("#popFileList").animate({marginLeft : trs});
					}
				}
				else if (target == 'prev')
				{
					if (f.file_index != 0)
					{
						f.file_index = f.file_index -1;
						var trs = (875 * f.file_index) * -1;
						$("#popFileList").animate({marginLeft : trs});
					}
				}
			},
			//팝업 피드의 좋아요 처리 함수
			fnPopLikeClick: function(feed_idx, like_type)
			{
				var f = this.feed_pop_info;
				$.ajax({
					url : "/setLikeClick.do",
					type : "POST",
					data : {
						"feed_idx" : f.feed_idx,
						"like_type" : !f.like_type ? "0" : f.like_type,
					},
					context: this,
					success : function(p)
					{

					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
				if(f.like_type == null)
				{
					f.like_count = f.like_count + 1;
				}
				else
				{
					f.like_count = f.like_count - 1;
				}
				f.like_type = f.like_type == null ? "1" : null;
			},
			fnSaveReply : function()
			{
				var reply = $("#FPCP_reply_text").find("input").val();
				this.feed_pop_info.feed_reply_list.push({ "feed_reply_contents" : reply , "user_nickname" : "테스트" });
				$("#FPCP_reply_text").find("input").val("");
				//ajax Insert 처리
				$.ajax({
					url : "/setFeedReply.do",
					type : "POST",
					data : {
						"feed_idx" : this.now_feed_idx,
						"feed_reply_contents" : reply,
					},
					context: this,
					success : function(p)
					{

					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});

			}	
		}
    }).mount('#app');
</script>

