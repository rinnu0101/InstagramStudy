<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 프로필 레이어팝업 콘텐츠 html-->
<div id="profile_Change" v-if="view_page == 'profileChange'">            
    <div id="profile_area">
        <div id="profile_info">
            <div id="profile_img">
       <!-- todo : 계정 기존 이미지 없으면 하단 기본 프로필 적용 -->
                <img src="${file_name}" style="object-fit: cover;">	                            
                <div id="profile_img_change" @click="fnProfileImgSelect();"> 프로필 사진 변경 </div>
                <!-- todo : onclick시 프로필 이미지 변경 & DB변경 -->
                <div style="display: none;">
                    <input id="input_file_Profile" type="file" @change="fnProfileImgPrint" />
                </div>
            </div>
            <div class="profile_info_text">
                -------------------- 내 프로필 --------------------
            </div>
            <div class="profile_ID">
                ID : <span> ${ user_id } </span>
            </div>
            <div class="profile_name">
                <input type="text" :placeholder="'이름 : ' + session_user_info.user_name" />
            </div>
            <div class="profile_nickname">
                <input type="text" @keyup="fnProfileDuplChk" :placeholder="'닉네임 : '+ session_user_info.user_nickname " />
                <div class="confirm">
                    <img class="confirm_check" v-if="profileNickDuplChk == 'check'" src="images\icon\check.png">
                    <img class="confirm_error" v-if="profileNickDuplChk == 'error'" src="images\icon\error.png">
                </div>
            </div>
            <div class="profile_PW">
                <input type="password" placeholder="비밀번호를 변경하려면 입력하세요."/>
                <!-- todo : 비밀번호 입력해야 저장되도록 하기 -->
                <!-- todo : 비밀번호 변경시 변경된 비밀번호로 DB 교체하기  -->
                <div class="confirm">
                    <img class="confirm_show" src="images\icon\show.png">
                    <img class="confirm_hide" src="images\icon\hide.png">
                </div>
            </div>
            <div class="profile_intro">
                <textarea placeholder="소개">{{ session_user_info.user_intro }}</textarea>
            </div>            
            <div class="profile_btn" @click="fnSaveProfile();">
                	내 프로필 변경하기
            </div>
        </div>
    </div>
</div>