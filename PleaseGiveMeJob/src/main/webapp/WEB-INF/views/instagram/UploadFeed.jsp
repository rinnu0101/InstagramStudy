<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 새 게시물 업로드 레이어팝업 html-->
<div id="upload_feed">
	<div class="upload_layerPopup_bg" onclick="fnUploadClose();">
	    <div class="layerPopupClose_btn">
	        <img src="images\icon\close_WT.png">
	    </div>
	</div>
	
	<!-- 새 게시물 업로드 레이어팝업 콘텐츠 html-->
	<div id="upload_layerPopup_contents">		
		<div id="upload_loading">
			<img src="images\icon\loading.gif">
		</div>
	    <div id="upload_top">
	        <div id="upload_backstep" onclick="fnUploadClose();">
	            <img class="upload_backstep_btn" src="images\icon\arrow-left.png">
	        </div>
	        <div id="new_upload">
	            	새 게시물 만들기
	        </div>
	        <div id="upload_btn" onclick="fnSaveNewFeed();">
	            	공유하기
	        </div>
	    </div>
	    <div id="upload_main">
	        <div id="upload_contents">
	            <div id="file_insert">
	         	<div class="file_insert_info">
	         		사진과 동영상을 여기에 끌어다 놓으세요
	         	</div>
	         	<div class="file_insert_btn" onclick="fnFileSelect();">
	         		컴퓨터에서 선택
	         	</div>
	                <div style="display: none;">
	                    <input id="input_file_feed" type="file" multiple="multiple"/>
	                </div>
	        	</div>
	            <!-- upload file li 받는 ul -->
	        	<ul class="upload_contents_ul" style="display:none;">
	            </ul>
	            <!-- li 슬라이드 버튼 -->
	            <!-- todo : li 수량이 2개 이상일 때만 버튼 show, 맨 왼쪽/오른쪽 도달시 한쪽 버튼 hide -->
	            <div class="upload_contents_arrow" style="display:none;">
	                <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
	                    <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	                </a>
	                <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
	                    <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	                </a>
	            </div>
	            <!-- todo : 파일 선택 후 활성화 -->
	        	<!-- <ul class="upload_contents_ul">
	                <li>
	                	<img class='upload_contents_img' src="images\feed_img\feed1.jpg">
	                </li>
	                <li>
	                	<img class='upload_contents_img' src="images\feed_img\feed2.jpg">
	                </li>
	                <li>
	                	<img class='upload_contents_img' src="images\feed_img\feed3.jpg">
	                </li>
	                <li>
	                	<img class='upload_contents_img' src="images\feed_img\feed4.jpg">
	                </li>
	                <li>
	                	<img class='upload_contents_img' src="images\feed_img\feed5.jpg">
	                </li>
	            </ul>
	            <div class="upload_contents_arrow">
	                <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
	                    <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	                </a>
	                <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
	                    <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	                </a>
	            </div> -->
	        </div>
	        <div id="upload_options">
	            <div id="upload_profile">
	                <div id="upload_profile_img">
                        <img src="${file_name}">
                    </div>
                    <div id="upload_profile_id">
                        ${user_nickname}
                    </div>
	            </div>
	            <div id="upload_text">
	                <textarea  placeholder="문구를 입력하세요..."></textarea>
	            </div>
	            <div id="upload_emoji">
	                <div id="upload_emoji_btn">
	                    <img src="images\icon\emoji.png">
	                </div>
	                <div id="upload_text_charnum"></div>
	            </div>
	            <div id="upload_file">
	                <!-- todo : 파일업로드 구현 -->
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
