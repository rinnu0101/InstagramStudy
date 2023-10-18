package com.portfolio.myfirst.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//��ü �ڵ� ����
//com.springbook.view�� ���ԵǴ� ��ü���� ���ܰ� �߻��� ��� �ڵ� ȣ��
@ControllerAdvice("com.portfolio.myfirst")
public class CommonExceptionHandler {
	//@ExceptionHandler�� ������ ���뿡 ���� ���ܿ� ���� �޼ҵ� �ڵ� ȣ��
	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handlerArthmeticException(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.setViewName("/common/arithmeticError.jsp");
		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleNullPointerException(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.setViewName("/common/nullPointerError.jsp");
		return mav;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.setViewName("/common/error.jsp");
		return mav;
	}
}
