package brand;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ProductDAO;
import dto.ProductDTO;

/**
 * Servlet implementation class IndexAction
 */
@WebServlet("/IndexAction")
public class IndexAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexAction() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET IndexAction");
		response.setContentType("text/html); charset= UTF-8");
		request.setCharacterEncoding("UTF-8");

		ProductDAO bPDao = new ProductDAO();
		
		List<ProductDTO>newProductList = bPDao.listNewProduct();
		List<ProductDTO>bestProductList = bPDao.listBestProduct();
		System.out.println("==============");
		
		request.setAttribute("newlist", newProductList);
		request.setAttribute("bestlist", bestProductList);
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST IndexAction");
		
		ProductDAO bPDao = new ProductDAO();
		
		List<ProductDTO>newProductList = bPDao.listNewProduct();
		List<ProductDTO>bestProductList = bPDao.listBestProduct();
		System.out.println("==============");
		
		request.setAttribute("newlist", newProductList);
		request.setAttribute("bestlist", bestProductList);
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
		
	}

}
