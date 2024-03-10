<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css 리셋 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 제이쿼리 불러오기 -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- 스타일시트 적용 -->
        <link rel="stylesheet" href="css/Login.css">
        <!-- 공통js 적용 -->
        <script src="js/common.js"></script>
        
        <script>
        	//스마트폰 화면 roof
            var arrImgPath = [2, 3, 4 ,1];
            var roof = 0;
            setInterval(function() {
                $(".screenshot_img").attr("src", "images/login_img/screenshot" + arrImgPath[roof] + ".png");
                roof = roof + 1;
                roof = roof == 4 ? 0 : roof;
            }, 3020);
            
            //로그인 정보 입력하기
            function fnInputLoginInfo(){
            	var loginInfo =
	           		{
	           			'user_id' : $(".login_ID").find("input").val() //ID입력값
	   	            ,   'user_pw' : $(".login_PW").find("input").val() //PW입력값
	           		};
            	
            	//DB에서 ID, PW 일치값 존재 유무 확인
                $.ajax({
                	url : "/getLoginInfo.do",
                	type : "POST",
                	data : loginInfo,
                	success : function(p)
		            {
						//p = user_id, user_pw 모두 충족 여부 체크
                	   if(p==""){
						//일치값 없을 경우 계정 정보 재확인 문구 노출
							alert("계정 정보 불일치");
							$(".pw_miss").show();
							$(".info_login").css("height", "400px");
							$(".login_forgot").css("margin-top", "0px");
                	   }
                	   else{
						//일치하는 계정 있을 경우 해당 계정으로 로그인 및 메인 화면으로 이동
                		   //alert("로그인 성공");
                		   window.location.href = "/main.do";
                	   }
 		               console.log(p);
		               console.log("성공");
		            },
	               	error : function(p)
	               	{
						console.log("실패");
						alert("계정 정보 불일치");						
						$(".pw_miss").show();
                		$(".info_login").css("height", "400px");
                		$(".login_forgot").css("margin-top", "0px");		                  
	               	}
                });
            }            
        </script>
    </head>

    <body>
		<!-- 로그인 페이지 html -->
        <div id="main">
            <div class="main_top">
                <div class="main_area">
					<!-- 좌측 스마트폰 img 영역 -->
                    <div class="img_area">
                        <div class="phones">
                            <div class="screenshot">
                                <ul>
                                    <li>
                                        <img class="screenshot_img" src="images\login_img\screenshot1.png">
                                    </li>
                                </ul>
                            </div>
                            <img class="phones_img" src="images\login_img\home-phones.png">
                        </div>
                    </div>
					<!-- 우측 로그인 정보 입력 및 회원가입 btn 영역 -->
                    <div class="info_area">
                        <div class="info_login">
                            <div class="login_logo">
                                <img class="login_logo_img" src="images\icon\logo.png">
                            </div>
                            <div class="login_ID">
                                <input type="text" value="01039379000" placeholder="전화번호, 사용자 이름 또는 이메일"/>
                            </div>
                            <div class="login_PW">
                                <input type="password" value="930101" placeholder="비밀번호"/>
                            </div>
                            <div class="login_btn" onclick="fnInputLoginInfo();">
                                	로그인
                            </div>
                            <div class="login_info_text">
                                -------------------- 또는 --------------------
                            </div>
                            <div class="login_fb">
                                <img class="login_fb_icon" src="images\icon\fb_logo.png">
                                Facebook으로 로그인
                            </div>
                            <div class="pw_miss">
                                	계정 정보를 다시 확인하세요.
                            </div>
                            <div class="login_forgot" onclick="goPage('findPW');">
                                	비밀번호를 잊으셨나요?
                            </div>
                        </div>
                        <div class="info_join">
                            	계정이 없으신가요?
                            <div id="join_btn" onclick="goPage('join');">가입하기</div>
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
            </div>            
            <div class="main_footer"></div>
        </div>
    </body>
</html>