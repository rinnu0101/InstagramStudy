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
		<link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/LeftMenu.css">
        <link rel="stylesheet" href="css/LeftMenuSkill.css">        
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
	        	
	        	<!-- 좌측 공통 메뉴영역 : 기능실행시 -->
	        	<jsp:include page="LeftMenuSkill.jsp"></jsp:include>

				<!-- 메인 홈 피드 화면 html-->
				<jsp:include page="Home.jsp"></jsp:include>
				
				<!-- 프로필 피드 화면 html-->
				<jsp:include page="Profile.jsp"></jsp:include>         
	        </div>   
        </div>
        
        <input id="session_user_idx" type="hidden" value="${user_idx}" />            
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
				home_feed_list : []
				, profile_feed_list : []
				, feed_pop_info: []
				, feed_show : false
				, now_feed_idx : 0
				, feed_idx_list : []
				, file_names : []
				, file_margin : []
				, popupSlide_btn : false
				, pUser_idx : 0
				, pUser_info : {}
				, follow : false
				, following_list : []
				, follower_list : []
				, follow_pop_show : false
				, view_page : "home"
				, menu_type : "normal"
				, search_list : []
				, search_list_original : []
				, search_keyword : "N"
				, search_css_display : "none"
            }
        },
		mounted: function() 
		{
			//document.(ready) 와 동일한 역할
			this.fnGetHomeFeedList();
			this.fnGetSearchList();
		},			
		methods: {
			//페이지 이동
			fnChangePage: function(p)
			{
				if(p == "home")
				{
					this.fnGetHomeFeedList();
				}
				if(p == "profile")
				{
					this.fnGetProfileInfo();
					this.fnGetProfileFeedList();
					this.menu_type = 'normal';
				}
				this.view_page = p;
			},
			//홈 화면의 피드 리스트 불러오기 처리함수
			fnGetHomeFeedList: function(){						
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
						this.home_feed_list = p;
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
			//검색 데이터 가져오기
			fnGetSearchList: function(){						
				//POST
				$.ajax({
					url : "/getSearchList.do",
					type : "POST",
					data : {},
					context: this,
					success : function(p)
					{
						this.search_list = p;
						this.search_list_original = p;
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
			},
			fnSetSearchList: function(e){		
				//현재값
				var keyword = e.target.value;
				if(keyword == "")
				{
					this.search_keyword = "N";
					this.search_css_display = "none";
				}
				else
				{
					this.search_keyword = "Y";
					this.search_css_display = "flex";				
					this.search_list = this.search_list_original.filter((user_info) => {
						var result = user_info.user_nickname.toUpperCase().indexOf(keyword.toUpperCase());
						return result != -1;
					});
				}				
			},
			//홈 화면 피드의 사진 슬라이드 처리 함수 
			fnMovefeedSlide: function(index, target)
			{
				var f = this.home_feed_list[index];
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
				if(this.home_feed_list[index].like_type == null)
				{
					this.home_feed_list[index].like_count = this.home_feed_list[index].like_count + 1;
				}
				else
				{
					this.home_feed_list[index].like_count = this.home_feed_list[index].like_count - 1;
				}
				this.home_feed_list[index].like_type = this.home_feed_list[index].like_type == null ? "1" : null;
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
			//피드의 댓글 저장
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
			//계정 프로필 이동
			fnGoProfile : function(user_idx)
			{
				this.pUser_idx = user_idx;
				this.fnChangePage('profile');
			},
			//계정 프로필의 상단 정보 불러오기
            fnGetProfileInfo: function(p){
				if(this.pUser_idx == "")
				{
					this.pUser_idx = $("#session_user_idx").val();
					$("#pUser_idx").val($("#session_user_idx").val());
					this.follow = "ME";
					$("#Info_follow").css("width", "100px");
					$("#Info_follow").css("background-color", "#DBDBDB");
					$("#Info_follow").css("color", "black");
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
						//if(p != null)
						//{
 	  					//	this.pUser_info = p[0];
						//}					
					},
					error : function(p)
					{
					    console.log("실패");		                  
					}
				});
            },
			//프로필 화면의 피드 리스트 불러오기 처리함수
            fnGetProfileFeedList: function(){
				if(this.pUser_idx == "")
				{
					this.pUser_idx = $("#session_user_idx").val();
					$("#pUser_idx").val($("#session_user_idx").val());
					this.follow = "ME";
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
						this.profile_feed_list = p;
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
			//프로필 화면에서 팝업 피드 슬라이드 처리 함수
            fnPopFeedSlide : function(type){

			var cnt = this.profile_feed_list.length;
			var target = 0;
			for(var i = 0; i<cnt; i++)
			{
				if(this.profile_feed_list[i].feed_idx == this.now_feed_idx)
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
					this.fnFeedPopup(this.profile_feed_list[target].feed_idx);
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
					this.fnFeedPopup(this.profile_feed_list[target].feed_idx);
				}
			}
			},
			//팔로우&언팔로우 처리 함수
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
						"following_user_idx" : this.pUser_idx
					},
					context: this,
					success : function(p)
					{
						if(this.follow == true)
						{
							//언팔로우
							this.follow = false;
							$("#Info_follow").css("background-color", "#0095F6");
							$("#Info_follow").css("color", "white");
						}
						if(this.follow == flase)
						{
							//팔로우
							this.follow = true;
							$("#Info_follow").css("background-color", "#DBDBDB");
							$("#Info_follow").css("color", "black");
						}
						if(this.follow == "ME")
						{
							//내 계정인 경우
						}
					},
					error : function(p)
					{
						console.log("실패");		                  
					}
				});
			},
			//팔로잉 리스트 팝업
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
			//팔로워 리스트 팝업
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
			},
			//좌측 메뉴 기능 타입 변경
			fnChangeMenu : function(p)
			{
				this.menu_type = p;
				if(p == "normal")
				{
					this.fnChangePage('home');
				}
			}
		}
    }).mount('#app');
</script>

