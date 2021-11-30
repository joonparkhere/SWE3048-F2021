package edu.skku.wpl2021f;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class Wpl2021fApplication {

    public static void main(String[] args) {
        SpringApplication.run(Wpl2021fApplication.class, args);
    }

}
