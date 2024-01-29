package com.portfolio.myfirst.Mapper;
import lombok.Data;

@Data
public class UserInfoVO {
	private int user_idx;
	private String user_id;	
	private String user_name;
	private String user_nickname;
	private String user_pw;	
	private String user_intro;	
	private String user_info;
	
	//�����ʿ��� �ȷο� ���� �������� ���� �߰�
	private int session_user_idx;
	private int follower_user_idx;
	
	//������ �̸�&�г���&�н����� ���氪 �ִ��� chk
	private String user_name_chg;
	private String user_nickname_chg;	
	private String user_pw_chg;
	
	//������ ���� ���ϸ� ��������
	private String file_name;	
	
	//������ ��� �ǵ� ����, �ȷο�&�ȷο� �� ī��Ʈ
	private int feed_cnt;
	private int follow_cnt;
	private int follower_cnt;
}
 