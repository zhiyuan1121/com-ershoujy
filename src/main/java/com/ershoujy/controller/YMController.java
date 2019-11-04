package com.ershoujy.controller;

import com.ershoujy.pojo.UserB;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/ym")
@SessionAttributes(value = {"userid"},types = {UserB.class})
public class YMController {
    @RequestMapping("anon/zhuche")
    public ModelAndView zhuche(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("zhuche");
        return modelAndView;
    }

    @RequestMapping("anon/login")
    public ModelAndView login(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/login");
        if(request.getSession().getAttribute("uid")!=null){
            modelAndView.setViewName("forward:/ym/authc/zhuye");
        }
        return modelAndView;
    }

    @RequestMapping("authc/spadd")
    public ModelAndView spadd(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("spadd");
        return modelAndView;
    }

    @RequestMapping("authc/zhuye")
    public ModelAndView zhuye(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("zhuye");
        return modelAndView;
    }

    @RequestMapping("anon/yddl")
    public ModelAndView yddl(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("yddl");
        return modelAndView;
    }

}
