package brand;

import java.io.IOException;

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
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code = null;
	static String log;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET LoginAction");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST LoginAction");
		response.setContentType("text/html); charset= UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("uid");
		String pw = request.getParameter("upw");
		
		
		//로그인 후 있던창으로 돌아가게 하기
		/*String ctx = request.getContextPath();
		String refer = request.getHeader("referer");
		String cutval = "http://localhost:8081" + ctx;
		String ref = refer.substring(cutval.length());
		
		System.out.println("ID = " + uid);
		System.out.println("PW = " + upw);
		System.out.println("ref = " + ref);
		
		RequestDispatcher dis = request.getRequestDispatcher(ref);
		dis.forward(request, response);	*/
		String code = null;
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		MemberDAO mDao = new MemberDAO();
		
		MemberDTO mDto = mDao.ckLogin(id, pw);
		
		if(mDto != null){	
		
		 // 세션초기화(혹시 모를 앞의 남아있는 값 제거)
		session.removeAttribute("id");
		session.setAttribute("loginUser", mDto); // 세션이름
		
		code = "IndexAction";
		
		} else {
			code = "login.jsp";
			log = mDto.getShopid();
			
		}
	
		RequestDispatcher dis = request.getRequestDispatcher(code);
		dis.forward(request, response);	
		
	}
}


		
	


