package brand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class JoinUpdate
 */
@WebServlet("/JoinUpdate")
public class JoinUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String id;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinUpdate() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET JoinUpdate");

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST JoinUpdate");
		response.setContentType("text/html); charset= UTF-8");
		request.setCharacterEncoding("UTF-8");


		String shopid = request.getParameter("uid");
		String shoppw = request.getParameter("upw");
		String shopname = request.getParameter("uname");
		String shopzipcode = request.getParameter("uzipcode");
		String shopaddr1 = request.getParameter("uaddr1");
		String shopaddr2 = request.getParameter("uaddr2");
		String shopphone = request.getParameter("uphone");
		String shopemail = request.getParameter("uemail");
		
		MemberDTO mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail);	
		MemberDAO mDao =  new MemberDAO();
		mDao.memUpdate(id);
		response.sendRedirect("IndexAction");
		
	}

}
