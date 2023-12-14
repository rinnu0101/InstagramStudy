<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 좌측 공통 메뉴 html-->
<div id="main_left" v-if="menu_type == 'normal'">
  <div id="left_area">
      <div id="main_logo">
          <img onclick="goPage('logo');" src="images\icon\logo.png">
      </div>

      <div id="main_menu">
          <ul>
              <li @click="fnChangePage('home');">
                  <img class='main_menu_icon' src="images\icon\home.png"/>
                  <div id="menu_home">홈</div>
              </li>
              <li @click="fnChangeMenu('search');">
                  <img class='main_menu_icon' src="images\icon\search.png"/>
                  <div id="menu_search">검색</div>
              </li>
              <!-- <li>
                  <img class='main_menu_icon' src="images\icon\explore.png"/>
                  <div id="menu_explore">탐색 탭</div>
              </li> -->
              <!-- <li>
                  <img class='main_menu_icon' src="images\icon\reels.png"/>
                  <div id="menu_reels">릴스</div>
              </li> -->
              <li>
                  <img class='main_menu_icon' src="images\icon\direct.png"/>
                  <div id="menu_direct">메시지</div>
              </li>
              <li>
                  <img class='main_menu_icon' src="images\icon\notice.png"/>
                  <div id="menu_notice">알림</div>
              </li>
              <li onclick="fnUploadOpen();">
                  <img class='main_menu_icon' src="images\icon\upload.png"/>
                  <div id="menu_upload">만들기</div>
              </li>
              <li @click="fnGoProfile('');">
                  <img class='main_menu_profile' src="${file_name}"/>
                  <!-- todo : 
                      - DB에서 내 프로필 이미지 가져오기
                      - 프로필 이미지 없으면 "icon\profile.png" 자동으로 띄우기 -->
                  <div id="menu_profile">프로필</div>
              </li>
          </ul>
      </div>

      <div id="main_moreMenu">
          <ul>
              <li>
                  <img class='main_menu_icon' src="images\icon\moreMenu.png"/>
                  <div id="moreMenu">
                      <!-- todo : 더보기 내 메뉴 구현하기 -->
                        	더 보기
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
