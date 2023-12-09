package dev.reddy.webserviceone.home;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class HomeController {

    @GetMapping()
    public String sayHello() {
        return "Hello, World";
    }
}
