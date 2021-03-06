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

    @RequestMapping("/testing")
    public String getStat() {
        return "testing";
    }

    @RequestMapping("/user")
    public String getUserPage() {
        return "user";
    }

    @RequestMapping("/alp")
    public String getAlp() {
        return "alps";
    }

    @RequestMapping("/dent")
    public String getDent() {
        return "dent";
    }
}
