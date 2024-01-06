<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 스토리 레이어팝업 html-->
<div id="layerPopup_story" v-if="story_popup_show == true">
	<div id="story_layerPopup_bg" @click="fnLayerPopupClose();">
	    <div class="layerPopupClose_btn">
	        <img src="images\icon\close_WT.png">
	    </div>
	</div>
	
	<div id="story_layerPopup_area">
		<!-- 스토리 레이어팝업 좌우버튼-->
		<div class="Story_Next_btn_L">
		    <img class="Story_Next_btn" src="images\icon\next_WT_L.png" @click="fnMoveStorySlide('prev')">
		</div>
		<div class="Story_Next_btn_R">
		    <img class="Story_Next_btn" src="images\icon\next_WT_R.png" @click="fnMoveStorySlide('next')">
		</div>
		
		<!-- 스토리 레이어팝업 콘텐츠 html-->
		<div id="story_layerPopup_contents">
		    <div class="SP_contents_header">
		        <div class="SP_contents_length">
					<ul class="SP_contents_length_ul">
						<li v-for="p in story_view_list.story_file_list" :style="{width:story_view_list.progress_eq_width + 'px'}">
							<div class="SP_contents_background_progress"></div>
							<div class="SP_contents_background"></div>
						</li>
					</ul>
		        </div>
		        <div class="SP_contents_account">
		            <div class="SP_account_profile">
		                <img class='SP_profile_img' :src="story_view_list.file_name == null ? 'images\\icon\\profile.png'
																			                : 'images\\profile_img\\' + story_view_list.file_name">
		            </div>
		            <div class="SP_account_ID">{{story_view_list.user_nickname}}</div>
		            <div class="SP_contents_play">
		                <img class="SP_contents_play_btn" src="images\icon\play.png">
		                <img class="SP_contents_stop_btn" src="images\icon\stop.png" style="display: none;">
		            </div>
		        </div>
		    </div>
		    <div class="SP_contents_reaction">
		        <div class="SP_reaction_effect">
		            <!-- todo : 이모지 누르면 이펙트 구현-->
		        </div>
		        <div class="SP_contents_reaction_area">
		            <div class="SP_reaction_reply">
		                <div class="SP_reaction_reply_text">
		                    <input type="text" placeholder="님에게 답장하기..."/>
		                </div>                            
		            </div>
		            <div class="SP_reaction_like">
		                <img class="SP_reaction_btn" src="images\icon\notice_lw.png">
		            </div>
		            <div class="SP_reaction_direct">
		                <img class="SP_reaction_btn" src="images\icon\direct_w.png">
		            </div>
		        </div>
		    </div>
		    <div class="SP_contents_img">
		        <ul>
	                <li>
	                    <img :src="'images\\story_img\\' + view_story_img">
	                </li>
	            </ul>
			</div>
		</div>
	</div>
</div>