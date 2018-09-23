package com.lasbambas.mantto.data;

import java.util.List;

import com.lasbambas.mantto.model.Application;
import com.lasbambas.mantto.model.UserMantto;

public interface UserManttoDao {
	public UserMantto findById(Long id);
	public UserMantto findByUserName(String userName);
	public UserMantto findByEmail(String email);
	public UserMantto findByUserPass(String userName,String pass);
	public List<Application> getApplications(UserMantto userMantto);
    public List<UserMantto> findAllOrderedByName();

    public void register(UserMantto userMantto);
    
}
