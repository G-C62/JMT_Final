package jmt.mvc.model.dto;

public class RestaurantDTO
{
	private int resId;
	private String resName;
	private String resChainName;
	private String resCategory;
	private String resSubCategory;
	private String resDong;
	private String resAddr;
	private String resFloor;
	private String resHo;
	private double resLong;
	private double resLat;

	public RestaurantDTO()
	{

	}

	public RestaurantDTO(int resId, String resName, String resChainName, String resCategory, String resSubCategory,
			String resDong, String resAddr, String resFloor, String resHo, double resLong, double resLat)
	{
		super();
		this.resId = resId;
		this.resName = resName;
		this.resChainName = resChainName;
		this.resCategory = resCategory;
		this.resSubCategory = resSubCategory;
		this.resDong = resDong;
		this.resAddr = resAddr;
		this.resFloor = resFloor;
		this.resHo = resHo;
		this.resLong = resLong;
		this.resLat = resLat;
	}

	public int getResId()
	{
		return resId;
	}

	public void setResId(int resId)
	{
		this.resId = resId;
	}

	public String getResName()
	{
		return resName;
	}

	public void setResName(String resName)
	{
		this.resName = resName;
	}

	public String getResChainName()
	{
		return resChainName;
	}

	public void setResChainName(String resChainName)
	{
		this.resChainName = resChainName;
	}

	public String getResCategory()
	{
		return resCategory;
	}

	public void setResCategory(String resCategory)
	{
		this.resCategory = resCategory;
	}

	public String getResSubCategory()
	{
		return resSubCategory;
	}

	public void setResSubCategory(String resSubCategory)
	{
		this.resSubCategory = resSubCategory;
	}

	public String getResDong()
	{
		return resDong;
	}

	public void setResDong(String resDong)
	{
		this.resDong = resDong;
	}

	public String getResAddr()
	{
		return resAddr;
	}

	public void setResAddr(String resAddr)
	{
		this.resAddr = resAddr;
	}

	public String getResFloor()
	{
		return resFloor;
	}

	public void setResFloor(String resFloor)
	{
		this.resFloor = resFloor;
	}

	public String getResHo()
	{
		return resHo;
	}

	public void setResHo(String resHo)
	{
		this.resHo = resHo;
	}

	public double getResLong()
	{
		return resLong;
	}

	public void setResLong(double resLong)
	{
		this.resLong = resLong;
	}

	public double getResLat()
	{
		return resLat;
	}

	public void setResLat(double resLat)
	{
		this.resLat = resLat;
	}

}
