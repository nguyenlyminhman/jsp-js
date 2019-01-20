package js.com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import js.bean.DemoBean;

/**
 * Servlet implementation class demo
 */
@WebServlet("/demo")
public class demo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public demo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DemoBean> listDemoBean = new ArrayList<DemoBean>();
		DemoBean demoBean0 = new DemoBean();
		demoBean0.setId("all");
		demoBean0.setValue("all");
		
		DemoBean demoBean1 = new DemoBean();
		demoBean1.setId("one");
		demoBean1.setValue("one one");
		
		DemoBean demoBean2 = new DemoBean();
		demoBean2.setId("two");
		demoBean2.setValue("two two");
		
		DemoBean demoBean3 = new DemoBean();
		demoBean3.setId("three");
		demoBean3.setValue("three three");
		
		DemoBean demoBean4 = new DemoBean();
		demoBean4.setId("four");
		demoBean4.setValue("four four");
		
		listDemoBean.add(demoBean0);
		listDemoBean.add(demoBean1);
		listDemoBean.add(demoBean2);
		listDemoBean.add(demoBean3);
		listDemoBean.add(demoBean4);
		
 		
		
		request.setAttribute("listDemoBean", listDemoBean);
		request.getRequestDispatcher("checkbox.jsp").forward(request, response);
		doGet(request, response);
	}

}
