<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- ������ �ǵ� ���̾��˾� html-->
<div id="layerPopup_feed">
    <div id="feed_layerPopup_bg" onclick="fnPopFeedClose();">
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