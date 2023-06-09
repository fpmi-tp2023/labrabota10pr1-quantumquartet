//
//  CartPage.swift
//  project
//
//  Created by anastasia on 6/15/23.
//  Copyright © 2023 anastasia. All rights reserved.
//

import SwiftUI

struct CartPage: View {
    // For Designing...
    // @EnvironmentObject var homeData: HomeViewModel
    @EnvironmentObject var sharedData: SharedDataModel
    
    //Delete Option...
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            
                            Text("Basket")
                                .font(.custom(customFont, size: 20).bold())
                            Spacer()
                            
                            Button {
                                withAnimation{
                                    showDeleteOption.toggle()
                                }
                            }
                            label: {
                                Image("Delete")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                            }
                            .opacity(sharedData.cartProducts.isEmpty ? 0 : 1)
                        }
                        
                        // Checking if liked products are empty
                        if sharedData.cartProducts.isEmpty{
                            Group{
                                Image("NoLiked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top, 35)
                                Text("No Items added")
                                     .font(.custom(customFont, size: 25))
                                     .fontWeight(.semibold)
                                Text("Hit the plus button to save into basket.")
                                    .font(.custom(customFont, size: 18))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        else{
                            
                            // Displaying Products...
                            VStack(spacing: 15){
                                
                                // For Designing...
                                ForEach($sharedData.cartProducts){$product in
                                    
                                    HStack(spacing: 0){
                                        if showDeleteOption{
                                            Button{
                                                deleteProduct(product: product)
                                            }
                                            label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.trailing)
                                        }
                                        
                                        CardView(product: $product)
                                    }
                                }
                            }
                            .padding(.top, 25)
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                
                // Showing Total and Check Out Button...
                if !sharedData.cartProducts.isEmpty{
                    Group{
                        HStack{
                            Text("Total")
                                .font(.custom(customFont, size: 14))
                                .fontWeight(.semibold)
                            Spacer()
                            
                            Text("$399")
                                .font(.custom(customFont, size: 18).bold())
                                .foregroundColor(Color("Purple"))
                        }
                        
                        Button{
                            
                        }
                        label: {
                            Text(sharedData.getTotalPrice())
                                .font(.custom(customFont, size: 18).bold())
                                .foregroundColor(.white)
                                .padding(.vertical, 18)
                                .frame(maxWidth: .infinity)
                                .background(Color("Purple"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        //.padding(.horizontal, 25)
                        .padding(.vertical)
                    }
                    .padding(.horizontal, 25)
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(.systemGray5).ignoresSafeArea()
            )
        }
    }
    
//    @ViewBuilder

    func deleteProduct(product: Product){
        
        if let index = sharedData.cartProducts.firstIndex(where: { currentProduct in
            
            return product.id == currentProduct.id
        }){
            let _ = withAnimation{
                // Removing...
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
}


struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
    }
}

struct CardView: View{
    
    //Making Product as Binding so as to update in Real Time...
    @Binding var product: Product
    
    var body: some View {
        HStack(spacing: 15){
                   Image(product.productImage)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 100, height: 100)
                   
                   VStack(alignment: .leading, spacing: 8){
                       
                       Text(product.title)
                           .font(.custom(customFont, size: 18).bold())
                           .lineLimit(1)
                       
                       Text(product.subtitle)
                           .font(.custom(customFont, size: 17))
                           .fontWeight(.semibold)
                           .foregroundColor(Color("Purple"))
                       
                       //Text("Type: \(product.type.rawValue)")
                       //.font(.custom(customFont, size: 13))
                       //.foregroundColor(.gray)
                       
                       // Quantity Buttons...
                       HStack(spacing: 10){
                           Text("Quantity: ")
                               .font(.custom(customFont, size: 14))
                               .foregroundColor(.gray)
                           
                           Button{
                               product.quantity = (product.quantity > 0 ? (product.quantity - 1) : 0)
                           }
                           label: {
                               Image(systemName: "minus")
                                   .font(.caption)
                                   .foregroundColor(.white)
                                   .frame(width: 20, height: 20)
                                   .background(Color("Quantity"))
                                   .cornerRadius(4)
                           }
                           
                           Text("\(product.quantity)")
                               .font(.custom(customFont, size: 14))
                               .fontWeight(.semibold)
                               .foregroundColor(.gray)
                           Button{
                               
                           }
                           label: {
                               Image(systemName: "plus")
                                   .font(.caption)
                                   .foregroundColor(.white)
                                   .frame(width: 20, height: 20)
                                   .background(Color("Quantity"))
                                   .cornerRadius(4)
                           }
                       }
                   }
               }
               .padding(.horizontal, 10)
               .padding(.vertical, 10)
               .frame(maxWidth: .infinity, alignment: .leading)
               .background(
                   Color.white.cornerRadius(10)
               )
    }
}
