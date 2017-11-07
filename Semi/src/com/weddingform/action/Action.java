package com.weddingform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Action - interface

public interface Action {
	
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response);

}
