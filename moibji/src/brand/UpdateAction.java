package brand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import dto.ProductDTO;

/**
 * Servlet implementation class UpdateAction
 */
@WebServlet("/UpdateAction")
public class UpdateAction extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAction() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET UpdateAction");
		response.setContentType("text/html); charset= UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")!=null){
	         response.setContentType("text/html; charset=UTF-8");
	         request.setCharacterEncoding("UTF-8"); 
	         String id = LoginAction.log;
	         
	         ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	         MemberDAO mDao = new MemberDAO();
	         list = mDao.memSearch(id);
	     
	         request.setAttribute("updatemember", list);
	   
	         RequestDispatcher dis = request.getRequestDispatcher("updatemember.jsp");
	         dis.forward(request, response);

	      } else {
	         response.sendRedirect("login.jsp");
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST UpdateAction");
		
		
	}
}

