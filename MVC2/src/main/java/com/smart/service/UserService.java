package com.smart.service;

import com.smart.dao.LoginLogDao;
import com.smart.dao.UserDao;
import com.smart.domain.LoginLog;
import com.smart.domain.User;
//import com.smart.web.DataList;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    private UserDao userDao;
    private LoginLogDao loginLogDao;

    @Autowired
    public void setUserDao(UserDao userDao){
        this.userDao = userDao;
    }

    @Autowired
    public void setLoginLogDao(LoginLogDao loginLogDao){
        this.loginLogDao = loginLogDao;
    }

    public boolean hasMatchUser(String userName, String password){
        int matchCount = userDao.getMatchCount(userName, password);
        return matchCount > 0;
    }
    
    public boolean hasMatchUser(String userName){
        int matchCount = userDao.getMatchCount(userName);
        return matchCount > 0;
    }

    public User findUserByUserName(String userName){
        return userDao.findUserByUserName(userName);
    }
    
    
    /*
    @Transactional
    public void loginSuccess(User user){
        user.setCredits(5+user.getCredits());
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId(user.getUserId());
        loginLog.setIp(user.getLastIP());
        loginLog.setLoginDate(user.getLastVisit());
      userDao.updateLogeinInfo(user);
      loginLogDao.insertLoginLog(loginLog);
    }
	*/
	public List<User> findAll() {
		return userDao.findAllData();
	}

	public void editUserData(User user) {
		userDao.editDataBase(user);
	}

	public void deleteUserData(String account) {
		userDao.deleteDataBase(account);
	}

	public void createAccount(User user) {
		userDao.addDataBaes(user);
	}

	
}