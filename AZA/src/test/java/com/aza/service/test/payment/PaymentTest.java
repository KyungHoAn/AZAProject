package com.aza.service.test.payment;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentService;

@SpringBootTest
public class PaymentTest {
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	//@Test // get test ok
	void testGetPayment() throws Exception {
		
		Payment pay = new Payment();
		
		pay = paymentService.getPayment(1019);
		System.out.println("getPay TEST === >> "+pay);
		
	}
	
	//@Test // Add Test ok
	void testAddPayment() throws Exception {
		Payment pay = new Payment();
		pay.setStudentRecordNo(1008);
		pay.setStudentId("student21");
		pay.setAmount(50);
		
		paymentService.addPayment(pay);
		System.out.println(pay);
		
		/* 
		 * student_record_no 
		 * student_id
		 * student_name
		 * amount 
		 * pay_due_date 
		 * */
	}
	//@Test
	void testUpdatePayment() throws Exception {
		
		Payment payment = paymentService.getPayment(1009);
		//payment.setPayCode(1009);
//		System.out.println(payment);
		paymentService.updatePayment(payment);
		assertEquals("Y", payment.getCheckPay());
	}
	
	//@Test //OK
	void testDeletePayment() throws Exception{
		paymentService.deletePayment(1023);
	}
	
	@Test // okok 근데 값이 이게 맞나
	public void testListPayment() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		search.setSearchCondition("2");
		search.setSearchKeyword("N");
	//	search.setSearchStartDate("2022/05/01");
	//	search.setSearchEndDate("2022/05/30");
		
		System.out.println("시작=====================");
		
		Map<String, Object> map = paymentService.listPayment(search);
		System.out.println("수납 map ===> " + map);
		
		List<Object> list = (List<Object>)map.get("list");
		//assertEquals(2,list.size());
		System.out.println("수납 list ===> " + list);
		
		
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("수납 TotalCount ====>> " + totalCount);
		System.out.println("수납 서치 ====>> " + search);
		
	}
}
