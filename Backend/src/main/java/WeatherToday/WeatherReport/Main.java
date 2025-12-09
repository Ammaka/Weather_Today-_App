package WeatherToday.WeatherReport;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Main {
    private float temp;
    private float feels_like;
    private float humidity;

    public float getFeels_like() {
        return feels_like;
    }

    public float getHumidity() {
        return humidity;
    }

    public void setHumidity(float humidity) {
        this.humidity = humidity;
    }

    public void setFeels_like(float feels_like) {this.feels_like = feels_like;
    }

    public float getTemp() {
        return temp;
    }

    public void setTemp(float temp) {
        this.temp = temp;
    }

    public String toString(){
        return "Temperature status: (Temp:"+temp+ "  But feels like: "+ feels_like +")";
    }

    public String printHumidity(){
        return "Humidity: "+humidity;
    }

}
