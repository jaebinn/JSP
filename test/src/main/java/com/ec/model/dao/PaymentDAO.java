package com.ec.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ec.model.dto.PaymentDTO;
import com.ec.mybatis.SQLMapConfig;

public class PaymentDAO {
private SqlSession ss;
	
	public PaymentDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public long getPaymentCnt() {
		return ss.selectOne("Payment.paymentCnt");
	}
	public Long getPaymentListCnt() {
		return ss.selectOne("Payment.getListCnt");
	}
	
	public List<PaymentDTO> getPaymentList(int startRow, int pageSize, String loginUser) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("loginUser", loginUser);
		return ss.selectList("Payment.getList",datas);
	}

	public boolean insertPayInfo(PaymentDTO payment) {
		return ss.insert("Payment.insertPayInfo", payment) == 1;
	}

	public PaymentDTO getPaymentDetail(long payment_idx) {
	      return ss.selectOne("Payment.getPaymentDetail", payment_idx);
	 }
}
	

