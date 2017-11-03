package brand;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET JoinAction");
		System.out.println("d11111111oGET JoinAction");
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST JoinAction");
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
		mDao.memInsert(mDto);
		response.sendRedirect("welcome.jsp");
		
		System.out.println("shopid = " + shopid);
		System.out.println("shoppw = " + shoppw);
		System.out.println("shopname = " + shopname);
		System.out.println("shopzipcode = " + shopzipcode);
		System.out.println("shopaddr1 = " + shopaddr1);
		System.out.println("shopaddr2 = " + shopaddr2);
		System.out.println("shopphone = " + shopphone);
		System.out.println("shopemail = " + shopemail);
		
		
	}

}
