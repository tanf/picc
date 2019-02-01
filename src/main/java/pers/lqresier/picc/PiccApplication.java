package pers.lqresier.picc;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("pers.lqresier.picc.mapper")
public class PiccApplication {
    public static void main(String[] args) {
        SpringApplication.run(PiccApplication.class, args);
    }
}
