package org.example.practice16.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

    @GetMapping("/home")
    public String getPoll() {
        return "index";
    }

    @PostMapping("/home")
    public String answerPoll(@RequestParam("option") String option, Model model) {
        model.addAttribute("voteResult", "You have voted for: " + option);
        return "index";
    }
}
