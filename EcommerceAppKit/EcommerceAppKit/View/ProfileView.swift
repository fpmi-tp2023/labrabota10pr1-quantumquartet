//
//  ProfileView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 14.06.2023.
//

import SwiftUI

struct ProfileView: View {
//    let tintColor: Color
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                
                Section("General") {
                    
                    NavigationLink(destination: TestView()) {
                        HStack {
                            SettingsRowView(imageName: "person", title: "Edit Profile", tintColor: Color(.systemGray))
                        }
                    }
//                    Button {
//                        print("Edit Profile")
//                    } label: {
//                        HStack {
//                            HStack {
//                                SettingsRowView(imageName: "person", title: "Edit Profile", tintColor: Color(.systemGray))
//                                Spacer()
//
//                                Image(systemName: "chevron.right")
//                                    .imageScale(.small)
//                                    .font(.title)
//    //                                .foregroundColor(.systemGray)
//
//                            }
//                        }
//                    }
                   
                    
                        // Other content of the Profile view
                        
                        NavigationLink(destination: LocationsView()) {
                            HStack {
                                SettingsRowView(imageName: "location", title: "Shopping Address", tintColor: Color(.systemGray))
                            }
                        }
                    
                    
//                    Button {
//                        print("Shopping Address")
//                    } label: {
//                        NavigationLink(destination: MainPage()) {
//                            HStack {
//                                SettingsRowView(imageName: "location", title: "Shopping Address", tintColor: Color(.systemGray))
//                                Spacer()
//
//                                Image(systemName: "chevron.right")
//                                    .imageScale(.small)
//                                    .font(.title)
//                                    .foregroundColor(Color(.systemGray))
//
//                            }
//                        }
//                    }
//
                    NavigationLink(destination: TestView()) {
                        HStack {
                            SettingsRowView(imageName: "dollarsign.arrow.circlepath", title: "Order History", tintColor: Color(.systemGray))
                        }
                    }
//
//                    Button {
//                        print("Order History")
//                    } label: {
//                        HStack {
//                            HStack {
//                                SettingsRowView(imageName: "dollarsign.arrow.circlepath", title: "Order History", tintColor: Color(.systemGray))
//                                Spacer()
//
//                                Image(systemName: "chevron.right")
//                                    .imageScale(.small)
//                                    .font(.title)
//    //                                .foregroundColor(.systemGray)
//
//                            }
//                        }
//                    }
                    
                    NavigationLink(destination: TestView()) {
                        HStack {
                            SettingsRowView(imageName: "bell", title: "Notifications", tintColor: Color(.systemGray))
                        }
                    }
                    
//                    Button {
//                        print("Notifications")
//                    } label: {
//                        HStack {
//                            HStack {
//                                SettingsRowView(imageName: "bell", title: "Notification", tintColor: Color(.systemGray))
//                                Spacer()
//
//                                Image(systemName: "chevron.right")
//                                    .imageScale(.small)
//                                    .font(.title)
//    //                                .foregroundColor(.systemGray)
//
//                            }
//                        }
//                    }
                    
                    NavigationLink(destination: TestView()) {
                        HStack {
                            SettingsRowView(imageName: "creditcard", title: "Show cards", tintColor: Color(.systemGray))
                        }
                    }
                    
//                    Button {
//                        print("Show cards")
//                    } label: {
//                        HStack {
//                            HStack {
//                                SettingsRowView(imageName: "creditcard", title: "Cards", tintColor: Color(.systemGray))
//                                Spacer()
//                                
//                                Image(systemName: "chevron.right")
//                                    .imageScale(.small)
//                                    .font(.title)
//    //                                .foregroundColor(.systemGray)
//                                
//                            }
//                        }
//                    }
                    
                }
                
                
                Section("Account") {
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                        }
                    }
                    
                    Button {
                        print("Delete Account")
                    } label: {
                        HStack {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        }
                    }
                    
                }
            }
        }
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
