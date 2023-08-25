//
//  PokemonImageView.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/21/23.
//

import SwiftUI

struct PokemonImageView: View {
    
    var pokemon: PokemonEntry
    var width: CGFloat
    var height: CGFloat
    
    
    @State private var pokemonSprite = ""
    
    var body: some View {
        
        
            AsyncImage(url: URL(string: pokemonSprite),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    
            }, placeholder: {
                ProgressView()
            })
            .onAppear {
                
                    getSpriteUrl(url: pokemon.url)
           
            }
            
        }
    
    
    
    func getSpriteUrl (url: String ) {
        
        var tempSprite: String?
        PokemonViewModel().getPokemonInfo(url: url) { pokemonInfo in
            tempSprite = pokemonInfo.sprites.other.home.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
    
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(pokemon: PokemonEntry (name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"), width: 50, height: 50)
    }
}


