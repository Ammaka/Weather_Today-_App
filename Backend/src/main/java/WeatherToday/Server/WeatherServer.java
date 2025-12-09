package WeatherToday.Server;

import WeatherToday.App;
import WeatherToday.Services.ApiService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "WeatherToday")
public class WeatherServer {
    public static void main(String[] args){
        SpringApplication.run(WeatherServer.class, args);
    }
}
