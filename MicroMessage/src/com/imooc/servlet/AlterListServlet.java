package com.imooc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imooc.bean.Command;
import com.imooc.service.MaintainService;
import com.imooc.service.QueryService;

@SuppressWarnings("serial")
public class AlterListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码
		req.setCharacterEncoding("UTF-8");
		//接受页面的值
		String id=req.getParameter("id");
		String name=req.getParameter("command");
		String description=req.getParameter("description");
		String[] contents=req.getParameterValues("content");
		//向页面传值
		req.setAttribute("id", id);
		req.setAttribute("name", name);
		req.setAttribute("description", description);
		req.setAttribute("contents", contents);
		//查询消息列表并传给页面（业务需要去调用service）
		if(name==null||description==null||contents==null){
			QueryService listService=new QueryService();
			List<Command> commandList=new ArrayList<Command>();
			commandList=listService.queryCommandAll(id,name,description);
			req.setAttribute("id", commandList.get(0).getId());
			req.setAttribute("name", commandList.get(0).getName());
			req.setAttribute("description", commandList.get(0).getDescription());
			String[] contents2 = new String[commandList.get(0).getContentList().size()];
			for(int i=0;i<commandList.get(0).getContentList().size();i++){
				contents2[i]=commandList.get(0).getContentList().get(i).getContent();
			}
			req.setAttribute("contents", contents2);
		}
		//单条修改（业务需要去调用service）
		if(contents!=null){
			MaintainService maintainService=new MaintainService();
			maintainService.alterList(id,name,description,contents);
		}
		//向页面跳转
		req.getRequestDispatcher("/WEB-INF/jsp/back/alterList.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
}
