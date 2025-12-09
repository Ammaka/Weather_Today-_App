package WeatherToday.Services;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CountryIsoConverter {
    public static Properties isoCodes ;
    //static block that creates a properties object and reads the countries.properties file
    static{
        isoCodes=new Properties();
        try {
            FileInputStream fis = new FileInputStream("Countries.properties");
            isoCodes.load(fis);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //method that converts the case of the country entered to Xxxx_Xxxx
    public static String countryCaseConverter(String country){
        String[] countryWords = country.split(" ");
        StringBuilder stringBuilder= new StringBuilder();
        for (String word : countryWords){
            if(!word.isEmpty()){
                stringBuilder.append(Character.toUpperCase(word.charAt(0)))
                        .append(word.substring(1).toLowerCase())
                        .append("_");
            }
        }

        //remove trailing underscore if any
        return !stringBuilder.isEmpty() ? stringBuilder.substring(0, stringBuilder.length()-1) : "";
    }
    public static String getIsoCode(String country){
        return isoCodes.getProperty(country,"unknown");
    }
}
