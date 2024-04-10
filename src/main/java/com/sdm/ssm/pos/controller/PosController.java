package com.sdm.ssm.pos.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdm.ssm.pos.model.service.PosService;
import com.sdm.ssm.pos.model.vo.Table;


@Controller
public class PosController {
	private static final Logger logger = LoggerFactory.getLogger(PosController.class);
	
	@Autowired
	private PosService posService;
	
	
	@RequestMapping("mvTablePos.do")
	public String moveTablePos() {
		return "pos/table";
	}
	@RequestMapping("mvNoTablePos.do")
	public String moveNoTablePos() {
		return "pos/notable";
	}
	@RequestMapping("mvPosSetting.do")
	public String movePosSettingPage() {
		return "pos/posSetting";
	}
	@RequestMapping("saveTableXY.do")
	public void test6Method(@RequestBody String tableArray) throws ParseException{
		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray)jparser.parse(tableArray);
		for(int i=0; i<jarr.size(); i++) {
			JSONObject job = (JSONObject)jarr.get(i);
			Table table = new Table();
			table.setTableName((String)job.get("tableName"));
			String strX = (String) job.get("tableX");
			String strY = (String)job.get("tableY");
			String strX2 = strX.substring(0, strX.length()-2);  //px 자르기
			String strY2= strY.substring(0, strY.length()-2);  //px 자르기
			
			table.setTableX(Double.parseDouble(strX2));
			table.setTableY(Double.parseDouble(strY2));
			table.setId(Integer.parseInt((String) job.get("userId")));
			
			int result = posService.insertTableInfo(table);
			}
		
	}
}
