package jmt.mvc.controller.review;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jmt.mvc.controller.Controller;
import jmt.mvc.controller.ModelAndView;
import jmt.mvc.model.dto.ReviewDTO;
import jmt.mvc.model.service.RestaurantService;
import jmt.mvc.model.service.RestaurantServiceImpl;

public class ReviewInsertController implements Controller
{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		RestaurantService restaurantService = new RestaurantServiceImpl();

		ModelAndView mv = new ModelAndView();

		String url = "suhyun_view/errorView/error.jsp";;

		String path = request.getServletContext().getRealPath("/reviewPics");
		int maxSize = 1024*1024*100; //100M
		String encoding = "UTF-8";
		
		MultipartRequest m = 
				new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//���۵� ������ �ޱ�
		String reviewTitle = m.getParameter("reviewTitle");
		String reviewContents = m.getParameter("reviewContents");
		System.out.println("reviewTitle" + reviewTitle);
		System.out.println("reviewContents" + reviewContents);
		
		String memberId = m.getParameter("memberId");
		int resId = Integer.parseInt(m.getParameter("resId"));
		String resName = m.getParameter("resName");
		String reviewIsLike = m.getParameter("reviewIsLike");	
		//String reviewIsLike = "true";
		System.out.println("reviewIsLike" + reviewIsLike);
		
		try
		{
			//��ȿ�� üũ
			if (reviewTitle == null || reviewTitle.equals("") || 
					reviewContents == null || reviewContents.equals("")
					)
			{
				throw new SQLException("�˸��� ���� �Էµ��� �ʾҽ��ϴ�. Ȯ�����ּ���.");
			}
			
			//reviewContents�ȿ� �ִ� �±׸� ���ڷ� ġȯ �۾�
			reviewContents.replaceAll("<", "&lt;");
			
				
			
			ReviewDTO reviewDTO = new ReviewDTO(reviewTitle, reviewContents, memberId, resId,
					resName, reviewIsLike);
			
			//���� ÷�� ���� üũ
			if (m.getFilesystemName("reviewImg1") != null) //���� ������
			{
				reviewDTO.setReviewImg1("reviewPics/"+(m.getFilesystemName("reviewImg1"))); //���� �̸�
			}
			if (m.getFilesystemName("reviewImg2") != null) //���� ������
			{
				reviewDTO.setReviewImg2("reviewPics/"+(m.getFilesystemName("reviewImg2"))); //���� �̸�
			}
			if (m.getFilesystemName("reviewImg3") != null) //���� ������
			{
				reviewDTO.setReviewImg3("reviewPics/"+(m.getFilesystemName("reviewImg3"))); //���� �̸�
			}
			
			int result = restaurantService.reivewInsert(reviewDTO);
			url = "/jmt?command=detail&resId="+resId;
			//mv.setRedirect(true);
			
		}catch (Exception e) 
		{
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		mv.setPath(url);
		return mv;

	}

}
