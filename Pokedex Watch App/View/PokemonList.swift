//
//  PokemonList.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI

struct PokemonList: View {
    
    @EnvironmentObject var pokemonViewModel: PokemonViewModel
    
    @State private var searchPokemon = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach (searchPokemon == "" ? pokemonViewModel.pokemons : pokemonViewModel.pokemons.filter( {$0.name.contains(searchPokemon.lowercased().removingTrailingEmptyCharacters())})) { pokemon in
                    NavigationLink {
                       PokemonStatsDetailView(pokemon: pokemon)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokédex")
            .searchable(text: $searchPokemon)
            
          
      
        }
    }
    
    
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
            .environmentObject(PokemonViewModel())
    }
}


