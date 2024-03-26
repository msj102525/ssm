package com.sdm.ssm.goodsmanage.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.service.GoodsService;
import com.sdm.ssm.goodsmanage.model.vo.Goods;

@Controller
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	@Autowired
	private GoodsService goodsService;

	@RequestMapping(value="glist.do", method = RequestMethod.GET)
	public String boardListMethod(@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, Model model) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit); 
		}

		int listCount = goodsService.selectListCount();
		
		
		Paging paging = new Paging(listCount, currentPage, limit, "glist.do");
		paging.calculate();

		ArrayList<Goods> list = goodsService.selectList(paging);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);

			return "goods/goodsListView";
		} else {
			model.addAttribute("message", currentPage + "실패!");
			return "common/error";
		}

	}

}
