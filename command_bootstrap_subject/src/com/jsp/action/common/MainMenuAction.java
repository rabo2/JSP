package com.jsp.action.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.MenuVO;
import com.jsp.service.MenuService;

public class MainMenuAction implements Action {

	private MenuService menuService;

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "common/indexPage";

		String mCode = request.getParameter("mCode");

		if (mCode == null)
			mCode = "M000000";

		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			MenuVO menu = menuService.getMenuByMcode(mCode);

			request.setAttribute("menuList", menuList);
			request.setAttribute("menu", menu);

		} catch (Exception e) {
			e.printStackTrace();
			url = null;
			throw e;
		}
		return url;
	}

}