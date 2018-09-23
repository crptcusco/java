package com.lasbambas.mantto.data;

import java.util.Date;
import java.util.List;

public interface HorometroDao {
	public Date getCurrentData();
	public long getSizeRecords();
	public List<Object> getPageData(int nPage, int rgPorPage, String colOrder,int typeOrder);
}
