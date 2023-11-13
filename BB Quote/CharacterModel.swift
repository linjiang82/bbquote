//
//  CharacterModel.swift
//  BB Quote
//
//  Created by Jiang Lin on 12/11/2023.
//

import Foundation

struct Character: Decodable {
let name: String
let birthday: String
let occupations: [String]
    let images: [URL]
let aliases: [String]
    let portrayedBy: String
    
}
