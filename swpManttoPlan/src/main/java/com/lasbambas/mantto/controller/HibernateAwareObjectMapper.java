package com.lasbambas.mantto.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

@SuppressWarnings("serial")
public class HibernateAwareObjectMapper extends ObjectMapper {
	 public HibernateAwareObjectMapper() {
	        registerModule(new Hibernate4Module());
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        setDateFormat(df);
	    }
}
