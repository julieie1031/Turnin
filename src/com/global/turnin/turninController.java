package com.global.turnin;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class turninController
 */
@WebServlet("*.do")
public class turninController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public turninController() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}
	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); //프로젝트 + 파일경로까지 가져옴
		System.out.println("uri :"+uri);
		String ctxPath = request.getContextPath(); //프로젝트 Path만 가져옴
		String cmd = uri.substring(ctxPath.length()); //여기까지 uri경로를 가져오는 메소드//cmd객체에 저장 
		System.out.println("cmd :"+cmd);
		RequestDispatcher rd = null;
		memcontentsDAO dao = memcontentsDAO.getInstance(); // setter, getter의 느낌. 생성한 객체를 반환 일반적으론 new 생성자 이용
		MemContents mc = new MemContents();
		
		if(cmd.equals("/PJ/writeProc.do")) {
			System.out.print("성공");
			request.setCharacterEncoding("UTF-8");
			System.out.println("parameter "+request.getParameter("contents"));
			
			mc.setContents(request.getParameter("contents"));
			dao.insert(mc);
			List<MemContents> cList = dao.selectAll();
			request.setAttribute("cList", cList);
			rd = request.getRequestDispatcher("/PJ/listProc.do");
			rd.forward(request, response);
			
		}else if(cmd.equals("/PJ/listProc.do")) {
			System.out.print("list");
			request.setCharacterEncoding("UTF-8");
			dao = memcontentsDAO.getInstance();
			List<MemContents>cList = dao.selectAll();
			request.setAttribute("cList", cList);
					//response.sendRedirect("list.jsp");  는 값이 살아서 가지 못함
			rd = request.getRequestDispatcher("/PJ/0422.jsp");
			rd.forward(request, response);
			
		}else if(cmd.equals("/PJ/viewProc.do")) {
			System.out.print("view");
			request.setCharacterEncoding("UTF-8");
			String userId = request.getParameter("userId");
			dao = memcontentsDAO.getInstance();
			mc = dao.selectBoard(userId);
			request.setAttribute("mc", mc);
			rd = request.getRequestDispatcher("/PJ/listProc.do");
			rd.forward(request, response);
		}
	}

}
