package jmt.mvc.controller;

/**
 * 결과뷰 정보와 이동방식 설정
 * */
public class ModelAndView {
	private String path; /**이동경로*/
	private boolean isRedirect;/**true일때 redirect false일때 forward*/
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
