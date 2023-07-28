package com.proj.salad.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.salad.mypage.service.MyPageService;
import com.proj.salad.user.vo.UserVO;


@Controller("myPageController")
public class MyPageControllerImpl implements MyPageController {

	@Autowired  //의존성주입
	MyPageService myPageService;
	@Autowired //의존성주입
	UserVO userVO;

	//회원정보상세
	@Override
	@RequestMapping(value="/mypage/myDetailInfo.do",method=RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		
		ModelAndView mav = new ModelAndView(viewName);
		//mav.setViewName(viewName);
		System.out.println(viewName);
		return mav;
	}

	//회원정보수정
	//attribute는 수정할 회원 정보 속성을 저장하고 value는 회원 정보의 속성 값을 저장
	@Override
	@RequestMapping(value="/mypage/modifyMyInfo.do",method=RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
            																@RequestParam("value")  String value, 
            																HttpServletRequest request,
            																HttpServletResponse response) throws Exception {
		
		//System.out.println("modifyMyInfo");
		
		Map<String, String> userMap = new HashMap<String, String>();
		String val[]=null; //배열 초기화
		
		HttpSession session = request.getSession();  //세션 사용
		userVO = (UserVO)session.getAttribute("user");
		String userId = userVO.getUserId();
		
		if(attribute.equals("email")) {
			val=value.split(",");  //split()은 지정한 문자를 기준으로 문자열을 잘라 배열로 반환한다.
			userMap.put("userEmail", val[0]);
			userMap.put("emailsts_yn", val[1]);
		}else if(attribute.equals("phone")) {
			val=value.split(",");  // ','를 기준으로 문자열을 자른다.
			userMap.put("userPhone", val[0]);
			userMap.put("smssts_yn", val[1]);
		}else if(attribute.equals("address")) {
			val=value.split(",");
			userMap.put("userAddress1", val[0]);
			userMap.put("userAddress2", val[1]);
		}else {
			userMap.put(attribute, value);
		}
		
		userMap.put("userId", userId);
		
		//수정된 회원정보를 다시 세션에 저장한다.
		userVO = (UserVO) myPageService.modifyMyInfo(userMap);
		session.removeAttribute("user");
		session.setAttribute("user", userVO);
		
		System.out.println("userMap:"+userMap);
		System.out.println("userVO:"+userVO);
		
		String message = null;  //변수 초기화
		ResponseEntity resEntity = null;  //변수 초기화
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";  //정보 수정 되었을 때 나올 메세지
		//message 변수에는 클라이언트로 다시 전송될 응답으로 다시 보내려는 메시지 또는 데이터이며 HttpStatus.OK는 HttpStatus의 Http 상태 코드를 나타내는 클래스이다.
		resEntity = new ResponseEntity(message,responseHeaders,HttpStatus.OK); 
		
		return resEntity;
	}
	
	//회원정보탈퇴
	@Override
	@RequestMapping(value="/mypage/removeUser.do",method=RequestMethod.GET)
	public ModelAndView removeUser(@RequestParam("userId")String userId, 
																				HttpServletRequest request, HttpServletResponse response)
																				throws Exception {
		myPageService.removeUser(userId);
		ModelAndView mav = new ModelAndView("redirect:/user/logout.do"); //로그아웃 하여 메인페이지로 감
		return mav;
	}


	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}
