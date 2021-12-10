package edu.skku.wpl2021f.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @GetMapping({"/", "/index"})
    public String index() {
        return "index";
    }

    @GetMapping("/profile")
    public String profile() {
        return "profile";
    }

    @GetMapping("/board")
    public String board() {
        return "board";
    }

    @GetMapping("/view")
    public String view() {
        return "view";
    }

    @GetMapping("/post")
    public String post() {
        return "post";
    }

    @PostMapping("/post-action")
    public String postAction() {
        return "postAction";
    }

    @GetMapping("/update")
    public String update() {
        return "update";
    }

    @PostMapping("/update-action")
    public String updateAction() {
        return "updateAction";
    }

    @GetMapping("/delete-action")
    public String deleteAction() {
        return "deleteAction";
    }

    @PostMapping("/comment-action")
    public String commentAction() {
        return "commentAction";
    }

    @GetMapping("/comment-delete-action")
    public String commentDeleteAction() {
        return "commentDeleteAction";
    }

    @GetMapping("/sample-recruit")
    public String sampleRecruit() {
        return "sample-recruit";
    }

}
