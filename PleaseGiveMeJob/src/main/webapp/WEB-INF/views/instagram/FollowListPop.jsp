<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 프로필 피드 레이어팝업 html-->
<div class="Popup_follow" v-if="this.follow_pop_show == true" :style="{display:follow_pop_display_css}">
   <div class="Popup_follow_bg" @click="fnPopFollowClose();"></div>

   <!-- 팔로워 레이어팝업 콘텐츠 html-->
   <div id="Popup_follower_contents">
       <div class="PF_top">
            <!-- follow_pop_title 값에 따라 리스트 상단 팔로워 / 팔로우 텍스트 구분 -->
           <div class="PF_top_text"> {{follow_pop_title}} </div>
           <div class="PF_top_btn" @click="fnPopFollowClose();">
               <img src="images\icon\close_BK.png">
           </div>
       </div>
       <div class="PF_bottom">
            <!-- 팔로워 / 팔로우 리스트 ul-->
           <ul>
               <!-- todo : 데이터 처리 수량이 많아질 경우 li 10개씩 불러오기 (스크롤바 최하단 도달시) -->
               <li class="follow_li" v-for="f in following_list">
                   <div class="follow_profile_img" @click="fnGoProfile(f.user_idx);">
                   		<img :src="f.file_name == null ? 'images\\icon\\profile.png'
													   : 'images\\profile_img\\' + f.file_name" @click="fnPopFollowClose();">
                   </div>
                   <div class="follow_profile_info">
                       <div class="info_id" @click="fnGoProfile(f.user_idx);">
	                       <div @click="fnPopFollowClose();">
	                       		{{f.user_nickname}}
	                       </div>
                       </div>
                       <div class="info_text">{{f.user_name}}</div>
                   </div>
                   <div class="follow_profile_btn">
                       <div id="follower_delete_btn" @click="fnFollwerDelete();">삭제</div>
                   </div>
                </li>
            </ul>
        </div>
    </div>
</div>