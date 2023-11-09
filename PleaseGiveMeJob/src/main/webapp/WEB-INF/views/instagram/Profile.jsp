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
        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        <!-- ����js ���� -->
        <script src="js/common.js"></script>
        <script>
	      	//�� �Խù� ���̾��˾� �Լ�
	        function fnUploadOpen()
	        {
	            var oWidth = $("#upload_feed").outerWidth();
	            var cWidth = $("#upload_layerPopup_contents").width();
	            var ml = (oWidth-cWidth)/2;
	
	            var oHeight = $("#upload_feed").outerHeight();
	            var cHeight = $("#upload_layerPopup_contents").height();
	            var mt = (oHeight-cHeight)/2;
	
	            $("#upload_layerPopup_contents").css("margin-left", ml);
	            $("#upload_layerPopup_contents").css("margin-top", mt);
	            $("#upload_feed").show();
	        }
	
	        function fnUploadClose()
	        {
	            $("#upload_feed").hide();
	        }
        
            //���̾��˾� �Լ�
            function fnLayerPopupOpen()
            {
                var oWidth = $("#layerPopup_feed").outerWidth();
                var cWidth = $("#feed_layerPopup_contents").width();
                var ml = (oWidth-cWidth)/2;

                var oHeight = $("#layerPopup_feed").outerHeight();
                var cHeight = $("#feed_layerPopup_contents").height();
                var mt = (oHeight-cHeight)/2;

                $("#feed_layerPopup_contents").css("margin-left", ml);
                $("#feed_layerPopup_contents").css("margin-top", mt);
                $("#layerPopup_feed").show();
            }

            function fnLayerPopupClose()
            {
                $("#layerPopup_feed").hide();
                fnFileReset();
            }
		</script>
    </head>

    <body>
    	<!-- �� �Խù� ���ε� ���̾��˾� html-->
        <div id="upload_feed">
            <div class="upload_layerPopup_bg" onclick="fnUploadClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- �� �Խù� ���ε� ���̾��˾� ������ html-->
            <div id="upload_layerPopup_contents">
                <div id="upload_top">
                    <div id="upload_backstep">
                        <img class="upload_backstep_btn" src="images\icon\arrow-left.png">
                    </div>
                    <div id="new_upload">
                        	�� �Խù� �����
                    </div>
                    <div id="upload_btn">
                        	�����ϱ�
                    </div>
                </div>
                <div id="upload_main">
                    <div id="upload_contents"></div>
                    <div id="upload_options">
                        <div id="upload_profile">
                            <div id="upload_profile_img">
                                <img src="images\profile_img\my_profile.jpg">
                                <!-- todo : ���� �̹��� �ҷ����� -->
                            </div>
                            <div id="upload_profile_id">
                                asdfasdfasdfasdf
                                <!-- todo : ���� ID �ҷ����� -->
                            </div>
                        </div>
                        <div id="upload_text">
                            <textarea  placeholder="������ �Է��ϼ���..."></textarea>
                        </div>
                        <div id="upload_emoji">
                            <div id="upload_emoji_btn">
                                <img src="images\icon\emoji.png">
                            </div>
                            <div id="upload_text_charnum"></div>
                        </div>
                        <div id="upload_file">
                            <!-- todo : ���Ͼ��ε� ���� -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
	        
        <!-- ������ �ǵ� ���̾��˾� html-->
        <div id="layerPopup_feed">
            <div id="feed_layerPopup_bg" onclick="fnLayerPopupClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- ���̾��˾� �¿��ư-->
            <div class="Next_btn_L">
                <img class="Next_btn" src="images\icon\next_WT_L.png">
            </div>
            <div class="Next_btn_R">
                <img class="Next_btn" src="images\icon\next_WT_R.png">
            </div>

            <!-- �ǵ� ���̾��˾� ������ html-->
            <div id="feed_layerPopup_contents">
                <div id="FP_contents_img">
                    <ul>
                        <!-- todo : Ŭ���� post�� img �߰��ϱ�-->
                        <li>
                            <img src="images\feed_img\feed1.jpg">
                        </li>
                    </ul>
                </div>
                <div id="FP_contents_post">
                    <div id="FPCP_account">
                        <div id="FPCP_account_area">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\my_profile.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                asdfasdfasdfasdf
                            </div>
                        </div>
                        <div id="FPCP_account_option">
                            <img src="images\icon\option.png"/>
                        </div>
                    </div>
                    <div id="FPCP_body">
                        <div id="FPCP_body_log">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\my_profile.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                asdfasdfasdfasdf
                            </div>
                            <div class="FPCP_text">
                             	   ���� �ؽ�Ʈ ����
                            </div>
                        </div>
                        <div class="FPCP_body_comment">
                            <div class="FPCP_account_profile">
                                <img src="images\profile_img\1.jpg">
                            </div>
                            <div class="FPCP_account_ID">
                                lkjlkjlkjlkj
                            </div>
                            <div class="FPCP_text">
                             	   ��� �ؽ�Ʈ ����
                            </div>
                        </div>
                    </div>
                    <div id="FPCP_PIS">
                        <div id="FPCP_PIS_btn">
                            <div class="FPCP_PIS_btn_L">
                                <ul>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\notice.png"/></li>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\comment.png"/></li>
                                </ul>
                            </div>
                            <div class="FPCP_PIS_btn_R">
                                <ul>
                                    <li><img class='FPCP_PIS_btn_icon' src="images\icon\bookmark.png"/></li>
                                </ul>
                            </div>
                        </div>
                        <div id="FPCP_PIS_like">
                            <span></span>�� �� <span></span>���� �����մϴ�
                        </div>
                        <div id="FPCP_PIS_date">���ε�����</div>
                    </div>
                    <div id="FPCP_reply">
                        <div id="FPCP_reply_emoji">
                            <img src="images\icon\emoji.png">
                        </div>
                        <div id="FPCP_reply_text">                            
                            <input type="text" placeholder="��� �ޱ�"/>
                        </div>
                        <div id="FPCP_reply_btn">
                            <!-- todo : �ؽ�Ʈ ������ ��Ȱ��ȭ-->
                      	      �Խ�
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ���������� html-->
        <div id="main">
            <div id="main_left">
                <div id="left_area">
                    <div id="main_logo">
                        <img onclick="goPage('logo');" src="images\icon\logo.png">
                    </div>
    
                    <div id="main_menu">
                        <ul>
                            <li onclick="goPage('home');">
                                <img class='main_menu_icon' src="images\icon\home.png"/>
                                <div id="menu_home">Ȩ</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="images\icon\search.png"/>
                                <div id="menu_search">�˻�</div>
                            </li>
                            <!-- <li>
                                <img class='main_menu_icon' src="images\icon\explore.png"/>
                                <div id="menu_explore">Ž�� ��</div>
                            </li> -->
                            <!-- <li>
                                <img class='main_menu_icon' src="images\icon\reels.png"/>
                                <div id="menu_reels">����</div>
                            </li> -->
                            <li>
                                <img class='main_menu_icon' src="images\icon\direct.png"/>
                                <div id="menu_direct">�޽���</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="images\icon\notice.png"/>
                                <div id="menu_notice">�˸�</div>
                            </li>
                            <li onclick="fnUploadOpen();">
                                <img class='main_menu_icon' src="images\icon\upload.png"/>
                                <div id="menu_upload">�����</div>
                            </li>
                            <li onclick="goPage('profile');">
                                <img class='main_menu_profile' src="images\profile_img\my_profile.jpg"/>
                                <!-- todo : 
                                    - DB���� �� ������ �̹��� ��������
                                    - ������ �̹��� ������ "icon\profile.png" �ڵ����� ���� -->
                                <div id="menu_profile">������</div>
                            </li>
                        </ul>
                    </div>
    
                    <div id="main_moreMenu">
                        <ul>
                            <li>
                                <img class='main_menu_icon' src="images\icon\moreMenu.png"/>
                                <div id="moreMenu">
                                    <!-- todo : ������ �� �޴� �����ϱ� -->
                                    	�� ����
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="main_middle">
                <div id="profile_middle_area">
                    <div id="profile_Top">
                        <div id="profile_TopImgArea">
                            <!-- todo : �� ���������� Ŭ�� Ȱ��ȭ, �����ʻ��� �ٲٱ� �� ��� �ֱ� -->
                            <div style="text-align: center;">
                                <img id='profile_TopImg' src="images\profile_img\my_profile.jpg">
                            </div>
                        </div>
                        <div id="profile_TopInfo">
                            <div id="Info_ID">
                                <!-- todo : ��ID�ҷ����� -->
                                <div id="Info_ID_name">����ID</div>
                                <div id="Info_ID_option">
                                    <img src="images\icon\setting.png"/>
                                </div>
                            </div>
                            <div id="Info_Account">
                                <ul>
                                    <!-- todo : �Խù�, �ȷο�, �ȷο� ���� �ҷ����� -->
                                    <li>
                                        	�Խù�<span></span>
                                    </li>
                                    <li>
                                        <div id="follower" style="cursor: pointer;">
                                           	 �ȷο�<span></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="follow" style="cursor: pointer;">
                                            	�ȷο�<span></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div id="Info_Text">
                                <div id="Info_Text1">���ټҰ���</div>
                                <div id="Info_Text2">�󼼼����</div>
                            </div>
                        </div>
                    </div>

                    <div id="profile_feedMenu">
                        <div id="feedMenu_log">
                            <img style="width: 12px; height: 12px; object-fit: cover; margin-right: 5px;" src="images\icon\grid.png"/>
                        	    �Խù�
                        </div>
                    </div>

                    <div id="profile_feedContents">
                        <ul class="feedContents_line">
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed1.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : ���ƿ�, ��� ���� �ҷ����� -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed2.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : ���ƿ�, ��� ���� �ҷ����� -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                            <li onclick="fnLayerPopupOpen();">
                                <div class="feedContents_log">
                                    <div class="log_img">
                                        <img src="images\feed_img\feed3.jpg">
                                    </div>
                                    <div class="feedContents_PIS">
                                        <!-- todo : ���ƿ�, ��� ���� �ҷ����� -->
                                        <div class="log_heart">
                                            <img class="log_PIS_icon" src="images\icon\notice_w.png"/>
                                            <span>0</span>
                                        </div>
                                        <div class="log_comment">
                                            <img class="log_PIS_icon" src="images\icon\comment_w.png"/>
                                            <span>0</span>
                                        </div>                                    
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>