//
//  Constants.swift
//  BB Quote
//
//  Created by Jiang Lin on 12/11/2023.
//

import Foundation


extension String {
  var spaceToPlus: String  {
    self.replacingOccurrences(of: " ", with: "+")
  }
  
  var noSpace: String  {
    self.replacingOccurrences(of: " ", with: "")
  }
  
  var lowerCasedAndNoSpace: String {
    self.noSpace.lowercased()
  }
}

enum Constants {
  static let BB = "Breaking Bad"
  static let BCS = "Better Call Saul"
  static let previewCharacter: Character = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let data = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
    let charater = try! decoder.decode([Character].self, from: data)
    return charater[0]
  }()
}
