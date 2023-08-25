//
//  PokemonRow.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI

struct PokemonRow: View {
    
    var pokemon: PokemonEntry
    @State private var pokemonSprite = ""
    
    var body: some View {
        HStack () {
            
            PokemonImageView(pokemon: pokemon, width: 60, height: 60)
                .frame(width: 50, height: 80)
            
            Spacer()
            
            Text(pokemon.name.capitalizingFirstLetter())
                .font(.title3)
                .fontWeight(.semibold)
                
            
            Spacer()
            
        }
    }
    
    
    func getSpriteUrl (url: String) {
        var tempSprite: String?
        PokemonViewModel().getPokemonInfo(url: url) { pokemonInfo in
            tempSprite = pokemonInfo.sprites.other.home.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
 
}








struct PokemonRow_Previews: PreviewProvider {

    static var previews: some View {
        PokemonRow(pokemon: PokemonEntry (name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
            
    }
}
