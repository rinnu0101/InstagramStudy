<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- css ���� -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- �������� �ҷ����� -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- ��Ÿ�Ͻ�Ʈ ���� -->
        <link rel="stylesheet" href="css/Login.css">
        <!-- ����js ���� -->
        <script src="js/common.js"></script>
        
        <script>
        	<!-- ����Ʈ�� ȭ�� roof -->
            var arrImgPath = [2, 3, 4 ,1];
            var roof = 0;
            setInterval(function() {
                $(".screenshot_img").attr("src", "images/login_img/screenshot" + arrImgPath[roof] + ".png");
                roof = roof + 1;
                roof = roof == 4 ? 0 : roof;
            }, 3020);
            
            <!-- �α��� ���� �Է��ϱ� -->
            function fnInputLoginInfo(){
            	var loginInfo =
	           		{
	           			'user_id' : $(".login_ID").find("input").val()
	   	            ,   'user_pw' : $(".login_PW").find("input").val()
	           		};
            	
            	//POST
                $.ajax({
                	url : "/getLoginInfo.do",
                	type : "POST",
                	data : loginInfo,
                	success : function(p)
		            {
                	   if(p==""){
                		   $(".pw_miss").show();
                		   $(".info_login").css("height", "400px");
                		   $(".login_forgot").css("margin-top", "0px");
                	   }
                	   else{
                		   alert("�α��� ����");
                	   }
 		               console.log(p);
		               console.log("����");
		            },
	               	error : function(p)
	               	{
			           console.log("����");		                  
	               	}
                });
            }
            
        </script>
    </head>

    <body>
        <div id="main">
            <div class="main_top">
                <div class="main_area">
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
                    <div class="info_area">
                        <div class="info_login">
                            <div class="login_logo">
                                <img class="login_logo_img" src="images\icon\logo.png">
                            </div>
                            <div class="login_ID">
                                <input type="text" placeholder="��ȭ��ȣ, ����� �̸� �Ǵ� �̸���"/>
                            </div>
                            <div class="login_PW">
                                <input type="password" placeholder="��й�ȣ"/>
                            </div>
                            <div class="login_btn" onclick="fnInputLoginInfo();">
                                	�α���
                                	<!-- todo : �α��ι�ư Ŭ���� DB���� Ʋ���� pw_miss Ŭ���� ���̰� �� ��
                                				info_login height 400px / login_forgot margin-top 0px�� ���� -->
                            </div>
                            <div class="login_info_text">
                                -------------------- �Ǵ� --------------------
                            </div>
                            <div class="login_fb">
                                <img class="login_fb_icon" src="images\icon\fb_logo.png">
                                Facebook���� �α���
                            </div>
                            <div class="pw_miss">
                                	���� ������ �ٽ� Ȯ���ϼ���.
                            </div>
                            <div class="login_forgot" onclick="goPage('findPW');">
                                	��й�ȣ�� �����̳���?
                            </div>
                        </div>
                        <div class="info_join">
                            	������ �����Ű���?
                            <div id="join_btn" onclick="goPage('join');">�����ϱ�</div>
                        </div>
                        <div class="info_download">
                            <div class="download_text">���� �ٿ�ε��ϼ���.</div>
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