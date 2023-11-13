//
//  FetchController.swift
//  BB Quote
//
//  Created by Jiang Lin on 12/11/2023.
//

import Foundation

struct FetchController{
    enum NetworkError: Error {
        case badUrl, badResponse
    }
    // define baseUrl
    private let baseUrl = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchQuote(from show: String) async throws -> Quote {
        
        let quoteUrl = baseUrl.appending(path: "quotes/random")
        var quoteComponents = URLComponents(url: quoteUrl, resolvingAgainstBaseURL: true)
        let quoteQueryItem = URLQueryItem(name: "production", value: show.spaceToPlus)
        quoteComponents?.queryItems = [quoteQueryItem]
        
        guard let fetchUrl = quoteComponents?.url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Character {
        let characterUrl = baseUrl.appending(path: "characters")
        var characterComponents = URLComponents(url: characterUrl, resolvingAgainstBaseURL: true)
        let characterQueryItem = URLQueryItem(name: "name", value: name.spaceToPlus)
        characterComponents?.queryItems = [characterQueryItem]
        
        guard let fetchUrl = characterComponents?.url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NetworkError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let character = try decoder.decode([Character].self, from: data)
        return character[0]
    }
}
