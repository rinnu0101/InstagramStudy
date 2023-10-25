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
        <link rel="stylesheet" href="css/FindPW.css">
        <!-- ����js ���� -->
        <script src="js/common.js"></script>
    </head>

    <body>
        <div id="main">
            <div class="top_bar">
                <div class="logo_area">
                    <div class="logo_img">
                        <img onclick="goPage('login');" src="images\icon\logo.png">
                    </div>
                </div>
            </div>
            <div class="middle_area">
                <div class="findPW_area">
                    <div class="lock_img_area">
                        <img src="images\icon\lock.png">
                    </div>
                    <div class="info_text_top">
                        	�α��ο� ������ �ֳ���?
                    </div>
                    <div class="info_text_bottom">
                        	�̸��� �ּ�, ��ȭ��ȣ �Ǵ� ����� �̸���</br>
                        	�Է��Ͻø� ������ �ٽ� �׼����� �� �ִ�</br>
                        	��ũ�� �����帳�ϴ�.
                    </div>
                    <div class="find_clue">
                        <input type="text" placeholder="�̸���, ��ȭ��ȣ, ����� �̸�"/>
                    </div>
                    <div id="find_PW_btn">
                        <!-- todo : find_clue ���� ����������� ��Ȱ��ȭ�Ǿ��ִٰ� ���� �ԷµǸ� Ȱ��ȭ�ϱ� -->
                        <!-- todo : �α��� ��ũ ������ ��� �߰� -->
                        	�α��� ��ũ ������
                    </div>
                    <div id="reset_PW">
                        <!-- todo : ��й�ȣ �缳�� ��� �߰� -->
                        	��й�ȣ�� �缳���� �� ������?
                    </div>
                    <div class="join_info_text">
                        --------------------------- �Ǵ� ---------------------------
                    </div>
                    <div id="join_new" onclick="goPage('join');">
                        	�� ���� �����
                    </div>
                    <div id="back_to_login_btn" onclick="goPage('login');">
                        	�α������� ���ư���
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>