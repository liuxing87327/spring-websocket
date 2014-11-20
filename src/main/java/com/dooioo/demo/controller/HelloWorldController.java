package com.dooioo.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 功能说明：HelloWordController
 * 作者：liuxing(2014-11-14 02:03)
 */
@Controller
public class HelloWorldController {

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String helloWorld(Model model) {
        return "websocket";
    }

}