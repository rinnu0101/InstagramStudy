<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 메인 프로필 영역 -->
<div id="profile_main_middle" v-if="view_page == 'profile'">
	<div id="profile_middle_area">
		<div id="profile_Top">
			<div id="profile_TopImgArea">
				<!-- todo : 내 계정에서만 클릭 활성화, 프로필사진 바꾸기 등 기능 넣기 -->
				<div style="text-align: center;">
					<img id='profile_TopImg' :src="pUser_info.file_name == null ? 'images\\icon\\profile.png' 
																				: 'images\\profile_img\\' + pUser_info.file_name">
				</div>
			</div>
			<div id="profile_TopInfo">
				<div id="Info_ID">
					<div id="Info_ID_name">{{pUser_info.user_nickname}}</div>
					<div id="Info_follow" @click="fnFollow();">
						<div v-if="follow == false">팔로우</div>
						<div v-if="follow == true">팔로잉</div>
						<div v-if="follow == 'ME'" @click="fnChangePage('profileChange');">
							프로필 편집
						</div>
					</div>
					<div id="Info_message" v-if="follow != 'ME'">
						메시지 보내기
					</div>
					<div id="Info_ID_option" v-if="follow == 'ME'">
						<img src="images\icon\setting.png"/>
					</div>
				</div>
				<div id="Info_Account">
					<ul>
						<!-- todo : 게시물, 팔로워, 팔로우 숫자 불러오기 -->
						<li>
								게시물  <span>{{pUser_info.feed_cnt}}</span>
						</li>
						<li>
							<div id="follower" @click="fnPopFollowing();" style="cursor: pointer;">
									팔로워  <span>{{pUser_info.follower_cnt}}</span>
							</div>
						</li>
						<li>
							<div id="follow" @click="fnPopFollower();" style="cursor: pointer;">
									팔로우&nbsp;<span>{{pUser_info.follow_cnt}}</span>
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
				<li v-for="(f, index) in profile_feed_list">
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
<div>
    <div>
		<input id="pUser_idx" type="hidden" value="${pUser_idx}" />		
	</div>
</div>
<!-- todo : vue.js popupSlide_btn : true 적용  -->