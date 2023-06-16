//
//  LocationView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 15.06.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
                MapMarker(coordinate: location.coordinates, tint: .red)

            })
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                ZStack{
                    ForEach(vm.locations){ location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.mapLocation.name)
                    .font(.custom(customFont, size: 25).bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundColor(.primary)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationList ? 100 : 0))
            }

            }
            
            if vm.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
    }
}
