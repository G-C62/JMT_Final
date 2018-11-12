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
			throw new SQLException("���ƿ� �� �������⿡ �����Ͽ����ϴ�.");
		
		return result;
	}
   
   @Override
   public int reviewInsert(ReviewDTO reviewDTO) throws SQLException {
	   int result = reviewDAO.reviewInsert(reviewDTO);
		if(result==0)throw new SQLException("��ϵ��� �ʾҽ��ϴ�.");
		return result;
   }
   
   public ReviewDTO selectByReviewId(int reviewId)
			throws SQLException{
		 //�۹�ȣ�� �ش��ϴ� �Խù� �˻�
	   ReviewDTO reviewDTO =  reviewDAO.selectByReviewId(reviewId);
		if(reviewDTO==null)throw new SQLException(reviewId+" �ش��ϴ� ���̵� �����ϴ�.");
		return reviewDTO;
	}

   @Override
   public int reivewUpdate(ReviewDTO reviewDTO) throws SQLException {
      int result = 0;
      result = reviewDAO.reivewUpdate(reviewDTO);
      if(result==0)
			 throw new SQLException("�������� �ʾҽ��ϴ�.");	  
      return result;
   }

   @Override
   public int reviewDelete(int reviewId) throws SQLException {
	   
	   int result = reviewDAO.reviewDelete(reviewId);
		  if(result==0)
			  throw new SQLException("�������� �ʾҽ��ϴ�.");
		  return result;
   }

}
