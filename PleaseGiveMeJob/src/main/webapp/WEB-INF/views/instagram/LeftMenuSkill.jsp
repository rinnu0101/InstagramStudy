<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 좌측 공통 메뉴 기능 html-->
<div class="main_left_area" v-if="menu_type == 'search'">
	<!-- 좌측 공통 메뉴 아이콘 -->
    <div class="left_icon_area">
        <div class="left_icon">
            <div class="icon_logo_area">
                <div class="icon_logo" @click="fnChangeMenu('normal');">
                    <img src="images\icon\logo_icon.png">
                </div>
            </div>

            <div class="icon_menu">
                <ul>
                    <li @click="fnChangeMenu('normal');">
                        <img class='icon_menu_img' src="images\icon\home.png"/>
                    </li>
                    <li @click="fnChangeMenu('search');">
                        <img class='icon_menu_img' src="images\icon\search.png"/>
                    </li>
                    <!-- <li>
                        <img class='icon_menu_img' src="images\icon\explore.png"/>
                    </li> -->
                    <!-- <li>
                        <img class='icon_menu_img' src="images\icon\reels.png"/>
                    </li> -->
                    <li>
                        <img class='icon_menu_img' src="images\icon\direct.png"/>
                    </li>
                    <li>
                        <img class='icon_menu_img' src="images\icon\notice.png"/>
                    </li>
                    <li onclick="fnUploadOpen();">
                        <img class='icon_menu_img' src="images\icon\upload.png"/>
                    </li>
                    <li @click="fnGoProfile('');">
                        <img class='icon_menu_profile' src="${file_name}"/>
                        <!-- todo : 
                            - DB에서 내 프로필 이미지 가져오기
                            - 프로필 이미지 없으면 "icon\profile.png" 자동으로 띄우기 -->
                    </li>
                </ul>
            </div>

            <div class="icon_menu_moreMenu">
                <ul>
                    <li>
                        <img class='icon_menu_img' src="images\icon\moreMenu.png"/>
                        <div id="moreMenu">
                            <!-- todo : 더보기 내 메뉴 구현하기 -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 검색 기능 html -->
    <div id="search_area">
        <div id="search_area_div">
            <div id="search_title">검색</div>
            <div id="search_function">
                <input type="text" placeholder="검색" @keyup="fnSetSearchList"/>
            </div>
            <div id="search_list">
                <div id="search_list_text">
                    	최근 검색 항목
                </div>
                <ul id="search_history" v-if="search_keyword == 'N'">
                <!-- todo : 검색 이력(쿠키) 있으면 show(display: flex;) -->
                    <li>
                        <div class="search_profile_img">
                            <img src="images\profile_img\my_profile.jpg">
                            <!-- todo : 계정 이미지 불러오기 -->
                        </div>
                        <div class="search_profile_info">
                            <div class="search_id">유저ID</div>
                            <div class="search_info_text">한줄소개글</div>
                        </div>
                        <div class="search_profile_btn">
                            <div id="search_delete_btn">
                                <img src="images\icon\close_BK.png">
                            </div>
                        </div>
                    </li>
                </ul>
                <ul id="search_result" v-if="search_keyword == 'Y'" :style="{display:search_css_display}">
                    <li v-for="s in search_list">
                        <div class="search_profile_img">
                            <img :src="s.file_name == null ? 'images\\icon\\profile.png' 
                                                           : 'images\\profile_img\\' + s.file_name">
                        </div>
                        <div class="search_profile_info">
                            <div class="search_id">{{s.user_nickname}}</div>
                            <div class="search_info_text">{{s.user_intro}}</div>
                        </div>
                        <div class="search_profile_btn">
                            <div id="search_delete_btn">
                                <img src="images\icon\close_BK.png">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>