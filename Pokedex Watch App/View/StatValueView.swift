//
//  StatValueView.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/22/23.
//

import SwiftUI

struct StatValueView: View {
    
    var statName: String
    var statValue: Int
    var statMaxValue: Int
    var color: Color
    
    
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Text(statName)
                Spacer()
                Text("Max")
            }
            
            
            ProgressView( value: CGFloat(statValue) , total: CGFloat(statMaxValue))
                .padding(.vertical)
                .frame(height: 20)
                .tint(color)
            
            
            HStack {
                Text(statValue,format: .number)
                Spacer()
                Text(statMaxValue,format: .number)
            }
        }
        .padding(.horizontal)
    }
}

struct StatValueView_Previews: PreviewProvider {
    static var previews: some View {
        StatValueView(statName: "HP", statValue: 45, statMaxValue: 100, color: .green)
    }
}
