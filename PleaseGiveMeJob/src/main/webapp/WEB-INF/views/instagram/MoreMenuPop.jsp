<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 더보기 버튼 레이어팝업 html-->
<div class="Popup_moreMenu" v-if="this.moreMenu_popup_show == true" :style="{display:MoreMenu_display_css}">
    <div class="Popup_moreMenu_bg" @click="fnMoreMenuClose();"></div>

    <div class="Popup_moreMenu_contents">
        <div class="moreMenu_menu">
            <div class="moreMenu_css">
                <div id="moreMenu_option">설정</div>                        
            </div>
        </div>
        <div class="moreMenu_menu">
            <div class="moreMenu_css">
                <div id="moreMenu_logout">로그아웃</div> 
            </div>
        </div>
    </div>
</div>