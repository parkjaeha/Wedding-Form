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
	
	public int getTotal() throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql = "select count(*) from extra";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		return result;
	}
	
	public ArrayList<ExtraDTO> searchList(WeddingSearch weddingSearch, MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		
		StringBuffer sb = new StringBuffer();
		sb.append("select * ");
		sb.append("from (select ROWNUM R, N.* ");
		sb.append("from (select * from extra ");
		sb.append("where region like ? and type like ? and MEAL_COST like ? and MEAL_MENU like ? and SUBWAY like ? and visitor like ? and hall_name like ?) N) ");
		sb.append("where R between ? and ?");

		PreparedStatement st = con.prepareStatement(sb.toString());
		
		st.setString(1, "%"+ "" +"%");
		st.setString(2, "%"+"" +"%");
		st.setString(3, "%"+ "" +"%");
		st.setString(4, "%"+ "" +"%");
		st.setString(5, "%"+ "" +"%");
		st.setString(6, "%"+"" +"%");
		st.setString(7, "%"+ "" +"%");
		
		st.setString(1, "%"+ weddingSearch.getRegion() +"%");
		st.setString(2, "%"+ weddingSearch.getType() +"%");
		st.setString(3, "%"+ weddingSearch.getMeal_cost() +"%");
		st.setString(4, "%"+ weddingSearch.getMeal_menu() +"%");
		st.setString(5, "%"+ weddingSearch.getSubway() +"%");
		st.setString(6, "%"+ weddingSearch.getVisitor() +"%");
		st.setString(7, "%"+ weddingSearch.getHall_name() +"%");
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
			extraDTO.setMeal_cost(rs.getInt("meal_cost"));
			extraDTO.setMeal_menu(rs.getString("meal_menu"));
			extraDTO.setVisitor(rs.getInt("visitor"));
			extraDTO.setSubway(rs.getString("subway"));
			extraDTO.setHall_cost(rs.getInt("hall_cost"));
			extraDTO.setHall_name(rs.getString("hall_name"));
			ar.add(extraDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
