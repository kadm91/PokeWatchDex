//
//  PokemonStatsDetailView.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/21/23.
//

import SwiftUI

struct PokemonStatsDetailView: View {
   
    var pokemon: PokemonEntry
    
    @State private var pokemonInfo: PokemonInfo?
   
    var body: some View {
        
        NavigationStack {
            TabView {
                pokemonGeneralInformationView
                statsView
            }
            .navigationTitle(pokemon.name.capitalizingFirstLetter())
            .navigationBarTitleDisplayMode(.inline)
            .tabViewStyle(.page)
        }
        .onAppear{
            getPokemonInfo(for: pokemon.url)
            
        }
    }
    
    //MARK: - Views Variables
    
    var pokemonGeneralInformationView: some View {
        VStack (spacing: 10) {
            
            PokemonImageView(pokemon: pokemon, width: 105, height: 105)
                .font(.title3)
                .padding(.horizontal)
            
            
            if let types = pokemonInfo?.types {
                
                HStack(spacing: 20) {
                    
                    ForEach (types) { type in
                        
                        Image(returnPokemonTypeImage(for: type.type.name))
                            .resizable()
                            .frame(width: 65, height: 72)
                            .aspectRatio(contentMode: .fill)
                        
                    }
                }
            }
        }
    }
    
    var statsValueView: some View {
        ScrollView {
            
            StatValueView(statName: "HP", statValue: (pokemonInfo?.stats[0].base_stat) ?? 0, statMaxValue: Constants.maxHP, color: .green)
            
            
            Divider()
            
            StatValueView(statName: "ATK", statValue: (pokemonInfo?.stats[1].base_stat) ?? 0, statMaxValue: Constants.maxATK, color: .red)
            
            Divider()
            
            StatValueView(statName: "DEF", statValue: (pokemonInfo?.stats[2].base_stat) ?? 0, statMaxValue: Constants.maxDEF, color: .blue)
            
            Divider()
            
            StatValueView(statName: "SPD", statValue: (pokemonInfo?.stats[5].base_stat) ?? 0, statMaxValue: Constants.maxSPD, color: .mint)
        }
    }
    
    var titleView: some View {
        HStack {
            PokemonImageView(pokemon: pokemon, width: 50, height: 60)
                .frame(width: 50, height: 40)
                .padding(.bottom)
            
            Spacer()
            
            Text("Stats")
                .font(.title2)
            Spacer()
            
        }
    }
    
    var statsView: some View {
        
        VStack {
            
            titleView
            
            Divider()
            
            statsValueView
        }
      
        
    }
    
    //MARK: - Functions
    func getPokemonInfo (for url: String ) {
        
        var tempInfo: PokemonInfo?
        PokemonViewModel().getPokemonInfo(url: url) { pokemonInfo in
            tempInfo = pokemonInfo
            self.pokemonInfo = tempInfo
        }
    }
    
    func returnPokemonTypeImage (for type: String) -> String {
        switch type {
        case "normal": return "normal"
        case "fire": return "fire"
        case "water": return "water"
        case "grass": return "grass"
        case "electric": return "electric"
        case "ice": return "ice"
        case "fighting": return "fighting"
        case "poison": return "poison"
        case "ground": return "ground"
        case "flying": return "flying"
        case "psychic": return "psychic"
        case "bug": return "bug"
        case "rock": return "rock"
        case "ghost": return "ghost"
        case "dragon": return "dragon"
        case "dark": return "dark"
        case "steel": return "steel"
        case "fairy": return "fairy"
            
            
        default: return ""
           
        }
    }
    
    //MARK: - Constatns
    
    private struct Constants {
        static var maxHP = 255
        static var maxATK = 190
        static var maxDEF = 230
        static var maxSPD = 200
    }
    
}




//MARK: - Preview

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsDetailView(pokemon: PokemonEntry (name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}


   

