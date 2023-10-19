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
        
        <script>
            //���̾��˾� �Լ�
            function fnLayerPopupOpen()
            {
                var oWidth = $("#layerPopup").outerWidth();
                var cWidth = $("#story_layerPopup_contents").width();
                var ml = (oWidth-cWidth)/2;

                var oHeight = $("#layerPopup").outerHeight();
                var cHeight = $("#story_layerPopup_contents").height();
                var mt = (oHeight-cHeight)/2;

                $("#story_layerPopup_contents").css("margin-left", ml);
                $("#story_layerPopup_contents").css("margin-top", mt);
                $("#layerPopup").show();
            }

            function fnLayerPopupClose()
            {
                $("#layerPopup").hide();
            }

            //���丮 ���, ���� ��ư �̹��� ����
            $(document).ready(function(){
                init();
            });

            function init()
            { 
                $(".SP_contents_play_btn").click(function(){
                    fn_story_btn_toggle();
                });
                $(".SP_contents_stop_btn").click(function(){
                    fn_story_btn_toggle();
                });
            }

            function fn_story_btn_toggle()
            {  
                if($(".SP_contents_play_btn").css("display") == "none")
                {
                    /*stop Ŭ������ �� play��ư���� ����*/
                    $(".SP_contents_play_btn").show();
                    $(".SP_contents_stop_btn").hide();
                }
                else
                {
                    /*play Ŭ������ �� stop��ư���� ����*/
                    $(".SP_contents_play_btn").hide();
                    $(".SP_contents_stop_btn").show();
                }
            }


        </script>
    </head>

    <body>
        <!-- ���丮 ���̾��˾� html-->
        <div id="layerPopup">
            <div id="story_layerPopup_bg" onclick="fnLayerPopupClose();">
                <div class="layerPopupClose_btn">
                    <img src="img\icon\close_WT.png">
                </div>
            </div>

            <!-- ���丮 ���̾��˾� �¿��ư-->
            <div class="Story_Next_btn_L">
                <img class="Story_Next_btn" src="img\icon\next_WT_L.png">
            </div>
            <div class="Story_Next_btn_R">
                <img class="Story_Next_btn" src="img\icon\next_WT_R.png">
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
                            <img class='SP_profile_img' src="img\profile_img\1.jpg">
                        </div>
                        <div class="SP_account_ID">asdfasdfasdf</div>
                        <div class="SP_contents_play">
                            <img class="SP_contents_play_btn" src="img\icon\play.png">
                            <img class="SP_contents_stop_btn" src="img\icon\stop.png" style="display: none;">
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
                            <img class="SP_reaction_btn" src="img\icon\notice_lw.png">
                        </div>
                        <div class="SP_reaction_direct">
                            <img class="SP_reaction_btn" src="img\icon\direct_w.png">
                        </div>
                    </div>
                </div>
                <div class="SP_contents_img">
                    <ul>
                        <!-- todo : Ŭ���� story�� img �߰��ϱ�-->
                        <li>
                            <img src="img\stroy_img\a.jpg">
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
                        <img onclick="goPage('logo');" src="img\icon\logo.png">
                    </div>
    
                    <div id="main_menu">
                        <ul>
                            <li onclick="goPage('home');">
                                <img class='main_menu_icon' src="img\icon\home.png"/>
                                <div id="menu_home">Ȩ</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\search.png"/>
                                <div id="menu_search">�˻�</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\explore.png"/>
                                <div id="menu_explore">Ž�� ��</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\reels.png"/>
                                <div id="menu_reels">����</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\direct.png"/>
                                <div id="menu_direct">�޽���</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\notice.png"/>
                                <div id="menu_notice">�˸�</div>
                            </li>
                            <li>
                                <img class='main_menu_icon' src="img\icon\upload.png"/>
                                <div id="menu_upload">�����</div>
                            </li>
                            <li onclick="goPage('profile');">
                                <img class='main_menu_profile' src="img\profile_img\my_profile.jpg"/>
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
                                <img class='main_menu_icon' src="img\icon\moreMenu.png"/>
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
                                <!-- todo : ul width auto ó���ϱ� -->
                                <li onclick="fnLayerPopupOpen();">
                                    <div class="story_profile">
                                        <img class='story_profile_img' src="img\profile_img\1.jpg">
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
                        </div>
                        <div id="main_contents_feed">
                            <div class="feed_component">
                                <div class="comp_account">
                                    <div class="comp_account_img">
                                        <!-- todo : ���� �̹���&������ DB���� �޾ƿ����� �ϱ� -->
                                        <img class='feed_profile' src="img\profile_img\my_profile.jpg">
                                        <div class="comp_account_name">������</div>
                                        <div class="comp_account_option">
                                            <img class='comp_option_icon' src="img\icon\option.png"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="comp_post">
                                    <ul>
                                        <li>
                                            <img class='post' src="img\feed_img\feed1.jpg">
                                        </li>
                                    </ul>
                                </div>
                                <div class="comp_PIS">
                                    <div class="comp_PIS_L">
                                        <ul>
                                            <li><img class='comp_PIS_icon' src="img\icon\notice.png"/></li>
                                            <li><img class='comp_PIS_icon' src="img\icon\comment.png"/></li>
                                            <li><img class='comp_PIS_icon' src="img\icon\direct.png"/></li>
                                        </ul>
                                    </div>
                                    <div class="comp_PIS_R">
                                        <ul>
                                            <li><img class='comp_bookmark_icon' src="img\icon\bookmark.png"/></li>
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
                                    <img class='myAccount_img_class' src="img\profile_img\my_profile.jpg">
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
                                                <img class='otherAccount_img_class' src="img\profile_img\1.jpg">
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