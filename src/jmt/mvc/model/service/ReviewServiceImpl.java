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
	public int reviewInsert(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reivewUpdate(ReviewDTO reviewDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reviewDelete(int reviewID) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
