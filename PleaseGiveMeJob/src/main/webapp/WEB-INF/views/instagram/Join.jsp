<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<html>
    <head>
        <!-- css ���� -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- �������� �ҷ����� -->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- ��Ÿ�Ͻ�Ʈ ���� -->
        <link rel="stylesheet" href="css/Join.css">
        <!-- ����js ���� -->
        <script src="js/common.js"></script>
        
        <script>
        	<!-- ȸ������ ���� �Է��ϱ� -->
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
                //url�� ��� ������ ����Ǿ� ���� ���
                
           		//POST
                $.ajax({
                	url : "/setJoinInfo.do",
                	type : "POST",
                	data : joinInfo,
                	success : function(p)
		            {
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
                <div id="join_area">
                    <div id="join_info">
                        <div class="login_logo">
                            <img class="login_logo_img" src="images\icon\logo.png">
                        </div>
                        <div id="join_text">ģ������ ������ �������� ������</br>���� �����ϼ���.</div>
                        <div class="login_fb_btn">
                            <img class="login_fb_icon" src="images\icon\fb_logo_wt.png">
                            Facebook���� �α���
                        </div>
                        <div class="login_info_text">
                            ----------------------- �Ǵ� -----------------------
                        </div>
                        <div class="join_ID">
                            <input type="text" placeholder="�޴��� ��ȣ �Ǵ� �̸��� �ּ�"/>
                        </div>
                        <div class="join_name">
                            <input type="text" placeholder="����"/>
                        </div>
                        <div class="join_nickname">
                            <input type="text" placeholder="����� �̸�"/>
                        </div>
                        <div class="join_PW">
                            <input type="password" placeholder="��й�ȣ"/>
                        </div>
					<div class="login_btn" onclick="fnInputJoinInfo();">ȸ������</div>
					<div id="join_info_text">
                            	���� ���񽺸� �̿��ϴ� ����� ȸ������ ����ó ������ Instagram�� ���ε����� ���� �ֽ��ϴ�.
                            <div id="join_info_more">
                            	�� �˾ƺ���
                            </div>
                        </div>
                    </div>
                    <div class="join_login">
                        	������ �����Ű���?
                        <div id="join_login_btn" onclick="goPage('login');">�α���</div>
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
            <div class="main_footer"></div>
        </div>
    </body>
</html>