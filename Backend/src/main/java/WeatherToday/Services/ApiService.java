package WeatherToday.Services;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import static java.nio.charset.StandardCharsets.UTF_8;

@Service
public class ApiService {
    private final HttpClient Client ;


    public ApiService( ) {
        this.Client = HttpClient.newBuilder()
                .followRedirects(HttpClient.Redirect.ALWAYS)
                .build();
    }

    //loads the url and api key from the env data
    public String getWeatherReport(String city,String isoCode) throws IOException, InterruptedException {
        Dotenv dotenv = Dotenv.load();
        final String baseUrl =dotenv.get("BASE_url");
        final String apiKey =dotenv.get("API_KEY");

        String EncodedCity = URLEncoder.encode(city, UTF_8);
        //appends the city and isocode to the url
        String finalUrl = String.format(baseUrl, EncodedCity, isoCode, apiKey);

        //sends the api request
        HttpRequest request= HttpRequest.newBuilder()
                .uri(URI.create( finalUrl))
                .GET()
                .build();

        //clients sends request and gets the response
        HttpResponse<String> response =
                Client.send(request, HttpResponse.BodyHandlers.ofString());
        return response.body();
    }
}
