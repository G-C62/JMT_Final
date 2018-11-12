package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dao.ReviewDAO;
import jmt.mvc.model.dao.ReviewDAOImpl;
import jmt.mvc.model.dto.ReviewDTO;



public class ReviewServiceImpl implements ReviewService {
   
   private static ReviewDAO reviewDAO  = new ReviewDAOImpl();

   @Override
   public List<ReviewDTO> myReviewSelectAll(String id) throws SQLException {
      List<ReviewDTO> list = reviewDAO.myReviewSelectAll(id);
      return list;
   }

   @Override
	public int reviewLikeAmount(int reviewId) throws SQLException
	{

		int result = reviewDAO.reviewLikeAmount(reviewId);
		if(result == 0)
			throw new SQLException("좋아요 수 가져오기에 실패하였습니다.");
		
		return result;
	}
   
   @Override
   public int reviewInsert(ReviewDTO reviewDTO) throws SQLException {
	   int result = reviewDAO.reviewInsert(reviewDTO);
		if(result==0)throw new SQLException("등록되지 않았습니다.");
		return result;
   }
   
   public ReviewDTO selectByReviewId(int reviewId)
			throws SQLException{
		 //글번호에 해당하는 게시물 검색
	   ReviewDTO reviewDTO =  reviewDAO.selectByReviewId(reviewId);
		if(reviewDTO==null)throw new SQLException(reviewId+" 해당하는 아이디가 없습니다.");
		return reviewDTO;
	}

   @Override
   public int reivewUpdate(ReviewDTO reviewDTO) throws SQLException {
      int result = 0;
      result = reviewDAO.reivewUpdate(reviewDTO);
      if(result==0)
			 throw new SQLException("수정되지 않았습니다.");	  
      return result;
   }

   @Override
   public int reviewDelete(int reviewId) throws SQLException {
	   
	   int result = reviewDAO.reviewDelete(reviewId);
		  if(result==0)
			  throw new SQLException("삭제되지 않았습니다.");
		  return result;
   }

}
