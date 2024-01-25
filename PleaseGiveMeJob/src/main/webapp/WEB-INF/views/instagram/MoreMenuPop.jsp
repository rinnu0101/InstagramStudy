<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 더보기 버튼 레이어팝업 html-->
<div class="Popup_moreMenu" v-if="this.moreMenu_popup_show == true" :style="{display:MoreMenu_display_css}">
    <div class="Popup_moreMenu_bg" @click="fnMoreMenuClose();"></div>

    <div class="Popup_option">
        <div class="Option_menu">
            <div class="Option_css">
                <div id="Option_moreMenu" @click="fnChangePage('profileChange');">설정</div>                        
            </div>
        </div>
        <div class="Option_menu">
            <div class="Option_css">
                <div id="Option_logout" onclick="goPage('login');">로그아웃</div> 
            </div>
        </div>
    </div>
</div>

<!-- 피드 옵션 버튼 레이어팝업 html-->
<div class="Feed_option" v-if="this.Feed_Option_show == true" :style="{display:Feed_Option_css}">
    <div class="Option_bg" @click="fnFeedOptionPopClose();"></div>

    <div class="option_area">
        <div class="Contents_option">
            <div class="Option_menu">
                <div class="Option_css">
                    <div id="Feed_delete" @click="fnDeleteFeed();">피드 삭제</div>                        
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 스토리 옵션 버튼 레이어팝업 html-->
<div class="Story_option" v-if="this.Story_Option_show == true" :style="{display:Story_Option_css}">
    <div class="Option_bg" @click="fnStoryOptionPopClose();"></div>

    <div class="option_area">
        <div class="Contents_option">
            <div class="Option_menu">
                <div class="Option_css">
                    <div id="Story_delete" @click="fnDeleteStory();">스토리 삭제</div>                        
                </div>
            </div>
        </div>
    </div>    
</div>