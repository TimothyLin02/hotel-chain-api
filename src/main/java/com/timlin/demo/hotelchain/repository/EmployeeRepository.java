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

import com.timlin.demo.hotelchain.entity.Employee;

@Repository
public class EmployeeRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper<Employee> mapper = new RowMapper<Employee>(){  
        @Override  
        public Employee mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Employee e = new Employee();
            e.setEmployeeId(rs.getInt("employee_id"));
            e.setHotelId(rs.getInt("hotel_id"));
            e.setManagerId(rs.getInt("manager_id"));
            e.setFirstName(rs.getString("first_name"));
            e.setMiddleName(rs.getString("middle_name"));
            e.setLastName(rs.getString("last_name"));
            e.setHomeAddress(rs.getString("home_address"));
            e.setSin(rs.getString("sin"));
            e.setUserName(rs.getString("user_name"));
            e.setPassword(rs.getString("password"));
            e.setRole(rs.getString("role"));
            e.setSalary(rs.getDouble("salary"));
            if (e.getManagerId() == 0) {
            	e.setManagerId(null);
            }
            return e;  
        }  
    };
    

	public List<Employee> findAllByHotelId(Integer hotelId) {
		return jdbcTemplate.query(
                "select * from employee where hotel_id = ? order by employee_id",
                new Object[] {hotelId},
                new int[] {Types.INTEGER},
                mapper);
	}


	public List<Employee> findAll() {
		return jdbcTemplate.query("select * from employee order by employee_id", mapper);
	}

	public Employee save(Employee employee) {
        return null;
	}

	public Employee create(Employee employee) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
               	"insert into employee (home_address, first_name, last_name, middle_name, password, hotel_id, sin, user_name, salary, manager_id, role) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
               	new String[] { "employee_id" }
            );
	        ps.setString(1, employee.getHomeAddress());
	        ps.setString(2, employee.getFirstName());
	        ps.setString(3, employee.getLastName());
	        ps.setString(4, employee.getMiddleName());
	        ps.setString(5, employee.getPassword());
	        ps.setInt(6, employee.getHotelId());
	        ps.setString(7, employee.getSin());
	        ps.setString(8, employee.getUserName());
	        ps.setDouble(9, employee.getSalary());
	        if (employee.getManagerId() == null || employee.getManagerId() == 0) {
		        ps.setNull(10, Types.INTEGER);
	        }
	        else {
		        ps.setInt(10, employee.getManagerId());
	        }
	        ps.setString(11, employee.getRole());
	        return ps;
	    }, keyHolder);

	    employee.setEmployeeId(keyHolder.getKey().intValue());
	    return employee;
	}


	public Employee findById(Integer id) {
		List<Employee> lst = jdbcTemplate.query(
                "select * from employee where employee_id = ?",
                new Object[]{id},
                new int[] {Types.INTEGER},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}
}