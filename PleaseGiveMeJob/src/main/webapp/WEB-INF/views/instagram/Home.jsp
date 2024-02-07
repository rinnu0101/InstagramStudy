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
			<div id="main_contents_feed" v-for="(f, index) in home_feed_list" v-if="feed_show == true" :key="version">
				<div class="feed_component"> 
					<div class="comp_account">
						<div class="comp_account_img">
							<img class='feed_profile' :src="f.file_name == null ? 'images\\icon\\profile.png'
																				: 'images\\profile_img\\' + f.file_name" @click="fnGoProfile(f.user_idx);">
							<div class="comp_account_name" @click="fnGoProfile(f.user_idx);">{{f.user_nickname}}</div>
							<div class="comp_account_option" v-if="f.user_idx == session_user_idx" @click="fnFeedOptionPop(f.feed_idx);">
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
						<!-- 계정명 DB에서 받아오도록 하기 -->
						<div class="comp_userName" @click="fnGoProfile(f.user_idx);">{{f.user_nickname}}</div>
						<!-- 본문 1줄 이상 길어지면 [더 보기]버튼 활성화하여 접어두기 -->							
						<pre v-if="!f.feed_contents_multi">{{f.feed_contents}}</pre>
						<pre v-if="f.feed_contents_multi">{{f.feed_contents_simple}}</div>
						<div class="text_togle" v-if="f.feed_contents_multi" @click="feed_content_togle(index)">...더 보기</div>
						<div class="comp_comment" v-if="f.comment_count != 0" @click="fnFeedPopup(f.feed_idx);">
							댓글 <span>{{f.comment_count}}</span>개 보기
						</div>
						<div class="comp_comment_writing">
							<input class="input_reply_home" type="text" placeholder="  댓글 달기"/>
							<!-- <div class="emoji_btn_home">
								<img src="images\icon\emoji.png" >						
							</div> -->
							<div id="comp_comment_btn" @click="fnSaveReplyHome(f.feed_idx, index);">
								<!-- todo : 텍스트 없으면 비활성화-->
									게시
							</div>
						</div>						
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
						<div id="Account_myID" @click="fnChangePage('profile');">{{session_user_info.user_nickname}}</div>
						<div id="Account_myIntro">{{session_user_info.user_name}}</div>
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
								<div class="otherAccount_img" @click="fnGoProfile(r.user_idx);">
									<img class='otherAccount_img_class' :src="r.file_name == null ? 'images\\icon\\profile.png' 
																								  : 'images\\profile_img\\' + r.file_name">
								</div>
								<div>
									<div class="Account_ID">
										<div class="Account_otherID" @click="fnGoProfile(r.user_idx);">{{r.user_nickname}}</div>
										<div class="Account_otherIntro">{{r.user_name}}</div>
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
					@suh_herin </br>
					010-3937-9000 </br>
					shr_0101@naver.com </br>
			</div>
		</div>
	</div>
</div>