package WeatherToday.WeatherReport;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
//class that decipits the Coord response from server and enables serialization
@JsonIgnoreProperties(ignoreUnknown = true)
public class Coord {
    private double lon;
    private double lat;

    public double getLon() {
        return lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public String toString(){
        return "Cordinates: (Lon:"+lon+ "  Lat: "+lat+")";
    }
}
