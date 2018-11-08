package jmt.mvc.model.service;

import java.sql.SQLException;
import java.util.List;

import jmt.mvc.model.dao.RestaurantDAO;
import jmt.mvc.model.dao.RestaurantDAOImpl;
import jmt.mvc.model.dto.RestaurantDTO;
import jmt.mvc.model.dto.ReviewDTO;

public class RestaurantServiceImpl implements RestaurantService
{
	private static RestaurantDAO dao = new RestaurantDAOImpl();
	
	@Override
	public List<RestaurantDTO> selectAll()
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
			throw new SQLException("음식점 상세보기 로드에 실패하였습니다.");
		}
		return dto;
	}

	@Override
	public List<RestaurantDTO> selectByCategory(String categroy)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectBySubCategory(String subCategroy)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByName(String name)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestaurantDTO> selectByDong(String dong)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBookMark(int resId, String memberId)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDTO selectReview(int resId)
	{
		// TODO Auto-generated method stub
		return null;
	}

}
