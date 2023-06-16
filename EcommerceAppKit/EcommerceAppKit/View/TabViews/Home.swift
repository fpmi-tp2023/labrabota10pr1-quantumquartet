//
//  Home.swift
//  EcommerceAppKit
//
//  Created by Xenia on 13.06.2023.
//

import SwiftUI

struct Home: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: SharedDataModel
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                // search
                ZStack {
                    if homeData.searchActivated{
                        SearchBar()
                    }
                    else {
                        SearchBar()
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal, 25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeData.searchActivated = true
                    }
                }
                
                Text("Order online\ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                // Products
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases, id: \.self){type in
                            // Product Type View
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
                
                // Products Page
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.filteredProducts){ product in
                            // Product Card View
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top, -40)
                }
//                .padding(.top, 30)
                
                // See more btn
                Button{
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    Label{
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 10)
            }
            .padding(.vertical, 75)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray5)).ignoresSafeArea()
        .onChange(of: homeData.productType){ newValue in
            homeData.filterProductByType()
        }
        .sheet(isPresented: $homeData.showMoreProductsOnType){
            
        } content: {
            MoreProductsView()
        }
        .overlay(
            ZStack{
                if homeData.searchActivated{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }
    
    @ViewBuilder
    func SearchBar()->some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            Capsule()
                .strokeBorder(Color.gray, lineWidth: 0.8)
        )
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        VStack(spacing: 10){

            ZStack {
                if sharedData.showDetailProduct {
                    Image(product.productImage)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .opacity(0)
                }
                else {
                    Image(product.productImage)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                }
            }
            .frame(width: getRect().width / 2.5, height: getRect().height / 2.5)
            // sth with image
            .offset(y: -80)
            .padding(.bottom, -80)
            
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top, -80)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
                .padding(.top, -60)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(.black))
                .padding(.top, -40)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top, 80)
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
                
            }
        }
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)->some View{
        Button {
            withAnimation{
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(homeData.productType == type ? Color(.black) : Color.gray)
                .padding(.bottom, 10)
                .overlay(
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color(.black))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        }
                        else {
                            Capsule()
                                .fill(Color(.clear))
                                .frame(height: 2)
                        }
                    }
                        .padding(.horizontal, -5)
                    ,alignment: .bottom
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}


