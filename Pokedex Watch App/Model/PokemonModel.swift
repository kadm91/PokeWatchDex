//
//  File.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import Foundation

// This structs models represent the json we get from the pokemon api so we can decode that api.

struct Pokemon : Codable, Hashable{
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable, Hashable {
    var name: String
    var url: String
}

struct PokemonInfo: Codable {
    var sprites: PokemonImages
    var weight: Int
    var height: Int
    var stats: [Stats]
    var types: [PokemonTypes]
}

struct PokemonTypes: Codable {
    var type: PokemonType
}


struct PokemonType: Codable {
    var name: String
}

struct Stats: Codable {
    var base_stat: Int
    var stat: Stat
}

struct Stat: Codable {
    var name: String
}

struct PokemonImages: Codable {
    var front_default: String
    var other: other
}

struct other: Codable {
    var home: HomeImage
}

struct HomeImage: Codable {
    var front_default: String
}

//MARK: - Extensions

// This extations are use to use the name as the identifier for this structs to conform to Hashable

extension PokemonTypes: Identifiable {
    var id: String {return self.type.name}
}

extension PokemonType: Identifiable {
    var id: String { return self.name}
}

extension PokemonEntry: Identifiable {
    var id: String {return self.name}
}
