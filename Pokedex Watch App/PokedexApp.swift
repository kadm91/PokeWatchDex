//
//  PokedexApp.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI

@main
struct Pokedex_Watch_AppApp: App {
    
   @StateObject var pokemonViewModel = PokemonViewModel()
    
    var body: some Scene {
        WindowGroup {
            PokeWatchDexView()
              .environmentObject(pokemonViewModel)
        }
    }
}
