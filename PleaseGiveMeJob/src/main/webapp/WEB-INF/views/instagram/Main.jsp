<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- css 리셋 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!-- 스타일시트 적용 -->
<link rel="stylesheet" href="css/Home.css">
<link rel="stylesheet" href="css/Profile.css">
<link rel="stylesheet" href="css/ProfileChange.css">
<link rel="stylesheet" href="css/LeftMenu.css">
<link rel="stylesheet" href="css/LeftMenuSkill.css">
<link rel="stylesheet" href="css/LayerPopup.css">
<link rel="stylesheet" href="css/FollowListPop.css">
<link rel="stylesheet" href="css/OptionPop.css">
<!-- 공통js 적용 -->
<script src="js/common.js"></script>
<script src="js/upload.js"></script>
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

		<!-- 새 게시물 업로드 레이어팝업 html-->
		<jsp:include page="UploadFeed.jsp"></jsp:include>

		<!-- 피드 공통 팝업 추가 -->
		<jsp:include page="FeedPop.jsp"></jsp:include>

		<!-- 새 스토리 업로드 레이어팝업 html-->
		<jsp:include page="UploadStory.jsp"></jsp:include>

		<!-- 스토리 레이어팝업 html-->
		<jsp:include page="StoryPop.jsp"></jsp:include>

		<!-- 팔로우 리스트 레이어팝업 html-->
		<jsp:include page="FollowListPop.jsp"></jsp:include>

		<!-- 팔로우 리스트 레이어팝업 html-->
		<jsp:include page="MoreMenuPop.jsp"></jsp:include>

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

			<!-- 프로필 정보 변경 화면 html-->
			<jsp:include page="ProfileChange.jsp"></jsp:include>
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
    window.app = createApp({
        data() {
            return {
				home_feed_list : []                // 메인 홈 피드 정보 리스트
				, home_feed_list_temp : []		   // 메인 홈 피드 정보 리스트 업데이트 후 임시 리스트
				, home_story_list : []			   // 메인 홈 스토리 정보 리스트
				, story_view_list : []			   // 선택한 스토리 컨텐츠 리스트
				, story_popup_show : false    	   // 스토리 팝업 show 조건
				, now_story_index : 0			   // 현재 선택한 스토리 index
				, view_story_img : ""              // 현재 선택한 스토리 내 이미지 경로
				, view_story_img_index : 0         // 현재 선택한 스토리 내 이미지 index
				, session_user_info : []		   // 내 세션 정보 저장
				, profile_feed_list : []           // 프로필 피드 정보 리스트
				, profileImgChg : "N"              // 프로필 이미지 변경 여부 체크
				, profileImgFile : ""              // 프로필 이미지 변경시 파일명
				, profileNickDuplChk : ""          // 프로필 닉네임 중복 체크				
				, feed_pop_info: []                // 선택한 피드 팝업의 정보값
				, feed_show : false                // 홈 or 프로필 화면의 피드 show 조건
				, story_list_show : false          // 홈 화면의 스토리 리스트 show 조건 
				, now_feed_idx : 0                 // 선택한 피드 키값(idx)
				//, feed_idx_list : []               // 
				//, file_names : []                  // 파일 슬라이드 처리를 위한 리스트
				//, file_margin : []                 //
				, popupSlide_btn : false           // 슬라이드 버튼 활성화 (양 끝단에 다다를 경우 해당 버튼 hide)
				, pUser_idx : 0                    // 내가 클릭한 계정의 키값(idx)
				, pUser_info : {}                  // 내가 클릭한 계정정보 json
				, follow : false                   // 선택 계정의 팔로우 여부 체크 (팔로우, 언팔로우, 내 계정)
				, following_list : []              // 내가 팔로우 한 계정 리스트
				, follower_list : []               // 나를 팔로우 한 계정 리스트
				, follow_pop_show : false          // 팔로우 리스트 팝업 화면 show/hide
				, view_page : "home"               // 메인 영역에 보여질 화면 체크
				, menu_type : "normal"             // 좌측 공통 메뉴 상태 체크 (기본, 검색, DM, 알림 등)
				, search_list : []                 // 검색 결과 리스트
				, search_list_original : []        // 검색 키워드 비교를 위한 계정 전체 리스트
				, search_keyword : "N"             // 좌측 검색창 내 input 값 유무 체크
				, search_css_display : "none"      // 좌측 검색창 화면 show/hide
				, moreMenu_popup_show : false      // 더보기 메뉴 팝업 show 조건
				, Feed_Option_show : false         // 피드 옵션 팝업 show 조건
				, Story_Option_show : false        // 스토리 옵션 팝업 show 조건
				, recommend_list : []              // 계정 추천 리스트
				, version : 0				       //img 새로고침 version 체크
				, Feed_Option_margin_css : 0	   //img 새로고침 version 체크
            }
        },
		mounted: function() 
		{
			//document.(ready) 와 동일한 역할
			this.session_user_idx = $("#session_user_idx").val();
			this.fnGetProfileInfo();
			this.fnGetHomeFeedList();
			this.fnGetHomeStoryList();
			this.fnGetSearchList();
			this.fnGetRecommendList();
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
			//홈 피드 contents text 길이 체크
			feed_content_togle: function(index){
				this.home_feed_list[index].feed_contents_multi = false;
			},
			//홈 화면의 피드 리스트 불러오기 처리함수
			fnGetHomeFeedList: function(){						
				//POST
				$.ajax({
					url : "/getFeedList.do",
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
							if(p[i].feed_contents.includes("\r") || p[i].feed_contents.length > 27)
							{
								//개행있거나 text length 너무 길 경우 더보기 표시
								p[i].feed_contents_multi = true;
								p[i].feed_contents_simple = p[i].feed_contents.substr(0, 27);
							}
							else
							{
								//아닐 경우 한줄 표시
								p[i].feed_contents_multi = false;
							}
						}
						this.home_feed_list = p;
						this.feed_show = true;

						this.view_page = "home";
						//todo
						//this.loading_progress = false;
					},
					error : function(p)
					{
					console.log("피드 리스트 불러오기 실패");		                  
					}
				});
			},
			//홈 화면의 피드 저장후 리스트 업데이트
			fnGetHomeFeedUpdate: function(){						
				//POST
				$.ajax({
					url : "/getFeedList.do",
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
							if(p[i].feed_contents.includes("\r") || p[i].feed_contents.length > 12)
							{
								//개행있거나 너무 길경우 경우 더보기 표시
								p[i].feed_contents_multi = true;
								p[i].feed_contents_simple = p[i].feed_contents.substr(0, 12);
							}
							else
							{
								//아닐 경우 한줄 표시
								p[i].feed_contents_multi = false;
							}
						}
						this.home_feed_list_temp = p;
						
						var that = this;
						setTimeout(() => {
							that.home_feed_list = that.home_feed_list_temp;
                    		$("#upload_loading").css("display", "none");
            				fnUploadClose();
						}, 6000);

						this.view_page = "home";
					},
					error : function(p)
					{
					console.log("피드 리스트 불러오기 실패");		                  
					}
				});
			},
			//홈 화면의 스토리 리스트 불러오기 처리함수
			fnGetHomeStoryList: function(){						
				//POST
				$.ajax({
					url : "/getStoryList.do",
					type : "POST",
					data : {},
					context: this,
					success : function(p)
					{
						this.home_story_list = p;
						this.story_list_show = true;
						//todo
						//this.loading_progress = false;
					},
					error : function(p)
					{
						console.log("스토리 리스트 불러오기 실패");		                  
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
						console.log("검색 데이터 불러오기 실패");		                  
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
						console.log("피드 좋아요 실패");		                  
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
				console.log("feed_idx : " + feed_idx);
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
						console.log("선택 피드 팝업 실패");		                  
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
						console.log("피드 좋아요 실패");		                  
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
				//this.feed_pop_info.feed_reply_list.push({ "feed_reply_contents" : reply , "user_nickname" : "테스트" });
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
						this.fnFeedPopup(this.now_feed_idx);
					},
					error : function(p)
					{
						console.log("댓글 저장 실패");		                  
					}
				});
			},
			//선택 스토리 팝업 함수
			fnStoryPopup : function(story_index)
			{	
				var user_idx = this.home_story_list[story_index].user_idx;
				this.now_story_index = story_index;

				$.ajax({
					url : "/getStoryPopup.do",
					type : "POST",
					data : {
						"user_idx" : user_idx
					},
					context: this,
					success : function(p)
					{
						this.story_view_list.story_file_list = p;
						this.story_view_list.user_nickname = p[0].user_nickname;
						this.story_view_list.user_idx = p[0].user_idx;
						this.story_view_list.file_name = p[0].file_name; 
						this.view_story_img_index = 0;

						var file_cnt = this.story_view_list.story_file_list.length;
						this.story_view_list.file_cnt = file_cnt				
						var progress = (458-(2 * file_cnt)) / file_cnt ; //486 : 전체 사이즈, 2:margin-left

						this.story_view_list.progress_eq_width = progress;				
						this.story_popup_show = true;

						var i = 1;
						var progress_target = ".SP_contents_background_progress";
						var that = this;
						setTimeout(() => {
							$(progress_target).eq(0).animate({width:progress}, 10000, function()
								{
									if(file_cnt > 1){
										that.fnMoveStorySlide("next");
									}
								});
						}, 500);

						this.view_story_img = p[0].story_file_name;
						$('body').css("overflow-y", "hidden");
					},
					error : function(p)
					{							                  
					}
				});
			},
			//선택한 스토리 닫기
			fnLayerPopupClose : function()
			{
				this.story_popup_show = false;
				$('body').css("overflow-y", "auto");
			},
			//스토리 사진 슬라이드 처리 함수
			//1. 클릭시 선택 스토리 내 이미지 순차 노출
			//2. 스토리 내 이미지 index 마지막에 도달하면 다음 스토리 index 호출
			fnMoveStorySlide: function(target)
			{
				var s = this.now_story_index; // 현재 선택한 스토리 index
				var i = this.view_story_img_index; // 선택 스토리 내 이미지 index

				// 상단 스토리 진행 바 갯수 나누기 = (전체길이-(좌우 border * 파일 갯수)/파일 갯수)
				var progress = (458-(2 * this.story_view_list.file_cnt)) / this.story_view_list.file_cnt;				
				var progress_target = ".SP_contents_background_progress";

				if (target == 'next')
				{
					if ((i+1) < this.story_view_list.file_cnt)
					{
						var that = this;
						
						$(progress_target).eq(i).stop();
						$(progress_target).eq(i).css("width", progress + "px");
						$(progress_target).eq(i+1).animate({width:progress}, 10000, function()
							{
								that.fnMoveStorySlide("next");
							}
						);
						
						this.view_story_img_index = this.view_story_img_index + 1;
						this.view_story_img = this.story_view_list.story_file_list[this.view_story_img_index].story_file_name;
					}
					else
					{
						if(s+1 < this.home_story_list.length)
						{							
							this.fnStoryPopup(s+1);
							$(progress_target).eq(i).stop();
							$(progress_target).css("width", 0 + "px");
						}					
					}
				}
				else if (target == 'prev')
				{
					if (i != 0)
					{
						var that = this;

						$(progress_target).eq(i).stop();
						$(progress_target).eq(i).css("width", 0 + "px");
						$(progress_target).eq(i-1).css("width", 0 + "px");
						$(progress_target).eq(i-1).animate({width:progress}, 10000, function()
							{
								that.fnMoveStorySlide("next");
							}
						);

						this.view_story_img_index = this.view_story_img_index -1;
						this.view_story_img = this.story_view_list.story_file_list[this.view_story_img_index].story_file_name;
					}
					else
					{
						if(s != 0)
						{							
							this.fnStoryPopup(s-1);
							$(progress_target).eq(i).stop();
							$(progress_target).css("width", 0 + "px");
						}					
					}
				}
			},
			//계정 프로필 이동
			fnGoProfile : function(user_idx)
			{
				if(user_idx == $("#session_user_idx").val())
				{
					this.pUser_idx = "";
				}
				else
				{
					this.pUser_idx = user_idx;
				}

				this.fnChangePage('profile');
			},
			//계정 프로필의 상단 정보 불러오기
            fnGetProfileInfo: function(p){
				if(this.pUser_idx == "")
				{
					this.pUser_idx = $("#session_user_idx").val();
					$("#pUser_idx").val($("#session_user_idx").val());
					this.follow = "ME";
				}
				else
				{
					this.follow = "";
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

						if(this.follow == "ME")
						{
							this.session_user_info = p;	
							$("#Info_follow").css("width", "100px");
							$("#Info_follow").css("background-color", "#DBDBDB");
							$("#Info_follow").css("color", "black");
						}
						else if(p.follower_user_idx == 0)
						{
							this.follow = false;							
							$("#Info_follow").css("background-color", "#0095F6");
							$("#Info_follow").css("color", "white");
						}
						else
						{
							this.follow = true;							
							$("#Info_follow").css("background-color", "#DBDBDB");
							$("#Info_follow").css("color", "black");
						}

						//if(p != null)
						//{
 	  					//	this.pUser_info = p[0];
						//}					
					},
					error : function(p)
					{
					    console.log("프로필 정보 불러오기 실패");		                  
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
					    console.log("피드 리스트 불러오기 실패");		                  
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
						else if(this.follow == false)
						{
							//팔로우
							this.follow = true;
							$("#Info_follow").css("background-color", "#DBDBDB");
							$("#Info_follow").css("color", "black");
						}
						else if(this.follow == "ME")
						{
							//내 계정인 경우
						}
					},
					error : function(p)
					{
						console.log("팔로우 or 언팔로우 실패");		                  
					}
				});
			},
			//추천 리스트 팔로우&언팔로우 처리 함수
			fnRecommFollow : function(pUser_idx, index)
			{
				var followYN = "N"; 
				if(this.recommend_list[index].follow == null)
				{
					//팔로우
					followYN = "Y";
				}

				$.ajax({
					url : "/setfollow.do",
					type : "POST",
					data : {
						"follow_yn" : followYN,
						"following_user_idx" : pUser_idx
					},
					context: this,
					success : function(p)
					{
						if(this.recommend_list[index].follow == true)
						{
							//언팔로우
							this.recommend_list[index].follow = null;
						}
						else if(this.recommend_list[index].follow == null)
						{
							//팔로우
							this.recommend_list[index].follow = true;
						}
					},
					error : function(p)
					{
						console.log("추천리스트 팔로우 or 언팔로우 실패");		                  
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
						console.log("팔로잉 리스트 불러오기 실패");		                  
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
						console.log("팔로워 리스트 불러오기 실패");		                  
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
			//프로필 이미지 파일 선택 함수
			fnProfileImgSelect : function()
			{
				$('#input_file_Profile').click();
			},
			//선택한 프로필 이미지 반영 함수
			fnProfileImgPrint : function(e)
			{
				this.profileImgFile = e.target.files;
				
				//선택한 이미지 미리보기
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#profile_img img').attr('src', e.target.result);
				};
				reader.readAsDataURL(this.profileImgFile[0]);
				
				this.profileImgChg = "Y";
			},
			//프로필 정보 중복 체크
			fnProfileDuplChk : function(e)
			{
				var duplChk = this.search_list_original.filter(function(p){
					return p.user_nickname == e.target.value;
				});

				if(duplChk == 0)
				{
					//중복 아님
					this.profileNickDuplChk = "check";	

				}
				else
				{
					//중복
					this.profileNickDuplChk = "error";	
				}
			},
			//프로필 정보 저장 함수
			fnSaveProfile : function()
			{
				if(this.profileNickDuplChk == "error")
				{					
					alert("닉네임이 중복입니다.");
					return false;
				}

				//파일 업로드
				var form = $("form")[0];
				var formData = new FormData(form);
				
				var name = $(".profile_name").find("input").val().replace(/\s/gi, "");
				var nickname = $(".profile_nickname").find("input").val().replace(/\s/gi, "");
				var pw = $(".profile_PW").find("input").val().replace(/\s/gi, "");
				//.replace(/\s/gi, "") --> 입력값의 모든 공백 제거
				var intro = $(".profile_intro").find("textarea").val();				

				var userNicknameChg = "N"; //닉네임 변경 여부 체크				
				var userPWChg = "N"; // 비밀번호 변경 여부 체크
				var introChg = "N"; // 한줄소개글 변경 여부 체크
				var userNameChg = "N";	// 상세소개글 변경 여부 체크

				if(name != "")
				{
					userNameChg = "Y";	
				}
				
				if(nickname != "")
				{
					userNicknameChg = "Y";	
				}
				
				if(pw != "")
				{
					userPWChg = "Y";
				}				

				formData.append("profile_img_chg", this.profileImgChg);
				formData.append("user_name_chg", userNameChg);
				formData.append("user_nickname_chg", userNicknameChg);
				formData.append("user_pw_chg", userPWChg);

				formData.append("file", this.profileImgFile != null ? this.profileImgFile[0] : null);
				formData.append("user_name", name);
				formData.append("user_nickname", nickname);
				formData.append("user_pw", pw);
				formData.append("user_intro", intro);

				$.ajax({
					type: "POST",
					enctype: "multipart/form-data",
					//url: "/file-upload.do",
					url: "/setProfileInfo.do",
					data : formData,
					context: this,
					processData: false,
					contentType: false,
					success : function(p)
					{
						console.log(p);
						console.log("성공");
						if(p == "OK")
						{
							alert("회원정보가 변경되었습니다.");
							this.fnGoProfile($("#session_user_idx").val());
						}
						else if(p == "DUPL")
						{
							alert("닉네임이 중복입니다.");
						}
						else
						{
							alert("회원정보를 다시 확인하세요.");
						}
					},
					error : function(p)
					{
						console.log("프로필 정보 저장 실패");		                  
					}
				});
			},
			//좌측 메뉴 기능 타입 변경
			fnChangeMenu : function(p)
			{
				this.menu_type = p;
				if(p == "normal")
				{
					this.fnChangePage('home');
				}
			},
			//더보기 메뉴 팝업 & 닫기
			fnMoreMenuPop : function()
			{
				this.moreMenu_popup_show = true;
				this.MoreMenu_display_css = "flex";
			},
			fnMoreMenuClose : function()
			{
				this.moreMenu_popup_show = false;
				this.MoreMenu_display_css = "none";
			},
			//피드 옵션 팝업 & 닫기
			fnFeedOptionPop : function(feed_idx)
			{
				this.delete_feed_idx = feed_idx;
				this.Feed_Option_show = true;
				this.Feed_Option_css = "flex";

				this.Feed_Option_margin_css = window.scrollY;
				$('body').css("overflow-y", "hidden");

			},
			fnFeedOptionPopClose : function()
			{
				this.Feed_Option_show = false;
				this.Feed_Option_css = "none";
				$('body').css("overflow-y", "auto");
			},
			//스토리 옵션 팝업 & 닫기
			fnStoryOptionPop : function()
			{
				this.delete_Story_idx = this.story_view_list.story_file_list[this.view_story_img_index].story_idx;
				this.Story_Option_show = true;
				this.Story_Option_css = "flex";
			},
			fnStoryOptionPopClose : function()
			{
				this.Story_Option_show = false;
				this.Story_Option_css = "none";
			},
			//홈 화면의 계정 추천 리스트 불러오기
			fnGetRecommendList: function(){		
				$.ajax({
					url : "/getRecommendList.do",
					type : "POST",
					data : {},
					context: this,
					success : function(p)
					{
						this.recommend_list = p;
					},
					error : function(p)
					{
						console.log("추천리스트 세팅 실패");		                  
					}
				});
			},
			//피드 삭제
			fnDeleteFeed: function(){
				$.ajax({
					url : "/deleteFeed.do",
					type : "POST",
					data : {
						"feed_idx" : this.delete_feed_idx //삭제버튼 팝업 띄웠을 때 피드 저장값 idx
					},
					context: this,
					success : function(p)
					{
						this.fnFeedOptionPopClose();
						if(this.view_page == "home")
						{
							this.fnGetHomeFeedList();
						}
						if(this.view_page == "profile")
						{
							fnPopFeedClose();
							this.fnGetProfileInfo();
							this.fnGetProfileFeedList();
							this.menu_type = 'normal';
						}
						console.log("피드 삭제 성공");
					},
					error : function(p)
					{
						console.log("피드 삭제 실패");		                  
					}
				});
			},
			//스토리 삭제
			fnDeleteStory: function(){
				$.ajax({
					url : "/deleteStory.do",
					type : "POST",
					data : {
						"story_idx" : this.delete_Story_idx //삭제버튼 팝업 띄웠을 때 스토리 저장값 idx						
					},
					context: this,
					success : function(p)
					{
						this.fnStoryOptionPopClose();
						this.fnLayerPopupClose();						
						console.log("피드 삭제 성공");
					},
					error : function(p)
					{
						console.log("피드 삭제 실패");		                  
					}
				});
			},
			//댓글 삭제
			fnDeleteReply: function(feed_reply_idx){
				$.ajax({
					url : "/deleteReply.do",
					type : "POST",
					data : {
						"feed_reply_idx" : feed_reply_idx					
					},
					context: this,
					success : function(p)
					{
						this.fnFeedPopup(this.now_feed_idx);		
						console.log("피드 댓글 삭제 성공");
					},
					error : function(p)
					{
						console.log("피드 댓글 삭제 실패");		                  
					}
				});
			},
		}
    }).mount('#app');
</script>

