//
//  LocalizationManager.swift
//  EcommerceAppKit
//
//  Created by Xenia on 15.06.2023.
//

import Foundation


class LocalizationManager {
    static let shared = LocalizationManager()
    
    private init() {}
    
    func setLanguage(_ languageCode: String) {
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
