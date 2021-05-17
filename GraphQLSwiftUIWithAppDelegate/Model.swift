//
//  Model.swift
//  GraphQLSwiftUIWithAppDelegate
//
//  Created by Ramill Ibragimov on 17.05.2021.
//

import Foundation

struct Episode: Decodable {
    var id: String
    var name: String
    var episode: String
    var air_date: String?
    var characters: [EpisodeCharacter]?
    
    static var example: Episode {
        Episode(id: "1", name: "", episode: "", air_date: "", characters: [])
    }
}

struct EpisodesResponse: Decodable {
    var results: [Episode]
}

struct EpisodeCharacter: Decodable {
    var id: String
    var name: String
    var image: String
}
