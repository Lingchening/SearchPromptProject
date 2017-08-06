package com.zl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

/**
 * Created by acer on 2017/8/6.
 */
public class SearchServlet extends HttpServlet {

    static List<String> datas = new ArrayList<String>();

    static {

        datas.add("ajax");
        datas.add("ajax post");
        datas.add("ajax get");
        datas.add("ajax search");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String keyword = request.getParameter("keyword");
        List<String> dataList = getData(keyword);
        JSONArray.fromObject(dataList);
        System.out.print(JSONArray.fromObject(dataList).toString());
        response.getWriter().write(JSONArray.fromObject(dataList).toString());
    }

    public List<String> getData(String keyword) {
        List<String> list = new ArrayList<String>();
        for (String data : datas) {
            list.add(data);
        }
        return list;
    }
}
