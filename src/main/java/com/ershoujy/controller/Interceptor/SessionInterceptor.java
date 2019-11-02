package com.ershoujy.controller.Interceptor;

import com.ershoujy.service.IUUidService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class SessionInterceptor implements HandlerInterceptor {
//    @Autowired
//    private IUUidService uuidservice;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        IUUidService uuidservice = org.springframework.web.context.support.WebApplicationContextUtils
                .getRequiredWebApplicationContext(request.getServletContext())
                .getBean(IUUidService.class);
        HttpSession session = request.getSession();
        Integer uid=(Integer) session.getAttribute("userid");
        String uuid=(String)session.getAttribute("uuid");
        if(uid!=null&&uuid!=null&&uuidservice.yanzhen(uid,uuid)){
               return true;
        }else {
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            request.getSession().removeAttribute("userid");
            request.getSession().removeAttribute("uuid");
//            response.setHeader("REDIRECT", "REDIRECT");
//            //告诉ajax我重定向的路径
//            response.setHeader("CONTENTPATH", "/ershoujy/ym/anon/yddl");
//            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.sendRedirect("/ershoujy/ym/anon/yddl");
            return false;
        }
    }
}
