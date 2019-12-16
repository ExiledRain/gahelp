package io.khasang.gahelp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppController {

    @RequestMapping("/status")
    public String getStatus() {
        return "status";
    }

    @RequestMapping("/horsemenu")
    public String getHorseMenu() {
        return "horse";
    }

    @RequestMapping("/user")
    public String getUserPage() {
        return "user";
    }
}
