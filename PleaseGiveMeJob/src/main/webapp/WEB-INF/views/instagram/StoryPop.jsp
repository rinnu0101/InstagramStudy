<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 스토리 레이어팝업 html-->
<div id="layerPopup_story">
	<div id="story_layerPopup_bg" onclick="fnLayerPopupClose();">
	    <div class="layerPopupClose_btn">
	        <img src="images\icon\close_WT.png">
	    </div>
	</div>
	
	<!-- 스토리 레이어팝업 좌우버튼-->
	<div class="Story_Next_btn_L">
	    <img class="Story_Next_btn" src="images\icon\next_WT_L.png">
	</div>
	<div class="Story_Next_btn_R">
	    <img class="Story_Next_btn" src="images\icon\next_WT_R.png">
	</div>
	
	<!-- 스토리 레이어팝업 콘텐츠 html-->
	<div id="story_layerPopup_contents">
	    <div class="SP_contents_header">
	        <div class="SP_contents_length">
	            <!-- todo : 스토리 갯수에 따라 칸 일정하게 나눠져 증가하는 바 생성-->
	        </div>
	        <div class="SP_contents_account">
	            <div class="SP_account_profile">
	                <!-- todo : 클릭한 story 계정의 프로필 img 뜨게하기-->
	                <img class='SP_profile_img' src="images\profile_img\1.jpg">
	            </div>
	            <div class="SP_account_ID">asdfasdfasdf</div>
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
            <!-- todo : 클릭한 story의 img 뜨게하기-->
                <li>
                    <img src="images\stroy_img\a.jpg">
                </li>
            </ul>
		</div>
	</div>
</div>