package dev.reddy.webserviceone.home;

import dev.reddy.webserviceone.domain.Post;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/")
public class HomeController {

    @GetMapping()
    public String sayHello() {
        return "Hello, World";
    }

    @GetMapping("/posts")
    public List<Post> getAllPosts() {
        return List.of(
                new Post(1, "Spring Boot with Docker", "Configure and build docker images with spring boot"),
                new Post(2, "Docker Guide", "Dockerize your spring boot in a breeze")
        );
    }
}
