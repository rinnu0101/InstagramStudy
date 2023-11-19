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
                    <div id="upload_btn" onclick="fnSaveNewFeed();">
                        	�����ϱ�
                    </div>
                </div>
                <div id="upload_main">
                    <div id="upload_contents">
                    	<div id="file_insert">
	                    	<div class="file_insert_info">
	                    		������ �������� ���⿡ ����� ��������
	                    	</div>
	                    	<div class="file_insert_btn" onclick="fnFileSelect();">
	                    		��ǻ�Ϳ��� ����
	                    	</div>
                            <div style="display: none;">
                                <input id="input_file_feed" type="file" multiple="multiple"/>
                            </div>
                    	</div>
                        <!-- upload file li �޴� ul -->
                    	<ul class="upload_contents_ul" style="display:none;">
                        </ul>
                        <!-- li �����̵� ��ư -->
                        <!-- todo : li ������ 2�� �̻��� ���� ��ư show, �� ����/������ ���޽� ���� ��ư hide -->
                        <div class="upload_contents_arrow" style="display:none;">
                            <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
                                <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
                            </a>
                            <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
                                <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
                            </a>
                        </div>
                    </div>
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
        
        <!-- �ǵ� ���� �˾� �߰� -->
        <jsp:include page="FeedPop.jsp"></jsp:include>
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
                            <li onclick="fnPopFeed();">
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
                            <li onclick="fnPopFeed();">
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
                            <li onclick="fnPopFeed();">
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

<script src="js/upload.js"></script>
<script>	    
    $(document).ready(function(){
        init();
    });
</script>