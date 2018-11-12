package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import jmt.mvc.model.dao.RestaurantDAO;
import jmt.mvc.model.dao.RestaurantDAOImpl;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public class RestaurantServiceImpl implements RestaurantService
{
	private static RestaurantDAO dao = new RestaurantDAOImpl();
	
	@Override
	public List<RestaurantDTO> selectAll() throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantDTO selectById(int resId) throws SQLException
	{
		RestaurantDTO dto = dao.selectById(resId);
		if (dto == null)
		{
			throw new SQLException("������ �󼼺��� �ε忡 �����Ͽ����ϴ�.");
		}
		return dto;
	}

	@Override
	public List<RestaurantDTO> selectByCategory(String categroy) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBookMark(int resId, String memberId) throws SQLException
	{
		int result = dao.insertBookMark(resId, memberId);
		if(result == 0)
			throw new SQLException("���ã�� ��Ͽ� �����Ͽ����ϴ�.");
		
		return result;
	}
	
	@Override
	public int deleteBookMark(int resId, String memberId) throws SQLException
	{
		int result = dao.deleteBookMark(resId, memberId);
		if(result == 0)
			throw new SQLException("���ã�� ������ �����Ͽ����ϴ�.");
		
		return result;
	}
	
	@Override
	public boolean bookMarkYesOrNo (int resId, String memberId) throws SQLException
	{
		boolean result = dao.bookMarkYesOrNo(resId, memberId);
		
		return result;
	}

	@Override
	public List<ReviewDTO> recentOrderReview(int resId) throws SQLException
	{
		List<ReviewDTO> list = dao.recentOrderReview(resId);
		
		return list;
	}
	
	@Override
	public List<ReviewDTO> recommendOrderReview(int resId) throws SQLException
	{
		List<ReviewDTO> list = dao.recommendOrderReview(resId);
		
		return list;
	}
	
	@Override
	public int resLikeAcc(int resId) throws SQLException
	{
		int result = dao.resLikeAcc(resId);
		
		return result;
	}

	@Override
	public List<String> selectImgFromReview(int resId) throws SQLException
	{
		List<String> list = dao.selectImgFromReview(resId);
		
		return list;
	}

	@Override
	public int reviewLikeAmount(int reviewId) throws SQLException
	{

		int result = dao.reviewLikeAmount(reviewId);
		/*if(result == 0)
			throw new SQLException("���ƿ� �� �������⿡ �����Ͽ����ϴ�.");*/ 
		
		return result;
	}

	@Override
	public int insertRecommend(int reviewId, String memberId) throws SQLException
	{
		int result = dao.insertRecommend(reviewId, memberId);
		if(result == 0)
			throw new SQLException("���� ���ƿ信 �����Ͽ����ϴ�.");
		
		return result;
	}

	@Override
	public int deleteRecommend(int reviewId, String memberId) throws SQLException
	{
		int result = dao.deleteRecommend(reviewId, memberId);
		if(result == 0)
			throw new SQLException("���� ���ƿ� ��� ��ɿ� �����Ͽ����ϴ�.");
		
		return result;
	}

	@Override
	public boolean reviewLikeYesOrNo(int reviewId, String memberId) throws SQLException
	{
		boolean result = dao.reviewLikeYesOrNo(reviewId, memberId);
		
		return result;
	}

	@Override
	public int reivewInsert(ReviewDTO reviewDTO) throws SQLException
	{
		int result = dao.reivewInsert( reviewDTO);
		if(result == 0)
			throw new SQLException("���� ��Ͽ� �����Ͽ����ϴ�.");
		
		return result;
	}
}
