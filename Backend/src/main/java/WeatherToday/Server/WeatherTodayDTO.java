package WeatherToday.Server;
//sample of the object that the backend would return in flutter.. or that would be exposed over http
public class WeatherTodayDTO {

    private String city;
    private String country;
    private double lon;
    private double lat;
    private double temperature;
    private double feelsLike;
    private double humidity;
    private String sunset;
    private  String sunrise;
    private String main;
    private String description;

    public WeatherTodayDTO(){}

    public WeatherTodayDTO(String city,
                           String country,
                           double lon,
                           double lat,
                           double temperature,
                           double feelsLike,
                           double Humidity,
                           String sunrise,
                           String  sunset,
                           String main,
                           String description
                          ){
        this.city=city;
        this.country=country;
        this.lon=lon;
        this.lat=lat;
        this.temperature=temperature;
        this.feelsLike=feelsLike;
        this.humidity =Humidity;
        this.sunrise=sunrise;
        this.sunset = sunset;
        this.main=main;
        this.description=description;

    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getTemperature() {
        return temperature;
    }

    public void setTemperature(double temperature) {
        this.temperature = temperature;
    }

    public double getFeelsLike() {
        return feelsLike;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getHumidity() {
        return humidity;
    }

    public String getMain() {
        return main;
    }

    public void setMain(String main) {
        this.main = main;
    }

    public void setHumidity(double humidity) {
        this.humidity = humidity;
    }

    public void setFeelsLike(double feelsLike) {
        this.feelsLike = feelsLike;
    }

    public String getSunset() {
        return sunset;
    }

    public void setSunset(String sunset) {
        this.sunset = sunset;
    }

    public String getSunrise() {
        return sunrise;
    }

    public void setSunrise(String sunrise) {
        this.sunrise = sunrise;
    }
}
