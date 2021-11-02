package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.Dao;
import com.mvc.dao.DaoImpl;
import com.mvc.dao.mypage.MypageDao;
import com.mvc.dao.mypage.MypageDaoImpl;
import com.mvc.dto.HeartDto;
import com.mvc.dto.PromiseDto;
import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

@WebServlet("/mypage.do")
public class mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		MypageDao m_dao = new MypageDaoImpl();
		Dao	u_dao = new DaoImpl();
		
		HttpSession session = request.getSession();
		UserDto user = (UserDto) session.getAttribute("dto");
		//user.setUser_id("ILNAM");//일남 
		//System.out.println("로그인 아이디 : " + user.getUser_id());
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("mypage")) {
			
			if (user == null || user.getUser_id().trim().equals("")) {
				System.out.println("로그인확인!!!");
				jsResponse("로그인이 필요합니다", "login/login.jsp", response);
			} else {
				//내여행 리스트
				List<blogDto> travel_list =  m_dao.selectTravelSql(user.getUser_id());
				request.setAttribute("travel_list", travel_list);
				
				//내가 찜한 여행지 + 일정
				List<HeartDto> wished_list =  m_dao.selectWishedSql(user.getUser_id());
				request.setAttribute("wished_list", wished_list);
				//동행 리스트
				List<PromiseDto> companion_list = m_dao.selectCompanionSql(user.getUser_id());
				request.setAttribute("companion_list", companion_list);
				
				dispatch("user/mypage.jsp", request, response);
			}
		}else if(command.equals("myTravel")){
			if (user == null || user.getUser_id().trim().equals("")) {
				System.out.println("로그인확인!!!");
				jsResponse("로그인이 필요합니다", "login/login.jsp", response);

			} else {
				//내여행 리스트
				List<blogDto> travel_list =  m_dao.selectTravelSql(user.getUser_id());
				request.setAttribute("travel_list", travel_list);
				
				dispatch("user/my_travel.jsp", request, response);
			}
		}else if(command.equals("wishedTravel")) {
			dispatch("user/save_travel.jsp", request, response);
		}else if(command.equals("myCompanion")) {
			if (user == null || user.getUser_id().trim().equals("")) {
				System.out.println("로그인확인!!!");
				jsResponse("로그인이 필요합니다", "login/login.jsp", response);
			} else {
				//내여행 리스트
				List<blogDto> travel_list =  m_dao.selectTravelSql(user.getUser_id());
				request.setAttribute("travel_list", travel_list);
				
				//내가 찜한 여행지 + 일정
				
				//동행 리스트
				List<PromiseDto> companion_list = m_dao.selectCompanionSql(user.getUser_id());
				request.setAttribute("companion_list", companion_list);
				
				dispatch("user/my_companion.jsp", request, response);
			}
		}else if(command.equals("infoUpdate")) {
			dispatch("user/info_update.jsp", request, response);
		}else if(command.equals("updateUser")) {
			String passwd = request.getParameter("pw_check");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String nation = request.getParameter("nation");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email")+"@"+request.getParameter("dot");
			int age = Integer.parseInt(request.getParameter("age"));
			String phone = request.getParameter("phone");
			
			//주소 Api를 통한 주소값받기
			String postcode = request.getParameter("postcode");
			String roadAddr = request.getParameter("roadAddress");
			String detailAddr = request.getParameter("detailAddress");
			String addr = postcode+roadAddr+detailAddr;
			
			UserDto dto = new UserDto();
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setNickname(nickname);
			dto.setU_national(nation);
			dto.setGender(gender);
			dto.setEmail(email);
			dto.setAge(age);
			dto.setPhone(phone);
			dto.setAddress(addr);
			
			int res = u_dao.info_update(dto);
			
			jsResponse("정보수정성공", "user/mypage.jsp", response);
		}
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException{
		String s = "<script type='text/javascript'>" +
					"alert('"+msg+"');" +
					"location.href='"+url+"';" +
					"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, reponse);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
