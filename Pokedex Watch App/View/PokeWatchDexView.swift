//
//  PokeWatchDexView.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI

struct PokeWatchDexView: View {
    
    @EnvironmentObject var pokemons: PokemonViewModel
    
    var body: some View {
      PokemonList()
    }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokeWatchDexView()
            .environmentObject(PokemonViewModel())
    }
}


