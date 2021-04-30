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

import com.timlin.demo.hotelchain.entity.Office;

@Repository
public class OfficeRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper<Office> mapper = new RowMapper<Office>(){  
        @Override  
        public Office mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Office e = new Office();  
            e.setOfficeId(rs.getInt("office_id"));  
            e.setAddress(rs.getString("address"));  
            e.setBrandId(rs.getInt("brand_id"));
            e.setEmail(rs.getString("email"));
            e.setPhoneNumber(rs.getString("phone_number"));
            e.setIsMain(rs.getBoolean("is_main"));
            return e;  
        }  
    };  
    
	public List<Office> findAllByBrandId(Integer brandId) {
        return jdbcTemplate.query(
        		"select * from office where brand_id=?",
        		new Object[] { brandId },
                new int[] { Types.INTEGER },
                mapper);
	}

	public Office save(Office office) {
        return null;
	}
	
	public Office create(Office office) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
            	"insert into office (address, email, is_main, phone_number, brand_id) values (?, ?, ?, ?, ?)",
               	new String[] { "office_id" }
            );
    		ps.setString(1, office.getAddress());
    		ps.setString(2, office.getEmail());
    		ps.setBoolean(3, office.getIsMain());
    		ps.setString(4, office.getPhoneNumber());
    		ps.setInt(5, office.getBrandId());
	        return ps;
	    }, keyHolder);

	    office.setOfficeId(keyHolder.getKey().intValue());
	    return office;
	}
}