package com.lasbambas.mantto.controller.respons;

import java.util.List;

public class DataTableResponse {
	public int draw;
	public long recordsTotal;
	public long recordsFiltered;
	public List<Object> data;
	public DataTableResponse(int draw, long recordsTotal, long recordsFiltered,
			List<Object> data) {
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
	}
	
	
}
