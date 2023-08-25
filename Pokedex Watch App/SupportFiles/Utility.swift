//
//  UtilityViews.swift
//  Pokedex Watch App
//
//  Created by Kevin Martinez on 8/20/23.
//

import SwiftUI



extension String {
    ///  Capitalize the firs letter of a string
    /// - Returns: Return the String with it first character capitalized

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating private func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    
    
    
    
    ///  Remve all empty espaces on the right size of a string.
    /// - Returns: A string without spaces on the right 
    func removingTrailingEmptyCharacters() -> String {
        var trimedString = self
        while
            trimedString.last?.isWhitespace == true {
            trimedString.removeLast()
        }
        return trimedString
        }
}
