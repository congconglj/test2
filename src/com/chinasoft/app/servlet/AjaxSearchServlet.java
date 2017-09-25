package com.chinasoft.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.app.service.ProductService;
import com.chinasoft.app.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class AjaxSearchServlet
 */
public class AjaxSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询name
		String searchname = request.getParameter("searname");
		//查询数据库，根据searchname查询出来想要的东西，模糊查询
		//service.findProductByName(String searchname)
		searchname= new String(searchname.getBytes("iso-8859-1"),"utf-8");
		//调用service
		ProductService p = new ProductServiceImpl();
		List<String> list = p.findProductByName(searchname);
		//把集合中数据转换为字符串返回到网页
		String str = "";
		for(int i=0;i<list.size();i++){//1001,1002,1003
			if(i>0){
				str+=",";
			}
			str+=list.get(i);
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(str);
	}

}
