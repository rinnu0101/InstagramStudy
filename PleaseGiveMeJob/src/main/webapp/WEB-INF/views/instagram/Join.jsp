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
        <link rel="stylesheet" href="css/Join.css">
        <!-- ����js ���� -->
        <script src="js/common.js"></script>
        
        <script>
        
        	var chkID = false;
        	var chkNN = false;
        	//ȸ������ ���� �Է��ϱ�
            function fnInputJoinInfo()
            {
        		// ID&�г��� �ߺ�üũ ��������
            	if(!chkID)
           		{
            		return false;
           		}
            	
            	if(!chkNN)
           		{
            		return false;
           		}
            	
            	// ȸ������ ���� üũ
            	var user_id = $(".join_ID").find("input").val();
                var user_name = $(".join_name").find("input").val();
                var user_nickname = $(".join_nickname").find("input").val();
                var user_pw = $(".join_PW").find("input").val();
                
                if(!user_id)
                {
                	alert("ID�� �Է����ּ���");
                	return false;
                }
                if(!user_name)
                {
                	alert("������ �Է����ּ���");
                	return false;
                }
                if(!user_nickname)
                {
                	alert("�г����� �Է����ּ���");
                	return false;
                }
                if(!user_pw)
                {
                	alert("��й�ȣ�� �Է����ּ���");
                	return false;
                }

                // ȸ������ �Է� ajax json
            	var joinInfo =
	                {
	                    'user_id' : $(".join_ID").find("input").val()
	                ,   'user_name' : $(".join_name").find("input").val()
	                ,   'user_nickname' : $(".join_nickname").find("input").val()
	                ,   'user_pw' : $(".join_PW").find("input").val()
	                }
            	
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
		               	if(p == "JOIN_OK")
	            	   	{
		               		alert("ȸ�����Կ� �����ϼ̽��ϴ�.");
		               		window.location.href = "/instagram.do";
	            	   	}
		               	else
		               	{
		            	   	alert("ȸ�������� �ٽ� Ȯ���ϼ���.");
		               	}
		            },
	               	error : function(p)
	               	{
			           console.log("ȸ�����Խ���");		                  
	               	}
                });
            }
            
            //ȸ������ ���� ��ȿ�� �˻�
            var fnValidation = function(obj)
            {
            	//1. focus out ������ �Լ� ȣ��
            	var type = $(obj).attr("vtype");
            	var value = $(obj).val();
            	
            	if(value.indexOf('-') != -1)
            	{
            		value = value.replace(/-/gi, "");
            		$(obj).val(value);
            	}
            	
            	//2. ���� ���� ��쿡�� validation üũ
            	if(!value) return false;
            	
            	//ID ��ȿ�� �˻�
            	if(type == "id")
            	{
            		var idInfo =
	                {
               			'user_id' : $(".join_ID").find("input").val(),
	                }
            		
            		//ID �ߺ�Ȯ��
            		$.ajax({
                    	url : "/getIdDuplCheck.do",
                    	type : "POST",
                    	data : idInfo,
                    	success : function(p)
    		            {
                  			console.log(p);
    		               	if(p == "ID_FAIL")
    	            	   	{
    		               		chkID = false;
    		               		alert("�ߺ��� ID�� �Է��ϼ̽��ϴ�. �ٽ� Ȯ���ϼ���.");
    		               		$(".join_ID").find("input").css("color", "red");
    		               		$(".join_ID").find(".confirm").find(".confirm_check").hide();
    	            			$(".join_ID").find(".confirm").find(".confirm_error").show();
    		               		return false;
    	            	   	}
    		               	/* else
    		               	{
    		               		chkID = true;
    		               		$(".join_ID").find("input").css("color", "black");
    		               		$(".join_ID").find(".confirm").find(".confirm_check").show();
    		            		$(".join_ID").find(".confirm").find(".confirm_error").hide();
    		               	} */
    		            },
    	               	error : function(p)
    	               	{
    			           console.log("IDüũ����");		                  
    	               	}
                    });
            		
	            	//case 1. ������ ���ԵǾ� ���� ��� �̸��� ��ȿ�� �˻�
	            	const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	            	if(pattern.test(value) === true)
	            	{
	            		//alert("�̸����ּ�");
	            		$(".join_ID").find("input").css("color", "black");
	            		$(".join_ID").find(".confirm").find(".confirm_check").show();
	            		$(".join_ID").find(".confirm").find(".confirm_error").hide();
	            	}
	            	else if(!isNaN(value))
            		{
	            		//��� üũ
            			if(Math.sign(value)==1)
            			{
            				//case 2. ���ڸ� ���� ��� �޴�����ȣ ��ȿ�� üũ
            				var phoneNumberPattern = /^01([0-9])-?([0-9]{3,4})-?([0-9]{4})$/;
            				var phoneNumber = value;
            				
	            			if(phoneNumberPattern.test(phoneNumber))
	            			{
	            				//alert("�޴�����ȣ");
	            				chkID = true;
	            				$(".join_ID").find("input").css("color", "black");
	            				$(".join_ID").find(".confirm").find(".confirm_check").show();
	            				$(".join_ID").find(".confirm").find(".confirm_error").hide();
	            			}
	            			else
	            			{
	            			    alert("id�� �޴�����ȣ �Ǵ� �̸����ּҸ� �����մϴ�.");
	            			    $(".join_ID").find("input").css("color", "red");
    		               		$(".join_ID").find(".confirm").find(".confirm_check").hide();
    	            			$(".join_ID").find(".confirm").find(".confirm_error").show();
	            			}
            			}
            		}
	            	else
            		{
	            		//case 3. �������� ��� ����
	            		chkID = false;
            			alert("id�� �޴�����ȣ �Ǵ� �̸����ּҸ� �����մϴ�.");
            			$(".join_ID").find("input").css("color", "red");
            			$(".join_ID").find(".confirm").find(".confirm_check").hide();
            			$(".join_ID").find(".confirm").find(".confirm_error").show();
            		}
            	}
            	
            	//�г��� ��ȿ�� �˻�
            	if(type == "nickname")
           		{
            		var nicknameInfo =
	                {
               			'user_nickname' : $(".join_nickname").find("input").val()
	                }
            		
            		//�г��� �ߺ�Ȯ��
            		$.ajax({
                    	url : "/getNicknameDuplCheck.do",
                    	type : "POST",
                    	data : nicknameInfo,
                    	success : function(p)
    		            {
                  			console.log(p);
    		               	if(p == "NN_FAIL")
    	            	   	{
    		               		alert("�ߺ��� �г����� �Է��ϼ̽��ϴ�. �ٽ� Ȯ���ϼ���.");
    		               		$(".join_nickname").find("input").css("color", "red");
    		               		$(".join_nickname").find(".confirm").find(".confirm_check").hide();
    	            			$(".join_nickname").find(".confirm").find(".confirm_error").show();
    		               		
    	            	   	}
    		               	else
    		               	{
    		               		chkNN = true;
    		               		$(".join_nickname").find("input").css("color", "black");
    		               		$(".join_nickname").find(".confirm").find(".confirm_check").show();
    		            		$(".join_nickname").find(".confirm").find(".confirm_error").hide();
    		               	}
    		            },
    	               	error : function(p)
    	               	{
    			           console.log("�г���üũ����");		                  
    	               	}
                    });
           		}
            }
            
            //��й�ȣ üũ btn
            var fnPwToggle = function(p)
            {
            	if(p)
            	{
            		 $(".join_PW").find("input").attr("type", "text");
            		 $(".join_PW").find(".confirm").find(".confirm_hide").hide();
            		 $(".join_PW").find(".confirm").find(".confirm_show").show();
            	}
            	else
            	{
           		 	 $(".join_PW").find("input").attr("type", "password");
           		 	 $(".join_PW").find(".confirm").find(".confirm_show").hide();
           		 	 $(".join_PW").find(".confirm").find(".confirm_hide").show();
            	} 
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
                            <input type="text" placeholder="�޴��� ��ȣ �Ǵ� �̸��� �ּ�" vtype="id" onfocusout="fnValidation(this)"/>
                            <div class="confirm">
                                <img class="confirm_check" src="images\icon\check.png">
                                <img class="confirm_error" src="images\icon\error.png">
                            </div>
                        </div>
                        <div class="join_name">
                            <input type="text" placeholder="����"/>
                        </div>
                        <div class="join_nickname">
                            <input type="text" placeholder="�г���" vtype="nickname" onfocusout="fnValidation(this)"/>
                            <div class="confirm">
                                <img class="confirm_check" src="images\icon\check.png">
                                <img class="confirm_error" src="images\icon\error.png">
                            </div>
                        </div>
                        <div class="join_PW">
                            <input type="password" placeholder="��й�ȣ"/>
                            <div class="confirm">
                                <img class="confirm_show" onclick="fnPwToggle(false);" src="images\icon\show.png">
                                <img class="confirm_hide" onclick="fnPwToggle(true);" src="images\icon\hide.png">
                            </div>
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