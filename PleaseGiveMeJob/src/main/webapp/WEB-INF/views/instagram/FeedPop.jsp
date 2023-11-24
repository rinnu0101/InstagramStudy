<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 프로필 피드 레이어팝업 html-->
<div id="layerPopup_feed">
    <div id="feed_layerPopup_bg" onclick="fnPopFeedClose();">
        <div class="layerPopupClose_btn">
            <img src="images\icon\close_WT.png">
        </div>
    </div>

    <!-- 레이어팝업 좌우버튼-->
    <div class="Next_btn_L">
        <img class="Next_btn" src="images\icon\next_WT_L.png">
    </div>
    <div class="Next_btn_R">
        <img class="Next_btn" src="images\icon\next_WT_R.png">
    </div>

    <!-- 피드 레이어팝업 콘텐츠 html-->
    <div id="feed_layerPopup_contents">
        <div id="FP_contents_img">
            <ul id="popFileList">
                <li v-for="file_path in feed_pop_info.file_names">
                    <img class='post' :src="'images/feed_img/' + file_path">
                </li>
            </ul>
            <div class="feed_pop_contents_arrow">
                <a href="javascript:;" class="prev">
                    <img class='upload_arrow_img' v-if="feed_pop_info.file_length != 1 && feed_pop_info.file_index != 0" src="images\icon\next_WT_L.png"  @click="fnPopMovefeedSlide('prev')">
                </a>
                <a href="javascript:;" class="next">
                    <img class='upload_arrow_img' v-if="feed_pop_info.file_length != (feed_pop_info.file_index + 1)"  src="images\icon\next_WT_R.png" @click="fnPopMovefeedSlide('next')">
                </a>
            </div>
        </div>
        <div id="FP_contents_post">
            <div id="FPCP_account">
                <div id="FPCP_account_area">
                    <div class="FPCP_account_profile">
                        <img src="images\profile_img\my_profile.jpg">
                    </div>
                    <div class="FPCP_account_ID">
                        {{feed_pop_info.user_nickname}}
                    </div>
                </div>
                <div id="FPCP_account_option">
                    <img src="images\icon\option.png"/>
                </div>
            </div>
            <div id="FPCP_body">
                <div id="FPCP_body_log">
                    <div class="FPCP_account_profile">
                        <img src="images\profile_img\my_profile.jpg">
                    </div>
                    <div class="FPCP_account_ID">
                        {{feed_pop_info.user_nickname}}
                    </div>
                    <div class="FPCP_text">
                        {{feed_pop_info.feed_contents}}
                    </div>
                </div>
                <div class="FPCP_body_comment">
                	<ul>
                		<li v-for="(r, index) in feed_pop_info.feed_reply_list"> 
		                    <div class="FPCP_account_profile">
		                        <img src="images\profile_img\1.jpg">
		                    </div>
		                    <div class="FPCP_account_ID">
		                     	{{ r.user_nickname }}
		                    </div>
		                    <div class="FPCP_text">
		                    	{{ r.feed_reply_contents }}
		                    </div>
	                    </li>
                    </ul>
                </div>
            </div>
            <div id="FPCP_PIS">
                <div id="FPCP_PIS_btn">
                    <div class="FPCP_PIS_btn_L">
                        <ul>
                            <li @click="fnPopLikeClick(feed_pop_info.feed_idx, feed_pop_info.like_type);">
                            	<img class='FPCP_PIS_btn_icon' :src="feed_pop_info.like_type == null ? 'images\\icon\\notice.png' 
																						 : 'images\\icon\\notice_r.png'">
                            </li>
                            <li><img class='FPCP_PIS_btn_icon' src="images\icon\comment.png"/></li>
                        </ul>
                    </div>
                    <div class="FPCP_PIS_btn_R">
                        <ul>
                            <li><img class='FPCP_PIS_btn_icon' src="images\icon\bookmark.png"/></li>
                        </ul>
                    </div>
                </div>
                <div id="FPCP_PIS_like" v-if="feed_pop_info.like_count > 1">
                    <span></span>님 외 <span>{{feed_pop_info.like_count - 1}}</span>명이 좋아합니다
                </div>
                <div id="FPCP_PIS_like" v-if="feed_pop_info.like_count == 1">
                    <span>"todo : 닉네임불러오기"</span>님이 좋아합니다
                </div>
                <div id="FPCP_PIS_like" v-if="feed_pop_info.like_count <= 0">
                </div>
                <div id="FPCP_PIS_date">{{feed_pop_info.regdate}} 몇일전 한시간전 개발필요</div>
            </div>
            <div id="FPCP_reply">
                <div id="FPCP_reply_emoji">
                    <img src="images\icon\emoji.png">
                </div>
                <div id="FPCP_reply_text">                            
                    <input type="text" placeholder="댓글 달기"/>
                </div>
                <div id="FPCP_reply_btn" @click="fnSaveReply();">
                    <!-- todo : 텍스트 없으면 비활성화-->
              	      게시
                </div>
            </div>
        </div>
    </div>
</div>
