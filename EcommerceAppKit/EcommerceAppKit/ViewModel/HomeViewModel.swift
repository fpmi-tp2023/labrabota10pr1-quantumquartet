//
//  HomeViewModel.swift
//  EcommerceAppKit
//
//  Created by Xenia on 13.06.2023.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject{
    @Published var productType: ProductType = .Wearable
    
    // products:
    
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price: "$559", productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$200", productImage: "SamsungWatch"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$480", productImage: "AppleWatch4"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$1000", productImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$845", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$630", productImage: "iPhone11"),
        Product(type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$456", productImage: "iPhoneSE"),
        Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$1200", productImage: "MacBookAir"),
        Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1400", productImage: "MacBookPro"),
        Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
        Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir4"),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
        
    ]
    
    // Filtered
    @Published var filteredProducts: [Product] = []
    
    // more products
    
    @Published var showMoreProductsOnType: Bool = false
    
    // search data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var  searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: {str in
                if str != ""{
                    self.filterProductBySearch()
                }else{
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4)
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            DispatchQueue.main.async {
                
                self.searchedProducts = results.compactMap({product in
                    return product
                })
            }
        }
    }
}
