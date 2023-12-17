package com.portfolio.myfirst.Service;

import java.util.List;

import com.portfolio.myfirst.Mapper.FeedLikeVO;
import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.FeedReplyVO;
import com.portfolio.myfirst.Mapper.FollowVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Mapper.UserPhotoVO;

public interface InstagramService {
	//검색 데이터 가져오기
	public List<UserInfoVO> getSearchList();
	
	//새 피드 저장하기
	public void setSaveNewFeed(FeedListVO vo);
	public int getNewFeedIdx(FeedListVO vo);
	
	//새 피드 이미지 파일 저장하기
	public void setSaveNewFeedFile(FeedPhotoVO vo);
	
	//새 스토리 저장하기
	public void setSaveNewStory(StoryListVO vo);
	public int getNewStoryIdx(StoryListVO vo);
	
	//새 스토리 이미지 파일 저장하기
	public void setSaveNewStoryFile(StoryPhotoVO vo);
	
	//홈 스토리 리스트 가져오기
	public List<StoryListVO> getStoryList(StoryListVO vo);
	
	//선택한 홈 스토리 팝업
	public List<StoryListVO> getStoryPopup(StoryListVO vo);
		
	//홈 피드 리스트 가져오기
	public List<FeedListVO> getFeedList();
	
	//선택한 홈 피드 팝업
	public FeedListVO getFeedPopup(FeedListVO vo);
	
	//피드 좋아요 처리
	public void setLikeClick(FeedLikeVO vo);
	
	//피드 댓글 저장
	public void setFeedReply(FeedReplyVO vo);
	
	//프로필 정보 저장(&수정)
	public String setProfileInfo(UserInfoVO vo);
	
	//프로필 이미지 저장
	public void setProfileImgFile(UserPhotoVO vo);
	
	//프로필 피드 리스트 불러오기
	public List<FeedListVO> getProfileFeedList(FeedListVO vo);
	
	//프로필 상단 계정정보 가져오기
	public UserInfoVO getProfileInfo(UserInfoVO vo);
	
	//팔로우 기능 실행
	public void setfollow(FollowVO vo);

	//팔로잉 리스트 가져오기
	public List<FollowVO> getfollowing(FollowVO vo);
	//팔로워 리스트 가져오기
	public List<FollowVO> getfollower(FollowVO vo);
	
}
