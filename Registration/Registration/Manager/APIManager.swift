//
//  APIManager.swift
//  Registration
//
//  Created by Malak Mohamed on 10/09/2024.
//

import Foundation
import Alamofire

class APIManager {
    
//    static let shared = APIManager() // Singleton instance

    private static let baseURL = "https://money-transfer-production.up.railway.app/api"
    
    // Function to register a user
    static func registerUser(user: User, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let noDataError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned"])
                completion(.failure(noDataError))
                return
            }

            // Debugging: Print the response data
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response Data: \(responseString)")
            }
            completion(.success(data))
        }
        task.resume()
    }
    
    
    // Function to log in a user
    static func loginUser(email: String, password: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: loginData, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error encoding login data: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // Extract the token from the JSON response
                    if let token = jsonResponse["token"] as? String {
                        // Save the token to the Keychain
                        TokenManager.shared.setToken(token)
                        
                        completion(.success(jsonResponse))
                    
                    } else {
                        // Token not found in the response, return an error
                        completion(.failure(NSError(domain: "Token not found in response", code: -1, userInfo: nil)))
                    }
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    static func getBalance(completion: @escaping (Result<Double, Error>) -> Void) {
        let url = "\(self.baseURL)/balance"
        guard let token = TokenManager.shared.getToken() else { return }
        
        let headers: HTTPHeaders = [
            .authorization(bearerToken: token),
            .accept("application/json")
        ]
        
        AF.request(url, method: .get, headers: headers)
               .validate()
               .responseData { response in
                   switch response.result {
                   case .success(let data):
                       do {
                           if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                              let balance = jsonResponse["balance"] as? Double {
                               completion(.success(balance))
                           } else {
                               completion(.failure(NSError(domain: "Invalid response format", code: -1, userInfo: nil)))
                           }
                       } catch {
                           completion(.failure(error))
                       }
                       
                   case .failure(let error):
                       completion(.failure(error))
                   }
               }
    }

}
