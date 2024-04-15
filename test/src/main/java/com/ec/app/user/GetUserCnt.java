package com.ec.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.action.Action;
import com.ec.action.Transfer;
import com.ec.model.dao.ExpertDAO;
import com.ec.model.dao.MatchingDAO;
import com.ec.model.dao.UserDAO;
import com.google.gson.Gson;

public class GetUserCnt implements Action {
    @Override
    public Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        UserDAO udao = new UserDAO();
        ExpertDAO edao = new ExpertDAO();
        MatchingDAO mdao = new MatchingDAO();

        Long totalUsers = udao.getUserCnt();
        Long expertCount = edao.getExpertCnt();
        Long matchingCount = mdao.getMatchingCnt();
        
        System.out.println(totalUsers); //유저 가입자 
        System.out.println(expertCount); //전문가 가입자 수 
        System.out.println(matchingCount); //매칭 수
        
        Gson gson = new Gson();

        // 데이터를 JSON으로 변환
        String jsonData = gson.toJson(new UserCounts(totalUsers, expertCount, matchingCount));

        // JSON 데이터를 클라이언트로 전송
        resp.setContentType("text/html; charset=utf-8");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonData);

        return null;
    }
}
