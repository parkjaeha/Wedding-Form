package com.weddingform.eung.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.weddingform.util.DBConnector;
import com.weddingform.util.MakeRow;
import com.weddingform.util.WeddingSearch;

public class ExtraDAO {
	
	/*public static void main(String[] args) throws Exception {
		MakeRow makeRow = new MakeRow();
		makeRow.setStartRow(1);
		makeRow.setLastRow(6);
		
		WeddingSearch weddingSearch = new WeddingSearch();
		
		ArrayList<ExtraDTO> ar = new ExtraDAO().searchList(weddingSearch, makeRow);
		
		System.out.println(ar.size());
		
		for(ExtraDTO dto : ar) {
			System.out.println("------------------");
			System.out.println("ID:" + dto.getId());
			System.out.println(dto.getHall_name());
		}
		
	}*/
	
	public ArrayList<ExtraDTO> compareList(String str) throws Exception {
		Connection con = DBConnector.getConnect();
		ArrayList<ExtraDTO> ar = new ArrayList<>();
		
		String sql = "select * from extra where "+str;
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		ExtraDTO extraDTO = null;
		while(rs.next()) {
			extraDTO = new ExtraDTO();
			extraDTO.setId(rs.getString("id"));
			extraDTO.setRegion(rs.getString("region"));
			extraDTO.setType(rs.getString("type"));
			extraDTO.setMeal_cost(rs.getString("meal_cost"));
			extraDTO.setMeal_menu(rs.getString("meal_menu"));
			extraDTO.setVisitor(rs.getString("visitor"));
			extraDTO.setSubway(rs.getString("subway"));
			extraDTO.setHall_cost(rs.getString("hall_cost"));
			extraDTO.setHall_name(rs.getString("hall_name"));
			ar.add(extraDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	public ExtraDTO searchOne(ExtraDTO extraDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from extra where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, extraDTO.getId());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			extraDTO.setHall_cost(rs.getString("hall_cost"));
			extraDTO.setHall_name(rs.getString("hall_name"));
			extraDTO.setId(rs.getString("id"));
			extraDTO.setMeal_cost(rs.getString("meal_cost"));
			extraDTO.setMeal_menu(rs.getString("meal_menu"));
			extraDTO.setRegion(rs.getString("region"));
			extraDTO.setSubway(rs.getString("subway"));
			extraDTO.setType(rs.getString("type"));
			extraDTO.setVisitor(rs.getString("visitor"));
		}
		
		DBConnector.disConnect(rs, st, con);

		return extraDTO;
	}
	
	public int getTotal(WeddingSearch weddingSearch) throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select count(*) from extra where REGEXP_LIKE (region, ?) and REGEXP_LIKE (type, ?) and REGEXP_LIKE (meal_cost, ?) and REGEXP_LIKE (meal_menu, ?) and REGEXP_LIKE (subway, ?) and REGEXP_LIKE (visitor, ?) and REGEXP_LIKE (hall_name, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, weddingSearch.getRegion());
		st.setString(2, weddingSearch.getType());
		st.setString(3, weddingSearch.getMeal_cost());
		st.setString(4, weddingSearch.getMeal_menu());
		st.setString(5, weddingSearch.getSubway());
		st.setString(6, weddingSearch.getVisitor());
		st.setString(7, weddingSearch.getHall_name());
		
		ResultSet rs = st.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		return result;
	}
	
	public ArrayList<ExtraDTO> searchList(WeddingSearch weddingSearch, MakeRow makeRow, String sort) throws Exception {
		Connection con = DBConnector.getConnect();
		
		/*System.out.println("region: "+weddingSearch.getRegion());
		System.out.println("type: "+weddingSearch.getType());
		System.out.println("name: "+weddingSearch.getHall_name());
		System.out.println("meal_cost: "+weddingSearch.getMeal_cost());
		System.out.println(weddingSearch.getMeal_menu());
		System.out.println(weddingSearch.getSubway());
		System.out.println(weddingSearch.getVisitor());*/
		
		StringBuffer sb = new StringBuffer();
		sb.append("select * ");
		sb.append("from (select ROWNUM R, N.* ");
		sb.append("from (select * from extra ");
		sb.append("where REGEXP_LIKE (region, ?) and REGEXP_LIKE (type, ?) and REGEXP_LIKE (meal_cost, ?) ");
		sb.append("and REGEXP_LIKE (meal_menu, ?) and REGEXP_LIKE (subway, ?) and REGEXP_LIKE (visitor, ?) ");
		sb.append("and REGEXP_LIKE (hall_name, ?) order by "+sort+") N) ");
		sb.append("where R between ? and ?");

		PreparedStatement st = con.prepareStatement(sb.toString());
		
		/*st.setString(1, "|");
		st.setString(2, "|");
		st.setString(3, "|");
		st.setString(4, "|");
		st.setString(5, "|");
		st.setString(6, "|");
		st.setString(7, "|");*/
		
		st.setString(1, weddingSearch.getRegion());
		st.setString(2, weddingSearch.getType());
		st.setString(3, weddingSearch.getMeal_cost());
		st.setString(4, weddingSearch.getMeal_menu());
		st.setString(5, weddingSearch.getSubway());
		st.setString(6, weddingSearch.getVisitor());
		st.setString(7, weddingSearch.getHall_name());
		st.setInt(8, makeRow.getStartRow());
		st.setInt(9, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<ExtraDTO> ar = new ArrayList<>();
		ExtraDTO extraDTO = null;
		while(rs.next()) {
			extraDTO = new ExtraDTO();
			extraDTO.setId(rs.getString("id"));
			extraDTO.setRegion(rs.getString("region"));
			extraDTO.setType(rs.getString("type"));
			extraDTO.setMeal_cost(rs.getString("meal_cost"));
			extraDTO.setMeal_menu(rs.getString("meal_menu"));
			extraDTO.setVisitor(rs.getString("visitor"));
			extraDTO.setSubway(rs.getString("subway"));
			extraDTO.setHall_cost(rs.getString("hall_cost"));
			extraDTO.setHall_name(rs.getString("hall_name"));
			ar.add(extraDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
}
