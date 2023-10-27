<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/Join.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
        
        <script>
        	<!-- 회원가입 정보 입력하기 -->
            function fnInputJoinInfo()
            {
                var joinInfo =
	                {
	                    'user_id' : $(".join_ID").find("input").val()
	                ,   'user_name' : $(".join_name").find("input").val()
	                ,   'user_nickname' : $(".join_nickname").find("input").val()
	                ,   'user_pw' : $(".join_PW").find("input").val()
	                }
                
                // var user_id = $(".join_ID").find("input").val();
                // var user_name = $(".join_name").find("input").val();
                // var user_nickname = $(".join_nickname").find("input").val();
                // var user_pw = $(".join_PW").find("input").val();
                // console.log(user_id, user_name, user_nickname, user_pw);

                console.log(joinInfo);
                
                //GET
                //"/setJoinInfo.do?user_id=123&user_name=123..."
                //url에 모든 정보가 노출되어 보안 취약
                
           		//POST
                $.ajax({
                	url : "/setJoinInfo.do",
                	type : "POST",
                	data : joinInfo,
                	success : function(p)
		            {
 		               console.log(p);
		               console.log("성공");
		            },
	               	error : function(p)
	               	{
			           console.log("실패");		                  
	               	}
                });
            }
        </script>
    </head>

    <body>
        <div id="main">
            <div class="main_top">
                <div id="join_area">
                    <div id="join_info">
                        <div class="login_logo">
                            <img class="login_logo_img" src="images\icon\logo.png">
                        </div>
                        <div id="join_text">친구들의 사진과 동영상을 보려면</br>지금 가입하세요.</div>
                        <div class="login_fb_btn">
                            <img class="login_fb_icon" src="images\icon\fb_logo_wt.png">
                            Facebook으로 로그인
                        </div>
                        <div class="login_info_text">
                            ----------------------- 또는 -----------------------
                        </div>
                        <div class="join_ID">
                            <input type="text" placeholder="휴대폰 번호 또는 이메일 주소"/>
                        </div>
                        <div class="join_name">
                            <input type="text" placeholder="성명"/>
                        </div>
                        <div class="join_nickname">
                            <input type="text" placeholder="사용자 이름"/>
                        </div>
                        <div class="join_PW">
                            <input type="password" placeholder="비밀번호"/>
                        </div>
					<div class="login_btn" onclick="fnInputJoinInfo();">회원가입</div>
					<div id="join_info_text">
                            	저희 서비스를 이용하는 사람이 회원님의 연락처 정보를 Instagram에 업로드했을 수도 있습니다.
                            <div id="join_info_more">
                            	더 알아보기
                            </div>
                        </div>
                    </div>
                    <div class="join_login">
                        	계정이 있으신가요?
                        <div id="join_login_btn" onclick="goPage('login');">로그인</div>
                    </div>
                    <div class="info_download">
                        <div class="download_text">앱을 다운로드하세요.</div>
                        <div class="download_btn">
                            <div id="googleplay_btn">
                                <img id='googleplay_btn_img' src="images\login_img\googleplay_btn.png"/>
                            </div>
                            <div id="microsoft_btn">
                                <img id='microsoft_btn_img' src="images\login_img\microsoft_btn.png"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main_footer"></div>
        </div>
    </body>
</html>