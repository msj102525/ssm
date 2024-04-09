package com.sdm.ssm.pos.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sdm.ssm.pos.model.service.PosService;
import com.sdm.ssm.pos.model.vo.POS;
import com.sdm.ssm.subscribe.model.controller.SubscribeController;

@Controller
public class PosController {
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);
	@RequestMapping("mvTablePos.do")
	public String moveTablePos() {
		return "pos/table";
	}
	@RequestMapping("mvNoTablePos.do")
	public String moveNoTablePos() {
		return "pos/notable";
	}
}
