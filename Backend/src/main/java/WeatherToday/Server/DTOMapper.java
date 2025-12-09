package WeatherToday.Server;

import WeatherToday.WeatherReport.WholeReport;
//tells it how to map the DTO object

public class DTOMapper {

    //this is a factory method named from
    // it takes a whole report object and returns a WeatherTodayDTO object
    public static WeatherTodayDTO from(WholeReport wholeReport) {

        return new WeatherTodayDTO(
                wholeReport.getName(),                 // city
                wholeReport.getSys().getCountry(),     // ISO country
                wholeReport.getCoord().getLon(),       // longitude
                wholeReport.getCoord().getLat(),       // latitude
                wholeReport.getMain().getTemp(),       // temperature
                wholeReport.getMain().getFeels_like(), // feels like
                wholeReport.getMain().getHumidity(),// humidity
                wholeReport.getSys().getSunrise(),
                wholeReport.getSys().getSunset(),
                wholeReport.getWeather().getFirst().getMain(),                           // weather main
                wholeReport.getWeather().getFirst().getDescription()// weather description

        );
    }
}


