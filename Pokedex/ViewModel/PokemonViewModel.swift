//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Bruno  on 20/05/24.
//

import Foundation
import SwiftUI

private let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var filteredPokemon = [Pokemon]()
    
    func fetchPokemon() {
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
    }
    
    func filterPokemon(by filter: String) {
        filteredPokemon = pokemon.filter({ $0.type == filter })
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
