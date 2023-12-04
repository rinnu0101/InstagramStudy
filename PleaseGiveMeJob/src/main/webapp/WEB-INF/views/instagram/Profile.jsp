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
        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        <link rel="stylesheet" href="css/FollowListPop.css">
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
    	<!-- 피드 공통 팝업 추가 -->
        <jsp:include page="FeedPop.jsp"></jsp:include>
        
        <!-- 새 게시물 업로드 레이어팝업 html-->
        <jsp:include page="UploadFeed.jsp"></jsp:include>
        
        <!-- 팔로우 리스트 팝업 추가 -->
	    <jsp:include page="FollowListPop.jsp"></jsp:include>
        
        <!-- 메인페이지 html-->
        <div id="main">
            <!-- 좌측 공통 메뉴영역 추가 -->
	        <jsp:include page="LeftMenu.jsp"></jsp:include>

			<!-- 메인 프로필 영역 -->
            <div id="main_middle">
                <div id="profile_middle_area">
                    <div id="profile_Top" v-for="u in pUser_info">
                        <div id="profile_TopImgArea">
                            <!-- todo : 내 계정에서만 클릭 활성화, 프로필사진 바꾸기 등 기능 넣기 -->
                            <div style="text-align: center;">
                                <img id='profile_TopImg' :src="u.file_name == null ? 'images\\icon\\profile.png' 
																				   : 'images\\profile_img\\' + u.file_name">
                            </div>
                        </div>
                        <div id="profile_TopInfo">
                            <div id="Info_ID">
                                <div id="Info_ID_name">{{u.user_nickname}}</div>
                                <div id="Info_follow" @click="fnFollow();">
                                	<div v-if="follow == false">[팔로우]</div>
                                	<div v-if="follow == true">[팔로잉]</div>
                                </div>
                                <div id="Info_message" v-if="follow != 'ME'">
                                	[메시지 보내기]
                                </div>
                                <div id="Info_ID_option" onclick="goPage('profileChange');">
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
                                        <div id="follower" @click="fnPopFollowing();" style="cursor: pointer;">
                                           	 팔로워<span></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="follow" @click="fnPopFollower();" style="cursor: pointer;">
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
                        <ul class="feedContents_line" v-if="feed_show == true">
                            <li v-for="(f, index) in feed_list">
                                <div class="feedContents_log" @click="fnFeedPopup(f.feed_idx);">
                                    <div class="log_img">
                                        <img :src="'images/feed_img/' + f.file_name">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>{{f.like_count}}</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>{{f.comment_count == null ? 0 : f.comment_count}}</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input id="pUser_idx" type="hidden" value="${pUser_idx}" />
    <input id="session_user_idx" type="hidden" value="${user_idx}" />
    </body>
</html>

<!-- 파일 업로드 js 적용 -->
<script src="js/upload.js"></script>

<!-- vue.js 적용  -->
<script type="module">
	import { createApp } from 'vue'
    createApp({
        data(){
            return {
                feed_list : []
                , file_names : []
                , feed_pop_info: []
                , feed_show : false
				, now_feed_idx : 0
				, feed_idx_list : []
				, pUser_idx : 0
				, pUser_info : []
				, follow : false
				, following_list : []
				, follower_list : []
				, follow_pop_show : false           
            }
        },
        mounted: function()
        {
			this.fnGetProfileInfo();
            this.fnGetFeedList();
        },
        methods: {
			//상단 프로필 정보 불러오기
            fnGetProfileInfo: function(p){
				if($("#pUser_idx").val() == "")
				{
					this.pUser_idx = $("#session_user_idx").val();
					$("#pUser_idx").val($("#session_user_idx").val());
					this.follow = "ME";
				}
				else
				{
					this.pUser_idx = $("#pUser_idx").val();
				}

                $.ajax({
					url : "/getProfileInfo.do",
					type : "POST",
					data : {
						"user_idx" : this.pUser_idx
					},
					context: this,
					success : function(p)
					{
						console.log("성공");
						//pUser_info에 DB에서 가져온 모든 p값을 넣어준다
						this.pUser_info = p;					
					},
					error : function(p)
					{
					    console.log("실패");		                  
					}
				});
            },
            //프로필 화면의 피드 리스트 불러오기 처리함수
            fnGetFeedList: function(){
				if($("#pUser_idx").val() == "")
				{
					this.pUser_idx = $("#session_user_idx").val();
					$("#pUser_idx").val($("#session_user_idx").val());
					this.follow = "ME";
				}
				else
				{
					this.pUser_idx = $("#pUser_idx").val();
				}

                $.ajax({
					url : "/getProfileFeedList.do",
					type : "POST",
					data : {
						"user_idx" : this.pUser_idx
					},
					context: this,
					success : function(p)
					{
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
            //팝업 피드의 댓글 처리 함수
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
            //팝업 피드 슬라이드 처리 함수
            fnPopFeedSlide : function(type){

				var cnt = this.feed_list.length;
				var target = 0;
				for(var i = 0; i<cnt; i++)
				{
					if(this.feed_list[i].feed_idx == this.now_feed_idx)
					{
						target = i;
					}
				}

				if(type == "next")
				{
					if(target == cnt)
					{
						alert("마지막임");
					}
					else
					{
						target = target + 1;
						this.fnFeedPopup(this.feed_list[target].feed_idx);
					}
				}
				else if(type == "prev")
				{
					if(target <= 0)
					{
						alert("가장 처음임");
					}
					else
					{
						target = target - 1;
						this.fnFeedPopup(this.feed_list[target].feed_idx);
					}
				}
			},
			fnFollow : function()
			{
				var followYN = "N"; 
				if(this.follow == false)
				{
					//팔로우
					followYN = "Y";
				}
				else
				{
					//언팔로우
				}

				$.ajax({
					url : "/setfollow.do",
					type : "POST",
					data : {
						"follow_yn" : followYN,
						"following_user_idx" : $("#pUser_idx").val()
					},
					context: this,
					success : function(p)
					{
						if(this.follow == true)
						{
							//언팔로우
							this.follow = false;
						}
						else
						{
							//팔로우
							this.follow = true;
						}
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
			},
			fnPopFollowing : function(){

				$.ajax({
					url : "/getfollowing.do",
					type : "POST",
					data : {
						"following_user_idx" : this.pUser_idx
					},
					context: this,
					success : function(p)
					{
						this.following_list = p;
						this.follow_pop_show = true;
						this.follow_pop_title = "팔로워";
						this.follow_pop_display_css = "flex";
						
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
			},
			fnPopFollower : function(){
				$.ajax({
					url : "/getfollower.do",
					type : "POST",
					data : {
						"follower_user_idx" : this.pUser_idx
					},
					context: this,
					success : function(p)
					{
						this.following_list = p;
						this.follow_pop_show = true;
						this.follow_pop_title = "팔로우";
						this.follow_pop_display_css = "flex";
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
			},
			fnFollwerDelete : function()
			{
				//todo
			},
			fnPopFollowClose : function()
			{
				this.follow_pop_show = false;
			}
        }
    }).mount('#app');
</script>