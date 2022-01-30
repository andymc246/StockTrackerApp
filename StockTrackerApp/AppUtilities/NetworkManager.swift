//
//  NetworkManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


//T is a constraint to codeable to help write a generic version of network manager
//get data from user response and because T is codable, it will decode reponse into a json object
final class NetworkManager <T: Codable> {
    
    //fetch data from url provided by the user
    //using json decoder to decode the data responder from user according to T
    func fetch(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            //first case
            //create an object called error that has no value
            guard error == nil
            
            else {
                //abort the program or exit if error occurrs
                completion (.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            
            //second case
            //store the url response into the object "httpResponse" and check the status code if it is 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            
            //if url response is not of type "HTTPURLResponse" or status code is not 200
            else  {
                //abort the program or exit if invalid response occurrs
                completion (.failure(.invalidResponse(response: response!.description)))
                return
            }
            
            
            //third case
            //store data in data
            guard let data = data
            
            else {
                //abort the program or exit if data is invalid
                completion (.failure(.invalidData))
                return
            }
            
            //json is needed to read data from webpage or URL
            //json is decoding the data from the URL
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }
            
            //fourth case
            //catch and print out the decoding error
            catch let err {
                completion(.failure(.decodingError(err: err.localizedDescription)))
                print(err)
            }
        //resume the program even if any of the cases execute
        }.resume()
    
    }
}

//Error protocol for network manager
enum NetworkError: Error {
    
    //cases for network error and invalid problems
    case invalidResponse (response: String)
    case invalidData
    case error (err: String)
    case decodingError (err: String)
    
}
