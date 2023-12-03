<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 새 스토리 업로드 레이어팝업 html-->
<div id="upload_story">
	<div class="upload_layerPopup_bg" onclick="fnStoryUploadClose();">
	    <div class="layerPopupClose_btn">
	        <img src="images\icon\close_WT.png">
	    </div>
	</div>
	
	<!-- 새 스토리 콘텐츠 html-->
	<div id="upload_story_contents">
	    <div id="story_file_insert">
	        <div class="file_insert_info">
	            	사진과 동영상을 여기에 끌어다 놓으세요
	        </div>
	        <div class="file_insert_btn" onclick="fnStoryFileSelect();">
	            	컴퓨터에서 선택
	        </div>
	        <div style="display:none;">
	            <input id="input_file_story" type="file" multiple="multiple" />
	        </div>
	    </div>
	    <!-- upload file li 받는 ul -->
	    <ul class="upload_story_contents_ul" style="display:none;">
	    </ul>
	    <!-- li 슬라이드 버튼 -->
	    <!-- todo : li 수량이 2개 이상일 때만 버튼 show, 맨 왼쪽/오른쪽 도달시 한쪽 버튼 hide -->
	    <div class="upload_story_arrow" style="display:none;">
	        <a href="javascript:;" class="prev" onclick="fnStoryMoveUploadSlide(this);">
	            <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
	        </a>
	        <a href="javascript:;" class="next" onclick="fnStoryMoveUploadSlide(this);">
	            <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
	        </a>
	    </div>
	    <div id="upload_story_btn" style="display:none;" onclick="fnSaveNewStory();">
	            	내 스토리
	    </div>
	</div>
</div>