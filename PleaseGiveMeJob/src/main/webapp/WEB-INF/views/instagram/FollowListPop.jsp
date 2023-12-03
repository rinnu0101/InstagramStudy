<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 프로필 피드 레이어팝업 html-->
<div class="Popup_follow" v-if="this.follow_pop_show == true" :style="{display:follow_pop_display_css}">
   <div class="Popup_follow_bg" @click="fnPopFollowClose();"></div>

   <!-- 팔로워 레이어팝업 콘텐츠 html-->
   <div id="Popup_follower_contents">
       <div class="PF_top">
           <div class="PF_top_text"> {{follow_pop_title}} </div>
           <div class="PF_top_btn" @click="fnPopFollowClose();">
               <img src="images\icon\close_BK.png">
           </div>
       </div>
       <div class="PF_bottom">
           <ul>
               <!-- todo : li 갯수 10개씩 불러오기 (스크롤바 최하단 도달시) -->
               <li class="follow_li" v-for="f in following_list">
                   <div class="follow_profile_img">
                      <img :src="f.file_name == null ? 'images\\icon\\profile.png' 
													 : 'images\\profile_img\\' + f.file_name">
                    </div>
                    <div class="follow_profile_info">
                        <div class="info_id">{{f.user_nickname}}</div>
                        <div class="info_text">한줄소개글</div>
                    </div>
                    <div class="follow_profile_btn">
                        <div id="follower_delete_btn" @click="fnFollwerDelete();">삭제</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>