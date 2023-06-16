import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Apple Store",
            cityName: "New York",
            coordinates: CLLocationCoordinate2D(latitude: 40.7636, longitude: -73.9743),
            description: "The Apple Store Fifth Avenue is a flagship retail store located on Fifth Avenue in Midtown Manhattan, New York City. It is known for its distinctive glass cube entrance and is one of the most iconic Apple stores in the world.",
            imageNames: [
                "apple1",
                "applestore-fifthavenue-2",
                "applestore-fifthavenue-3",
            ],
            link: "https://www.apple.com/retail/fifthavenue/"),
        
        Location(
            name: "Best Buy",
            cityName: "New York",
            coordinates: CLLocationCoordinate2D(latitude: 40.7342, longitude: -73.9903),
            description: "Best Buy Union Square is a popular electronics retailer located in the Union Square neighborhood of Manhattan, New York City. It offers a wide range of technology products, including iPhones, tablets, laptops, and more.",
            imageNames: [
                "bestbuy",
                "bestbuy-unionsquare-2",
                "bestbuy-unionsquare-3",
            ],
            link: "https://www.bestbuy.com/store/141/"),
        
        Location(
            name: "Micro Center",
            cityName: "New York",
            coordinates: CLLocationCoordinate2D(latitude: 33.7193, longitude: -117.8359),
            description: "Micro Center Tustin is a computer and electronics store located in Tustin, California. It is a popular destination for tech enthusiasts and offers a wide range of products, including Apple devices, tablets, laptops, and more.",
            imageNames: [
                "microcenter",
                "microcenter-tustin-2",
                "microcenter-tustin-3",
            ],
            link: "https://www.microcenter.com/site/stores/tustin.aspx"),
        
        Location(
            name: "B&H",
            cityName: "New York",
            coordinates: CLLocationCoordinate2D(latitude: 40.7527, longitude: -73.9935),
            description: "B&H Photo Video is a well-known electronics retailer located in New York City. It is a go-to destination for photographers, videographers, and tech enthusiasts, offering a wide range of products including iPhones, cameras, laptops, and more.",
            imageNames: [
                "bandphotovideo",
                "bandhphotovideo-2",
                "bandhphotovideo-3",
            ],
            link: "https://www.bhphotovideo.com/"),
        
        Location(
            name: "Microsoft Store",
            cityName: "New York",
            coordinates: CLLocationCoordinate2D(latitude: 40.7623, longitude: -73.9715),
            description: "The Microsoft Store Fifth Avenue is a flagship retail store located on Fifth Avenue in Midtown Manhattan, New York City. It showcases Microsoft's latest products and offers a range of devices, including Surface tablets, laptops, and more.",
            imageNames: [
                "microsoftstore-fifthavenue-1",
                "microsoftstore-fifthavenue-2",
                "microsoftstore-fifthavenue-3",
            ],
            link: "https://www.microsoft.com/en-us/store/locations/ny/new-york/fifth-avenue/store-8"),
    ]
    
}
