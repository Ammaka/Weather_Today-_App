//http://localhost:8080/weather?city=Berlin&country=germany
package WeatherToday.Server;

import WeatherToday.Services.ApiService;
import WeatherToday.WeatherReport.WholeReport;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import static WeatherToday.Services.CountryIsoConverter.countryCaseConverter;
import static WeatherToday.Services.CountryIsoConverter.getIsoCode;

@RestController
@RequestMapping("/weather")
@CrossOrigin(origins = "*")
public class WeatherController {
    private final ApiService apiService;
    private final ObjectMapper objectMapper= new ObjectMapper();

    public WeatherController(ApiService apiService) {
        this.apiService = apiService;

    }

    @GetMapping
    public WeatherTodayDTO getWeather(
            @RequestParam(name = "city") String city,
            @RequestParam(name = "country") String country
)throws Exception{
    String convertedCountry= countryCaseConverter(country);
    String isoCode= getIsoCode(convertedCountry);

    String rawJson= apiService.getWeatherReport(city,isoCode);
    WholeReport wholeReport= objectMapper.readValue(rawJson,WholeReport.class);

        return DTOMapper.from(wholeReport);

}
}
