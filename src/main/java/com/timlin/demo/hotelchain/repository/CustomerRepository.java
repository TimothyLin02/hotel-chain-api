package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.Customer;

@Repository
public class CustomerRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Customer> mapper = new RowMapper<Customer>(){  
        @Override  
        public Customer mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Customer e = new Customer();
            e.setCustID(rs.getInt("custid"));
            e.setBrandId(rs.getInt("brand_id"));
            e.setFirstName(rs.getString("first_name"));
            e.setLastName(rs.getString("last_name"));
            e.setAddress(rs.getString("address"));
            e.setRegistrationDate(rs.getDate("registration_date"));
            e.setSin(rs.getString("sin"));
            e.setUserName(rs.getString("user_name"));
            e.setPassword(rs.getString("password"));
            e.setPhoneNumber(rs.getString("phone_number"));
            return e;  
        }  
    };
    
	public List<Customer> findAll() {
        return jdbcTemplate.query("SELECT * FROM customer order by custid", mapper);
	}

	public Customer findById(Integer id) {
		List<Customer> lst = jdbcTemplate.query(
                "select * from customer where custid = ?",
                new Object[]{id},
                new int[] {Types.INTEGER},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}

	public Customer save(Customer customer) {
        return null;
	}
	
	public Customer create(Customer customer) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
               	"insert into customer (address, first_name, last_name, password, registration_date, sin, user_name, brand_id, phone_number) values (?, ?, ?, ?, ?, ?, ?, ?, ?)",
               	new String[] { "custid" }
            );
           	ps.setString(1, customer.getAddress());
           	ps.setString(2, customer.getFirstName());
           	ps.setString(3, customer.getLastName());
           	ps.setString(4, customer.getPassword());
           	ps.setDate(5, new java.sql.Date(customer.getRegistrationDate().getTime()));
           	ps.setString(6, customer.getSin());
           	ps.setString(7, customer.getUserName());
           	if (customer.getBrandId() == null) {
           		ps.setNull(8, Types.INTEGER);
           	}
           	else {
               	ps.setInt(8, customer.getBrandId());
           	}
           	ps.setString(9, customer.getPhoneNumber());
	        return ps;
	    }, keyHolder);

	    customer.setCustID(keyHolder.getKey().intValue());
	    return customer;
	}
}
