package com.portfolio.myfirst.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.myfirst.Mapper.FeedLikeVO;
import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.FeedReplyVO;
import com.portfolio.myfirst.Mapper.FollowVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Mapper.UserPhotoVO;

@Service("InstagramService")
public class InstagramServiceImpl implements InstagramService{
	@Autowired
	private InstagramDAOMybatis InstagramDAO;

	@Autowired
	private LoginDAOMybatis LoginDAO;
	
	//검색 데이터 가져오기
	public List<UserInfoVO> getSearchList() {
		return InstagramDAO.getSearchList();
	}
	
	//새 피드 저장하기
	public void setSaveNewFeed(FeedListVO vo) {
		InstagramDAO.setSaveNewFeed(vo);		
	}
	public int getNewFeedIdx(FeedListVO vo) {
		return InstagramDAO.getNewFeedIdx(vo);		
	}
	
	//새 피드 이미지 파일 저장하기
	public void setSaveNewFeedFile(FeedPhotoVO vo) {
		InstagramDAO.setSaveNewFeedFile(vo);		
	}
	
	//새 스토리 저장하기
	public void setSaveNewStory(StoryListVO vo) {
		InstagramDAO.setSaveNewStory(vo);		
	}
	public int getNewStoryIdx(StoryListVO vo) {
		return InstagramDAO.getNewStoryIdx(vo);		
	}

	//새 스토리 이미지 파일 저장하기
	public void setSaveNewStoryFile(StoryPhotoVO vo) {
		InstagramDAO.setSaveNewStoryFile(vo);		
	}
	
	//홈 스토리 리스트 가져오기
	public List<StoryListVO> getStoryList(StoryListVO vo) {
		return InstagramDAO.getStoryList(vo);		
	}
	
	//선택한 홈 스토리 팝업
	public List<StoryListVO> getStoryPopup(StoryListVO vo) {
		return InstagramDAO.getStoryPopup(vo);		
	}
		
	//홈 피드 리스트 가져오기
	public List<FeedListVO> getFeedList() {
		return InstagramDAO.getFeedList();		
	}
	
	//선택한 홈 피드 팝업
	public FeedListVO getFeedPopup(FeedListVO vo) {
		return InstagramDAO.getFeedPopup(vo);		
	}
	
	//피드 좋아요 처리
	public void setLikeClick(FeedLikeVO vo) {
		int type = vo.getLike_type();
		if(type != 1)
		{
			//좋아요 추가
			InstagramDAO.setInsertFeedLike(vo);
		}
		else
		{
			//좋아요 삭제
			InstagramDAO.setDeleteFeedLike(vo);
		}
	}
	
	//피드 댓글 저장
	public void setFeedReply(FeedReplyVO vo) {
		InstagramDAO.setFeedReply(vo);		
	}
	
	//프로필 피드 리스트 가져오기
	public List<FeedListVO> getProfileFeedList(FeedListVO vo) {
		return InstagramDAO.getProfileFeedList(vo);		
	}
	
	//프로필 상단 계정정보 가져오기
	public UserInfoVO getProfileInfo(UserInfoVO vo) {
		UserInfoVO result = InstagramDAO.getProfileInfo(vo);
		//피드 갯수 카운트
		result.setFeed_cnt(InstagramDAO.getProfileFeedCnt(vo));
		//팔로워 카운트
		result.setFollower_cnt(InstagramDAO.getProfileFollowerCnt(vo));
		//팔로우 카운트
		result.setFollow_cnt(InstagramDAO.getProfileFollowCnt(vo));
		return result;
	}
	
	//프로필 정보 저장(&수정)
	public String setProfileInfo(UserInfoVO vo) {
		
		String result = "OK";
		UserInfoVO check = null;
		
		//닉네임 중복체크
		if("Y".equals(vo.getUser_nickname_chg())) {
			check = LoginDAO.getNicknameDuplCheck(vo);
		}		
		
		if(check == null)
		{		
			InstagramDAO.setProfileInfo(vo);
		}
		else
		{
			result = "DUPL";
		}
		
		return result;
	}
	
	//프로필 이미지 저장
	public void setProfileImgFile(UserPhotoVO vo) {
		UserPhotoVO result = InstagramDAO.selectProfileImgFile(vo);
		if(result != null) {
			InstagramDAO.updateProfileImgFile(vo);	
		}
		else {
			InstagramDAO.insertProfileImgFile(vo);	
		}
			
	}
	
	//계정 팔로우 처리
	public void setfollow(FollowVO vo) {
		String type = vo.getFollow_yn();
		if("Y".equals(type))
		{
			//팔로우
			InstagramDAO.setInsertFollow(vo);
		}
		else
		{
			//언팔로우
			InstagramDAO.setDeleteFollow(vo);
		}
	}

	//팔로잉 리스트(팔로워) 가져오기
	public List<FollowVO> getfollowing(FollowVO vo) {
		return InstagramDAO.getfollowing(vo);		
	}
	//팔로워 리스트(팔로우) 가져오기
	public List<FollowVO> getfollower(FollowVO vo) {
		return InstagramDAO.getfollower(vo);		
	}
	
	//계정 추천 리스트 가져오기
	public List<UserInfoVO> getRecommendList(UserInfoVO vo) {
		return InstagramDAO.getRecommendList(vo);		
	}
	
	//피드 삭제
	public void deleteFeed(FeedListVO vo) {
		InstagramDAO.deleteFeed(vo);		
	}
	
	//스토리 삭제
	public void deleteStory(StoryListVO vo) {
		InstagramDAO.deleteStory(vo);		
	}
	
	//피드 댓글 삭제
	public void deleteReply(FeedReplyVO vo) {
		InstagramDAO.deleteReply(vo);		
	}
}
