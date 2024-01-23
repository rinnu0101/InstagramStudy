<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 메인 피드 영역 -->
<div id="home_main_middle" v-if="view_page == 'home'">
	<div id="home_middle_area">
		<div id="home_main_contents">
			<!-- 홈 스토리 리스트 -->
			<div id="main_contents_story">
				<ul class="story_friend_ul">
					<li class="story_upload" onclick="fnStoryUpload();">
						<div class="story_upload_btn">
							<img class='story_upload_btn_img' src="images\icon\upload.png">
						</div>
						<div class="story_accountName">새 스토리</div>
					</li>
					
					<li v-for="(s, index) in home_story_list" v-if="story_list_show == true" @click="fnStoryPopup(index);">
						<div class="story_profile">
							<img class='story_profile_img' :src="s.file_name == null ? 'images\\icon\\profile.png'
																				     : 'images\\profile_img\\' + s.file_name">
						</div>
						<div class="story_accountName">{{s.user_nickname}}</div>
					</li>
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
			<!-- 홈 피드 리스트 -->
			<div id="main_contents_feed" v-for="(f, index) in home_feed_list" v-if="feed_show == true">
				<div class="feed_component"> 
					<div class="comp_account">
						<div class="comp_account_img">
							<img class='feed_profile' :src="f.file_name == null ? 'images\\icon\\profile.png'
																				: 'images\\profile_img\\' + f.file_name" @click="fnGoProfile(f.user_idx);">
							<div class="comp_account_name" @click="fnGoProfile(f.user_idx);">{{f.user_nickname}}</div>
							<div class="comp_account_option" @click="fnFeedOptionPop(f.feed_idx);">
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
	
		<div id="home_main_right">
			<div id="main_recommend">
				<div id="recommend_myAccount">
					<div class="myAccount_img" @click="fnChangePage('profile');">
						<img class='myAccount_img_class' src="${file_name}"/>
					</div>
					<div class="Account_ID">
						<div id="Account_myID" @click="fnChangePage('profile');">${user_nickname}</div>
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
							<li v-for="(r, index) in recommend_list">
								<div class="otherAccount_img">
									<img class='otherAccount_img_class' :src="r.file_name == null ? 'images\\icon\\profile.png' 
																								  : 'images\\profile_img\\' + r.file_name">
								</div>
								<div>
									<div class="Account_ID">
										<div class="Account_otherID">{{r.user_nickname}}</div>
										<div class="Account_otherIntro">{{r.user_intro}}</div>
									</div>
									<div class="otherAccount_follow" @click="fnRecommFollow(r.user_idx, index);">
										<div v-if="r.follow != true" style="color : #0095F6">팔로우</div>
										<div v-if="r.follow == true" style="color : #262626">언팔로우</div>
									</div>
								</div>
							</li>
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