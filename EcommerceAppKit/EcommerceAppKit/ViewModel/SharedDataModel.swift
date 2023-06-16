//
//  SharedDataModel.swift
//  project
//
//  Created by anastasia on 6/15/23.
//  Copyright © 2023 anastasia. All rights reserved.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    // Detail Product Data...
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    // Matched Geometry Effect from Search Page...
    @Published var fromSearchPage: Bool = false
   
    // Liked Products...
    @Published var likedProducts: [Product] = []
    
    // Basket Products...
    @Published var cartProducts: [Product] = []
    
    //Calculating Total Price
    func getTotalPrice()->String{
        var total: Int = 0
        cartProducts.forEach { product in
            let price = product.price.replacingOccurrences(of : "$", with: "") as NSString
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            total += priceTotal
        }
        return "$\(total)"
    }
}

