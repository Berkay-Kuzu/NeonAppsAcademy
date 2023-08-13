//
//  WeatherManager.swift
//  WeatherApp(URLSession)
//
//  Created by Berkay Kuzu on 25.06.2023.
//

import Foundation

protocol WeatherManagerDelegate {
   func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct Constants {
    static let API_KEY = "761841c0db826503a9e966bd8227560b"
    static let baseUrl = "https://api.openweathermap.org"
    static let units = "metric"
}

struct WeatherManager {
    
    let weatherURL = "\(Constants.baseUrl)/data/2.5/weather?appid=\(Constants.API_KEY)&units=\(Constants.units)"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest( with urlString: String) {
        //1. Create a URL
        guard let url = URL(string: urlString) else {return}
        
        //2. Create a URLSession
        let session = URLSession(configuration: .default)
        
        //3. Give the session a task
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data {
                //let dataString = String(data: safeData, encoding: .utf8)
                if let weather = self.parseJSON(safeData) {
                    delegate?.didUpdateWeather(self, weather: weather)
                }
            }
        }
        //4. Start the task
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherId = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weatherCondition = decodedData.weather[0].description
            
            let weather = WeatherModel(conditionId: weatherId, cityName: name, temperature: temp, weatherCondition: weatherCondition)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

    //    func handle(data: Data?, response: URLResponse?, error: Error?){
    //
    //    }
}
