package WeatherToday;
import WeatherToday.Services.ApiService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URLEncoder;

import WeatherToday.WeatherReport.WholeReport;

import java.io.IOException;
import java.util.Scanner;

import static WeatherToday.Services.CountryIsoConverter.countryCaseConverter;
import static WeatherToday.Services.CountryIsoConverter.getIsoCode;
import static java.nio.charset.StandardCharsets.UTF_8;

public class App {
    public static void main(String[] args){
        ObjectMapper objectMapper = new ObjectMapper();
        Scanner scanner= new Scanner(System.in);

        //ask for city and convert it to utf8: if its two words, it puts %s between
        System.out.println( "enter your city");
        String city = scanner.nextLine();

        while (city.isEmpty()){
            System.out.println( "pls enter a city");
             city = scanner.nextLine();
        }

        String EncodedCity = URLEncoder.encode(city, UTF_8);

        //converts the country entered to pascal case with underscored between
        //then converts it to the city iso codes
        System.out.println( "enter your country");
        String country = scanner.nextLine();
        while (country.isEmpty()){
            System.out.println( "pls enter a country");
            country = scanner.nextLine();
        }

        String convertedCountry= countryCaseConverter(country);
        String isoCode= getIsoCode(convertedCountry);

        //System.out.println(convertedCountry);
        //System.out.println(isoCode);

        ApiService client = new ApiService();


        try {
            String report =client.getWeatherReport(EncodedCity,isoCode );
            WholeReport finReport=objectMapper.readValue(report, WholeReport.class);

            System.out.println(finReport.getName());
            System.out.println(finReport.getSys().getCountry());
            System.out.println(finReport.getCoord().toString());
            System.out.println(finReport.getMain().toString());
            System.out.println(finReport.getMain().printHumidity());
            System.out.println(finReport.getWeather().getFirst().getMain());
            System.out.println(finReport.getWeather().getLast().getDescription());
            System.out.println(finReport.getSys().getSunrise());
            System.out.println(finReport.getSys().getSunset());

        } catch (IOException | InterruptedException e) {
            System.err.println("Error fetching or parsing data: " + e.getMessage());
        }
    }
}
