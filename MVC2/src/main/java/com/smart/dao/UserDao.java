package com.smart.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.smart.domain.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }


    /**
     * 用帳號、密碼尋找是否有此用戶
     * @param userName 帳號
     * @param password 密碼
     * @return 尋找到的數量
     */
    public int getMatchCount(String userName,String password){
        String sqlStr = "SELECT count(*) FROM userdata WHERE account=? and passwd=?";
        return jdbcTemplate.queryForObject(sqlStr, new Object[]{userName, password},Integer.class);
    }
    
    /**
     * 用帳號尋找是否有此用戶
     * @param userName 帳號
     * @return 尋找到的數量
     */
    public int getMatchCount(String userName){
        String sqlStr = "SELECT count(*) FROM userdata WHERE account=?";
        return jdbcTemplate.queryForObject(sqlStr, new Object[]{userName},Integer.class);
    }
    
    private final static String MATCH_COUNT_SQL = "SELECT * FROM userdata WHERE account=?";
    /**
     * 通过用户名获得用户对象
     * @param userName 用户名
     * @return user对象
     */
    public User findUserByUserName(final String userName){
        final User user = new User();
        jdbcTemplate.query(MATCH_COUNT_SQL, new Object[]{userName},
                new RowCallbackHandler() {
                    public void processRow(ResultSet rs) throws SQLException {
                        user.setAccount(rs.getString("account"));
                        user.setPasswd(rs.getString("passwd"));
                        user.setName(userName);
                        user.setEmail(rs.getString("email"));
                        user.setGender(rs.getString("gender"));
                        user.setAge(rs.getInt("age"));
                    }
                });
        return user;
    }
    /*
     * 所有資料
     */    
    public List<User> findAllData() {
    	String sql = "select * from userdata";
    	return jdbcTemplate.query(sql, new userMapper());
	}
    class userMapper implements RowMapper<User> {
    	 
    	  @Override
    	  public User mapRow(ResultSet rs, int rowNum) throws SQLException {
    	    // TODO Auto-generated method stub
    		User user = new User();
    		user.setAccount(rs.getString("account"));
            user.setPasswd(rs.getString("passwd"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setGender(rs.getString("gender"));
            user.setAge(rs.getInt("age"));
    		
    	 
    	    return user;
    	  }
    	 
    }
    private final static String UPDATE_USER_DATA_SQL = "UPDATE userdata SET passwd=?,email=?,gender=?,age=? WHERE account=?";
    /*
     * 修改用戶資料
     */
	public void editDataBase(User user) {
		jdbcTemplate.update(UPDATE_USER_DATA_SQL, new Object[]{user.getPasswd(), user.getEmail(), user.getGender(),user.getAge(), user.getAccount()});
	}
	
	private final static String DELETE_USER_DATA_SQL = "DELETE FROM userdata WHERE account=?";
	 /*
     * 刪除用戶資料
     */
	public void deleteDataBase(String account) {
		jdbcTemplate.update(DELETE_USER_DATA_SQL, account);
	}

	private final static String ADD_USER_DATA_SQL = "INSERT INTO userdata (account, passwd, name, email, gender, age) VALUES (?, ?, ?, ?, ?, ?);";
	/*
     * 新增用戶資料
     */
	public void addDataBaes(User user) {
		jdbcTemplate.update(ADD_USER_DATA_SQL, new Object[]{user.getAccount(),user.getPasswd(),user.getName(), user.getEmail(), user.getGender(),user.getAge()});
	}
}