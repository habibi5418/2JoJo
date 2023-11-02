package kr.co.dondog.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin")
    public ModelAndView HomedView() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/admin");
        return mv;
    }
}