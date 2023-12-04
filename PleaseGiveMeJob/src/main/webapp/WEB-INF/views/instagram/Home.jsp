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
        <link rel="stylesheet" href="css/LeftMenu.css">
        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
        <!-- vue.js 적용 -->
        <script type="importmap">
            {
              "imports": {
                "vue": "https://unpkg.com/vue@3/dist/vue.esm-browser.js"
              }
            }
        </script>
        
    </head>
    <body>
    	<div id="app">
		    <!-- 파일 전송용 form -->
	    	<form name="tempForm" id="tempForm"></form>
	    
	        <!-- 피드 공통 팝업 추가 -->
	        <jsp:include page="FeedPop.jsp"></jsp:include>
	        
	    	<!-- 새 게시물 업로드 레이어팝업 html-->
	        <jsp:include page="UploadFeed.jsp"></jsp:include>
	
	        <!-- 새 스토리 업로드 레이어팝업 html-->
	        <jsp:include page="UploadStory.jsp"></jsp:include>
	    	
	        <!-- 스토리 레이어팝업 html-->
	        <jsp:include page="StoryPop.jsp"></jsp:include>
	
	        <!-- 메인페이지 html-->
	        <div id="main">
	            <!-- 좌측 공통 메뉴영역 추가 -->
	        	<jsp:include page="LeftMenu.jsp"></jsp:include>
	    
	    		<!-- 메인 피드 영역 -->
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
	                                        <img class='feed_profile' :src="f.file_name == null ? 'images\\icon\\profile.png'
	                                        													: 'images\\profile_img\\' + f.file_name" @click="fnGoProfile(f.user_idx);">
	                                        <div class="comp_account_name" @click="fnGoProfile(f.user_idx);">{{f.user_nickname}}</div>
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
	                                    <img class='myAccount_img_class' src="${file_name}"/>
	                                </div>
	                                <div class="Account_ID">
	                                    <div id="Account_myID">${user_nickname}</div>
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

<!-- vue.js 적용  -->
<script type="module">
    import { createApp } from 'vue'
    createApp({
        data() {
            return {
				feed_list : []
				, feed_show : false
				, file_margin : []
				, feed_pop_info : {}
				, now_feed_idx : 0
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
						"feed_idx" : feed_idx
					  , "like_type" : !like_type ? "0" : like_type
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
						p.file_names = JSON.parse(p.file_names); // js 객체를 문자열로 변환
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
			},
			fnGoProfile : function(user_idx)
			{				
				window.location.href = "/profile.do?user_idx=" + user_idx;
			}
		}
    }).mount('#app');
</script>

