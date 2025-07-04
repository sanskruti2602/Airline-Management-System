package com.airline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NavigationController {

   
    @GetMapping("/admin-login")
    public String showAdminLoginPage() {
        return "admin-login"; // JSP page
    }

    
}
