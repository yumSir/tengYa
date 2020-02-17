package com.tengya.sales.util;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {

    /**
     * @desc  获取操作用户ip
     * @param request
     * @return
     */
    public static String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }
}
