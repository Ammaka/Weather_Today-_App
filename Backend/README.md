markdown
# Weather App - Java Backend (BE)

This is the backend service for the Weather Today Flutter application. It uses Spring Boot to fetch data from a third-party weather API and expose it over a REST API.

## Description

This Java application acts as a simple and secure bridge between the Flutter client and an external weather service (like OpenWeatherMap, WeatherAPI, etc.). It prevents the API key from being exposed in the frontend code.

## Features

*   **REST API:** Exposes a simple HTTP endpoint (e.g., `/api/weather?city=London`) for the frontend to fetch data.
*   **External API Integration:** Manages all communication with the third-party weather provider.
*   **Secure API Key:** Keeps the external weather service API key safe on the server.
*   **Data Processing:** Formats data cleanly before sending it to the Flutter app.

## How to Run

-clone the repo
-build the docker image
-run the docker image (provide your API key as a query)
-proceed to the FE
