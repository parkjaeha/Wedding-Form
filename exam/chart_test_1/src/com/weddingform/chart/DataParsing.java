package com.weddingform.chart;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class DataParsing {
	
	public static void main(String[] args) {
		ArrayList<String> ar = new DataParsing().getParse("total");
		
		for(String s : ar) {
			System.out.println(s);
		}
	}
	
	public ArrayList<String> getParse(String fileName) {
		File file = new File("E:\\Wedding-Form\\SEMI_DATA\\data\\TXT", fileName+".txt");
		FileReader fr = null;
		BufferedReader br = null;
		String str = null;
		ArrayList<String> ar = new ArrayList<>();
		
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
		
			while(true) {
				str = br.readLine();
				if(str == null) {
					break;
				}
				
				StringTokenizer st = new StringTokenizer(str, "\t,\"");
				while (st.hasMoreTokens()) {
					ar.add(st.nextToken().trim());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return ar;
	}

}
