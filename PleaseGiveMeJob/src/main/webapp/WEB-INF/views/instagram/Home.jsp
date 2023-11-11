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
        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="css/LayerPopup.css">
        
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
                        <!-- todo : ���� ���� �� Ȱ��ȭ -->
                    	<!-- <ul class="upload_contents_ul">
                            <li>
                            	<img class='upload_contents_img' src="images\feed_img\feed1.jpg">
                            </li>
                            <li>
                            	<img class='upload_contents_img' src="images\feed_img\feed2.jpg">
                            </li>
                            <li>
                            	<img class='upload_contents_img' src="images\feed_img\feed3.jpg">
                            </li>
                            <li>
                            	<img class='upload_contents_img' src="images\feed_img\feed4.jpg">
                            </li>
                            <li>
                            	<img class='upload_contents_img' src="images\feed_img\feed5.jpg">
                            </li>
                        </ul>
                        <div class="upload_contents_arrow">
                            <a href="javascript:;" class="prev" onclick="fnMoveUploadSlide(this);">
                                <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
                            </a>
                            <a href="javascript:;" class="next" onclick="fnMoveUploadSlide(this);">
                                <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
                            </a>
                        </div> -->
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

        <!-- �� ���丮 ���ε� ���̾��˾� html-->
        <div id="upload_story">
            <div class="upload_layerPopup_bg" onclick="fnStoryUploadClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- �� ���丮 ������ html-->
            <div id="upload_story_contents">
                <div id="story_file_insert">
                    <div class="file_insert_info">
                        	������ �������� ���⿡ ����� ��������
                    </div>
                    <div class="file_insert_btn" onclick="fnStoryFileSelect();">
                        	��ǻ�Ϳ��� ����
                    </div>
                    <div style="display:none;">
                        <input id="input_file_story" type="file" multiple="multiple" />
                    </div>
                </div>
                <!-- upload file li �޴� ul -->
                <ul class="upload_story_contents_ul" style="display:none;">
                </ul>
                <!-- li �����̵� ��ư -->
                <!-- todo : li ������ 2�� �̻��� ���� ��ư show, �� ����/������ ���޽� ���� ��ư hide -->
                <div class="upload_story_arrow" style="display:none;">
                    <a href="javascript:;" class="prev" onclick="fnStoryMoveUploadSlide(this);">
                        <img class='upload_arrow_img' src="images\icon\next_WT_L.png">
                    </a>
                    <a href="javascript:;" class="next" onclick="fnStoryMoveUploadSlide(this);">
                        <img class='upload_arrow_img' src="images\icon\next_WT_R.png">
                    </a>
                </div>
                <div id="upload_story_btn" style="display:none;" onclick="fnSaveNewStory();">
                    	�� ���丮
                </div>
            </div>
        </div>
    	
        <!-- ���丮 ���̾��˾� html-->
        <div id="layerPopup_story">
            <div id="story_layerPopup_bg" onclick="fnLayerPopupClose();">
                <div class="layerPopupClose_btn">
                    <img src="images\icon\close_WT.png">
                </div>
            </div>

            <!-- ���丮 ���̾��˾� �¿��ư-->
            <div class="Story_Next_btn_L">
                <img class="Story_Next_btn" src="images\icon\next_WT_L.png">
            </div>
            <div class="Story_Next_btn_R">
                <img class="Story_Next_btn" src="images\icon\next_WT_R.png">
            </div>

            <!-- ���丮 ���̾��˾� ������ html-->
            <div id="story_layerPopup_contents">
                <div class="SP_contents_header">
                    <div class="SP_contents_length">
                        <!-- todo : ���丮 ������ ���� ĭ �����ϰ� ������ �����ϴ� �� ����-->
                    </div>
                    <div class="SP_contents_account">
                        <div class="SP_account_profile">
                            <!-- todo : Ŭ���� story ������ ������ img �߰��ϱ�-->
                            <img class='SP_profile_img' src="images\profile_img\1.jpg">
                        </div>
                        <div class="SP_account_ID">asdfasdfasdf</div>
                        <div class="SP_contents_play">
                            <img class="SP_contents_play_btn" src="images\icon\play.png">
                            <img class="SP_contents_stop_btn" src="images\icon\stop.png" style="display: none;">
                        </div>
                    </div>
                </div>
                <div class="SP_contents_reaction">
                    <div class="SP_reaction_effect">
                        <!-- todo : �̸��� ������ ����Ʈ ����-->
                    </div>
                    <div class="SP_contents_reaction_area">
                        <div class="SP_reaction_reply">
                            <div class="SP_reaction_reply_text">
                                <input type="text" placeholder="�Կ��� �����ϱ�..."/>
                            </div>                            
                        </div>
                        <div class="SP_reaction_like">
                            <img class="SP_reaction_btn" src="images\icon\notice_lw.png">
                        </div>
                        <div class="SP_reaction_direct">
                            <img class="SP_reaction_btn" src="images\icon\direct_w.png">
                        </div>
                    </div>
                </div>
                <div class="SP_contents_img">
                    <ul>
                        <!-- todo : Ŭ���� story�� img �߰��ϱ�-->
                        <li>
                            <img src="images\stroy_img\a.jpg">
                        </li>
                    </ul>
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
                <div id="middle_area">
                    <div id="main_contents">
                        <div id="main_contents_story">
                            <ul class="story_friend_ul">
                                <li class="story_upload" onclick="fnStoryUpload();">
                                    <div class="story_upload_btn">
                                        <img class='story_upload_btn_img' src="images\icon\upload.png">
                                    </div>
                                    <div class="story_accountName">�� ���丮</div>
                                </li>
                                <li onclick="fnLayerPopupOpen();">
                                    <div class="story_profile">
                                        <img class='story_profile_img' src="images\profile_img\1.jpg">
                                    </div>
                                    <div class="story_accountName">asdfasdfasdfasdf</div>
                                </li>
                                <li>ģ��2</li>
                                <li>ģ��3</li>
                                <li>ģ��4</li>
                                <li>ģ��5</li>
                                <li>ģ��6</li>
                                <li>ģ��7</li>
                                <li>ģ��8</li>
                                <li>ģ��9</li>
                                <li>ģ��10</li>
                                <li>ģ��11</li>
                                <li>ģ��12</li>
                            </ul>
                            <div class="story_arrow_prev">
                                <a href="javascript:;" class="prev" onclick="fnMoveStorySlide(this);">
                                    <img class='story_arrow_img' src="images\icon\next_WT_L.png">
                                </a>
                            </div>
                            <div class="story_arrow_next">
                                <a href="javascript:;" class="next" onclick="fnMoveStorySlide(this);">
                                    <img class='story_arrow_img' src="images\icon\next_WT_R.png">
                                </a>
                            </div>
                            <!-- <div class="story_arrow">
                                <a href="javascript:;" class="prev" onclick="fnMoveStorySlide(this);">
                                    <img class='story_arrow_img' src="images\icon\next_WT_L.png">
                                </a>
                                <a href="javascript:;" class="next" onclick="fnMoveStorySlide(this);">
                                    <img class='story_arrow_img' src="images\icon\next_WT_R.png">
                                </a>
                            </div> -->
                        </div>
                        <div id="main_contents_feed">
                            <div class="feed_component">
                                <div class="comp_account">
                                    <div class="comp_account_img">
                                        <!-- todo : ���� �̹���&������ DB���� �޾ƿ����� �ϱ� -->
                                        <img class='feed_profile' src="images\profile_img\my_profile.jpg">
                                        <div class="comp_account_name">������</div>
                                        <div class="comp_account_option">
                                            <img class='comp_option_icon' src="images\icon\option.png"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="comp_post">
                                    <ul>
                                        <li>
                                            <img class='post' src="images\feed_img\feed1.jpg">
                                        </li>
                                    </ul>
                                </div>
                                <div class="comp_PIS">
                                    <div class="comp_PIS_L">
                                        <ul>
                                            <li><img class='comp_PIS_icon' src="images\icon\notice.png"/></li>
                                            <li><img class='comp_PIS_icon' src="images\icon\comment.png"/></li>
                                            <li><img class='comp_PIS_icon' src="images\icon\direct.png"/></li>
                                        </ul>
                                    </div>
                                    <div class="comp_PIS_R">
                                        <ul>
                                            <li><img class='comp_bookmark_icon' src="images\icon\bookmark.png"/></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="comp_like">
                                    	���ƿ� <span></span>��
                                </div>
                                <div class="comp_text">
                                    <!-- todo
                                        - ������ DB���� �޾ƿ����� �ϱ�
                                        - ���� 1�� �̻� ������� [�� ����]��ư Ȱ��ȭ�Ͽ� ����α� -->
                                   	 ���� �ؽ�Ʈ ����
                                </div>
                                <div class="comp_comment">
                                    <!-- todo
                                        - ��� 1�� �߻��� [��� 1�� ����]��ư Ȱ��ȭ, Ŭ���� �˾� �ǵ忡�� ��� Ȯ��
                                        - ��� 1�� �̻� ������� [��� N�� ��� ����]��ư���� �����ϱ�
                                        - ��� �ۼ��� ������ ����ϱ� -->
                                        	��� �б� ����
                                </div>
                                <div class="comp_comment_writing">
                                    	��� ���� ����
                                </div>
                            </div>
                        
                        </div>
                    </div>
                
                    <div id="main_right">
                        <div id="main_recommend">
                            <div id="recommend_myAccount">
                                <div class="myAccount_img">
                                    <img class='myAccount_img_class' src="images\profile_img\my_profile.jpg">
                                </div>
                                <div class="Account_ID">
                                    <div id="Account_myID">������</div>
                                    <div id="Account_myIntro">�������ټҰ�</div>
                                </div>
                                <div id="myAccount_switch">��ȯ</div>
                            </div>
                            <div id="recommend_otherAccount">
                                <div id="recommend_otherAccount_seeAllList">
                                   	 ȸ������ ���� ��õ
                                    <!-- todo : ��κ��� ��ư ����� -->
                                    <div id="seeAllList_btn">��� ����</div>
                                </div>
                                <div id="recommend_otherAccount_list">
                                    <ul class="recommend_randomList">
                                        <!-- todo : � �������� �����ϰ� ������ ��õ�� ���ΰ�? -->
                                        <li>
                                            <div class="otherAccount_img">
                                                <img class='otherAccount_img_class' src="images\profile_img\1.jpg">
                                            </div>
                                            <div class="Account_ID">
                                                <div class="Account_otherID">������</div>
                                                <div class="Account_otherIntro">�������ټҰ�</div>
                                            </div>
                                            <div class="otherAccount_follow">�ȷο�</div>
                                        </li>
                                        <li>������õ2</li>
                                        <li>������õ3</li>
                                        <li>������õ4</li>
                                        <li>������õ5</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="main_information_area">
                            	��� �� ���� �ؽ�Ʈ ����
                        </div>
                    </div>
                </div>
            </div>            
        </div>        
    </body>
</html>
<script src="js/upload.js"></script>
<script>	    
    //���丮 ���, ���� ��ư �̹��� ����
    $(document).ready(function(){
        init();
    });
</script>