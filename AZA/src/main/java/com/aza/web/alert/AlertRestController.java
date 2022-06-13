package com.aza.web.alert;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.alert.AlertService;
import com.aza.service.domain.User;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/alert/rest/*")
public class AlertRestController {
	
	@Autowired
	@Qualifier("alertServiceImpl")
	private AlertService alertService;

	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	
	@RequestMapping("listAlert")
	public Map listAlert(@ModelAttribute("search") Search search, HttpSession session) throws Exception {

		System.out.println("/alert/rest/listAlert");

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		User user = (User) session.getAttribute("user");

		Map<String, Object> map = alertService.listAlert(search, user.getUserId());
		List list = (List)map.get("list");
		
		
		System.out.println(list);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		map.put("resultPage", resultPage);
		
		
		return map;
	}
}