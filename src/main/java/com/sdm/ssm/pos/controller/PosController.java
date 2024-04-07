package com.sdm.ssm.pos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sdm.ssm.pos.model.service.PosService;
import com.sdm.ssm.pos.model.vo.POS;

@Controller
@RequestMapping("/pos")
public class PosController {
	
    @Autowired
    private PosService posService;

    @GetMapping("/listPOS.do")
    public String getAllPOS(Model model) {
        try {
            // POS 리스트를 가져오는 메소드 호출
            // 가져온 POS 리스트를 Model에 담아서 View에 전달
            return "pos/posList"; // posList.jsp로 이동
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "POS 리스트를 불러오는 중 오류가 발생했습니다.");
            return "errorPage"; // 에러 페이지로 이동
        }
    }

    @PostMapping("/updatePOS.do")
    public String updatePOS(POS pos, RedirectAttributes redirectAttributes) {
        try {
            // POS 정보를 수정하는 메소드 호출
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "POS 정보 수정 중 오류가 발생했습니다.");
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        }
    }

    @PostMapping("/addPOS.do")
    public String addPOS(POS pos, RedirectAttributes redirectAttributes) {
        try {
            // 새로운 POS를 추가하는 메소드 호출
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "POS 추가 중 오류가 발생했습니다.");
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        }
    }

    @GetMapping("/deletePOS.do")
    public String deletePOS(int id, RedirectAttributes redirectAttributes) {
        try {
            // POS를 삭제하는 메소드 호출
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "POS 삭제 중 오류가 발생했습니다.");
            return "redirect:/pos/listPOS.do"; // posList.jsp로 이동
        }
    }

	public PosService getPosService() {
		return posService;
	}

	public void setPosService(PosService posService) {
		this.posService = posService;
	}
}
