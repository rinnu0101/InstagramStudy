<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/FindPW.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
    </head>

    <body>
        <div id="main">
            <div class="top_bar">
                <div class="logo_area">
                    <div class="logo_img">
                        <img onclick="goPage('login');" src="images\icon\logo.png">
                    </div>
                </div>
            </div>
            <div class="middle_area">
                <div class="findPW_area">
                    <div class="lock_img_area">
                        <img src="images\icon\lock.png">
                    </div>
                    <div class="info_text_top">
                        	로그인에 문제가 있나요?
                    </div>
                    <div class="info_text_bottom">
                        	이메일 주소, 전화번호 또는 사용자 이름을</br>
                        	입력하시면 계정에 다시 액세스할 수 있는</br>
                        	링크를 보내드립니다.
                    </div>
                    <div class="find_clue">
                        <input type="text" placeholder="이메일, 전화번호, 사용자 이름"/>
                    </div>
                    <div id="find_PW_btn">
                        <!-- todo : find_clue 영역 비어있을때는 비활성화되어있다가 영역 입력되면 활성화하기 -->
                        <!-- todo : 로그인 링크 보내기 기능 추가 -->
                        	로그인 링크 보내기
                    </div>
                    <div id="reset_PW">
                        <!-- todo : 비밀번호 재설정 기능 추가 -->
                        	비밀번호를 재설정할 수 없나요?
                    </div>
                    <div class="join_info_text">
                        --------------------------- 또는 ---------------------------
                    </div>
                    <div id="join_new" onclick="goPage('join');">
                        	새 계정 만들기
                    </div>
                    <div id="back_to_login_btn" onclick="goPage('login');">
                        	로그인으로 돌아가기
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>