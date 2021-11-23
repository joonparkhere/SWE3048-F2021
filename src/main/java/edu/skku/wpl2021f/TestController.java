package edu.skku.wpl2021f;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @GetMapping("/test")
    public String test(Model model) {
        TestObject alice = new TestObject("Alice", 20);
        TestObject bob = new TestObject("Bob", 30);
        TestObject eve = new TestObject("Eve", 40);

        List<TestObject> testObjectList = new ArrayList<>();
        testObjectList.add(alice);
        testObjectList.add(bob);
        testObjectList.add(eve);

        model.addAttribute("list", testObjectList);
        return "test";
    }

}
