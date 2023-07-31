package com.proj.salad.review.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.proj.salad.mypage.service.MyPageOrderServiceImpl;
import com.proj.salad.mypage.vo.OrderInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.proj.salad.review.service.ReviewService;
import com.proj.salad.review.vo.Criteria;
import com.proj.salad.review.vo.PageVO;
import com.proj.salad.review.vo.ReviewVO;
import com.proj.salad.review.vo.Review_imageVO;
import com.proj.salad.user.vo.UserVO;

@Controller
@RequestMapping("/review")
public class ReviewController extends HttpServlet {
		
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private MyPageOrderServiceImpl myPageOrderService;
	
	@Autowired
	private HttpSession session;

	//하유리: 1. 리뷰게시판 전체리스트 보기(23.07.16.)
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String selectAllReviewList(Model model, HttpServletRequest request, HttpServletResponse response, Criteria criteria) throws Exception {
		List<ReviewVO> list = reviewService.selectAllReviewList(criteria);
		model.addAttribute("reviewList", list);
		
		PageVO paging = new PageVO();
		paging.setCriteria(criteria);
		paging.setTotalPost(reviewService.getTotal());
		model.addAttribute("pageMaker", paging);
		model.addAttribute("select", criteria.getCurPage());
		return "/review/list";
	}
	
	//하유리: 2-1. 리뷰게시판 글쓰기(23.07.16.)
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertForm() {
		return "/review/insertReview";
	}
	
	//하유리: 2-2. 리뷰게시판 글쓰기(23.07.16.)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
    public ModelAndView insertReview(ReviewVO reviewVO, HttpServletRequest request, MultipartHttpServletRequest mRequest, HttpServletResponse response) throws Exception {
        // 화면에서 전송한 모든 데이터가 HttpServletRequest에 저장됨
//		System.out.println("parameter : " + request.getParameter("re_title"));
//		System.out.println("파일정보: " + mRequest.getPathInfo());
//		System.out.println("reviewVO: " + reviewVO);

        // 세션 반환(23.07.18.)
        HttpSession session = request.getSession();

		int orderNum = Integer.parseInt(request.getParameter("orderNum"));

		// orderNum으로 주문 내역 조회
//		OrderInfoVO orderInfoVO = myPageOrderService.selectOrderOne(orderNum);



        // 파일 업로드(23.07.20.)
        ModelAndView mav = new ModelAndView("redirect:/review/list");
    	reviewService.insertReview(reviewVO, request, mRequest);
//		mav.addObject("orderInfo", orderInfoVO);
    	return mav;
    }

	@RequestMapping(value = "/insert/{orderNum}", method = RequestMethod.GET)
	public ModelAndView insertReviewWithON(@PathVariable int orderNum,
			ReviewVO reviewVO, HttpServletRequest request, MultipartHttpServletRequest mRequest, HttpServletResponse response) throws Exception {
		// 화면에서 전송한 모든 데이터가 HttpServletRequest에 저장됨
//		System.out.println("parameter : " + request.getParameter("re_title"));
//		System.out.println("파일정보: " + mRequest.getPathInfo());
//		System.out.println("reviewVO: " + reviewVO);

		// 세션 반환(23.07.18.)
		HttpSession session = request.getSession();

		// 주소값으로부터 orderNum 받아오기
//		orderNum = Integer.parseInt(request.getParameter("orderNum"));

		// orderNum으로 주문 내역 조회
		OrderInfoVO orderInfoVO = myPageOrderService.selectOrderOne(orderNum);

		// 파일 업로드(23.07.20.)
		ModelAndView mav = new ModelAndView("redirect:/review/list");
		mav.addObject("orderInfo", orderInfoVO);
		reviewService.insertReview(reviewVO, request, mRequest);
		return mav;
	}

	//하유리: 3-1. 게시물 상세보기(23.07.16.)
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String detailReview(int re_articleNO, Model model, HttpSession session) {
		//조회수
		reviewService.updateCnt(re_articleNO, session);
		
		// 이미지 관련 정보 가져오기(23.07.23.)
		List<Review_imageVO> imageVO = reviewService.detailImg(re_articleNO);
		System.out.println("이미지 관련 정보 :" + imageVO);
				
		ReviewVO review = reviewService.detailReview(re_articleNO);
		review.setRe_imageFileList(imageVO);
		model.addAttribute("review", review);
		
		return "/review/reviewContent";
	}
	
	//하유리: 3-2. 업로드 이미지 출력(23.07.23.)
	@RequestMapping(value="/imgDown" , method=RequestMethod.GET)
	public void ImgDown(@RequestParam("re_storedFileName") String re_storedFileName, HttpServletResponse response) {
		//System.out.println("파일 이름: " + re_storedFileName);
		reviewService.imgDown(re_storedFileName, response);
	}
	
	//하유리: 4-1. 게시물 수정하기(23.07.18.)
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateForm(Model model, int re_articleNO) {
		ReviewVO review = reviewService.detailReview(re_articleNO);
		System.out.println(re_articleNO);
		model.addAttribute("review", review);
		return "/review/updateReview";
	}
	
	//하유리: 4-2. 게시물 수정하기(23.07.18.)
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateReview(ReviewVO reviewVO) {
		reviewService.updateReview(reviewVO);
		return "redirect:/review/list";
	}
	
	//하유리: 5. 게시물 삭제하기(23.07.18.)
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteReveiw(int re_articleNO) {
		reviewService.deleteReview(re_articleNO);
		return "redirect:/review/list";
	}
	
	//하유리: 6-1. 답변폼 조회(23.07.18.)
	@RequestMapping(value="/reply", method=RequestMethod.GET)
	public String replyForm(Model model, int re_articleNO) {
		ReviewVO review = reviewService.detailReview(re_articleNO);
		model.addAttribute("review", review);
		return "/review/replyReview";		
	}
	
	//하유리: 6-2. 답변 작성(23.07.18.)
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public String replyReview(ReviewVO reviewVO, HttpServletRequest request) {
		
		// 세션 반환(23.07.18.)
        HttpSession session = request.getSession();
//        System.out.println("userVO: " + userVO);
//        System.out.println("userId: " + userId);
        reviewService.replyReview(reviewVO);
        
		return "redirect:/review/list";
	}
	
}
