//
//  PokemonViewModel.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI
import Combine

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonEntry] = []
    
    
    
    init() {
        self.fetchPokemons()
    }
    
    
    private var fetchPokemonsCancellable: AnyCancellable?
    
    
    private func fetchPokemons() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {return}
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError (.badServerResponse)
                }
                
                return data
            }
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .sink { (completion) in

            } receiveValue: { [weak self] (returnedPokemons) in
                self?.pokemons = returnedPokemons.results
            }
        
        fetchPokemonsCancellable = publisher
    }
    
    
    func getPokemonInfo (url: String, completion:@escaping (PokemonInfo) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonInfo = try! JSONDecoder().decode(PokemonInfo.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonInfo)
            }
        }.resume()
    }
    
    
    func getPokemonImage (url: String, completion:@escaping (UIImage) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonImage = UIImage(data: data)!
            
            DispatchQueue.main.async {
                completion(pokemonImage)
            }
        }.resume()
    }
    

}
    
    




