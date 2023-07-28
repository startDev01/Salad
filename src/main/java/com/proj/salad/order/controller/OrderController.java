package com.proj.salad.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.salad.order.vo.OrderMenuVO;
import com.proj.salad.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.proj.salad.cart.vo.CartListVO;
import com.proj.salad.order.service.OrderServiceImpl;
import com.proj.salad.user.vo.UserVO;

/* Order Controller 조상현 추가 */
@Controller
public class OrderController {
	@Autowired
	OrderServiceImpl orderService;
	@Autowired
	UserVO userVO;
	@Autowired
	OrderMenuVO orderMenuVO;

	@RequestMapping(value = {  "/order" }, method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String userId = null;

		// 세션값 가져오기
		HttpSession session = request.getSession();

		UserVO userVO = (UserVO) session.getAttribute("user");
		userId = userVO.getUserId();

		List<CartListVO> orderList = orderService.getOrderList(userId);

		System.out.println("orderList= "+ orderList);

		ModelAndView mav = new ModelAndView();
		mav.addObject("userVO", userVO);
		mav.addObject("orderList", orderList);
		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping(value = "/orderDone", method = RequestMethod.POST)
	public ModelAndView orderDone(OrderVO orderVO,
								  HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);

		System.out.println("결제완료 페이지 출력");
		System.out.println("받아온 orderVO 객체 : " + orderVO);

		// order 카드번호 4개 받아오기
		if(request.getParameter("cardNum1") != null){
			String orderCardNum = "";
			for(int i = 1; i <= 4; i++) {
				// 카드번호 4개 한 줄로 합치기
				orderCardNum += request.getParameter("cardNum" + String.valueOf(i));
				System.out.println("카드번호 : " + orderCardNum);
			}
			// VO 지정
//			orderVO.setAccountNumber(orderCardNum);

		}

		String userId = null;

		// 세션값 가져오기
		HttpSession session = request.getSession();

		UserVO userVO = (UserVO) session.getAttribute("user");
		userId = userVO.getUserId();

		orderVO.setUserId(userId);
		System.out.println("세션의 userId : " + orderVO);
		System.out.println(orderVO.getOrdererName());

		// 결제 테이블 insert 서비스
		orderService.newOrder(orderVO);

		// 결제하려는 제품 개수
		int prodCount = Integer.parseInt(request.getParameter("listCount"));
		System.out.println("prodCount : " + prodCount);

		// 제품 개수만큼 order_menu insert 서비스 실행
		for(int i = 0; i < prodCount; i++) {
			// 제품 이름
			String prodName = request.getParameter("CL_prodName" + String.valueOf(i));

			// 제품 개수
			String tempCartCount = request.getParameter("CL_cartCount" + String.valueOf(i));
			int cartCount = Integer.parseInt(tempCartCount);

			// 제품 가격(미사용)
			String prodPrice = request.getParameter("CL_prodPrice" + String.valueOf(i));

			// orderMenuVO에 값 저장
			
			// 현재 안쓰는 코드 임시 비활성화
//			orderMenuVO.setOrderNum(orderVO.getOrderNum());
			orderMenuVO.setMenuName(prodName);
			orderMenuVO.setMenuCount(cartCount);
			orderMenuVO.setUserId(userId);

			// 주문 메뉴 insert 서비스 실행부분
			orderService.newOrderMenu(orderMenuVO);

		}

		// 주문, 주문 메뉴 서비스 실행후 장바구니 데이터 삭제
		orderService.deleteCartList(orderVO.getUserId());


		System.out.println("최종 orderVO 객체 : " + orderVO);

		ModelAndView mav = new ModelAndView();

		mav.setViewName(viewName);

		return mav;
	}

	@RequestMapping(value = {  "/payment" }, method = RequestMethod.GET)
	public ModelAndView payment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		String userId = null;

		// 세션값 가져오기
		HttpSession session = request.getSession();

		// 로그인 되어있을 경우
		if((Boolean)session.getAttribute("isLogOn")) {
			// 세션에서 로그인 정보 가져오기
			UserVO userVO = (UserVO) session.getAttribute("user");
			userId = userVO.getUserId();

		} else {
			// 로그인 안됐을시 로그인폼(login.jsp)으로 리다이렉트
			response.sendRedirect("/user/loginForm");
			return null; // 리턴값이 필요 없으므로 null 반환
		}

		UserVO userVO = (UserVO) session.getAttribute("user");

		List<CartListVO> orderList = orderService.getOrderList(userId);

		System.out.println("orderList= "+ orderList);

		ModelAndView mav = new ModelAndView();
		mav.addObject("userVO", userVO);
		mav.addObject("orderList", orderList);
		mav.setViewName(viewName);

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
			viewName = viewName.substring(viewName.lastIndexOf("/"), viewName.length());
		}
		return viewName;
	}

}
