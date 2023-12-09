//
//  CardsModel.swift
//  Eventz
//
//  Created by Caio Chaves on 26.06.23.
//

import Foundation


enum CardsModel: String {
    
    static let events: [String] = ["concert", "fashion", "exhibition", "exposition", "wine-tasting", "color-festival"]
    
    static var favoriteEvents: [String] = []
    
    case concert = "concert"
    case fashion = "fashion"
    case exhibition = "exhibition"
    case exposition = "exposition"
    case wineTasting = "wine-tasting"
    case colorsFestival = "color-festival"
    
    
    var eventsName: String {
        switch self {
        case .concert:
            return "Paléo Festival"
        case .fashion:
            return "Fall fashion show"
        case .exhibition:
            return "Tech exhibition"
        case .exposition:
            return "Exposition"
        case .wineTasting:
            return "Wine Tasting"
        case .colorsFestival:
            return "Colors Festival"
        }
    }
    
    var city: String {
        switch self {
        case .concert:
            return "Nyon, Switzerland"
        case .fashion:
            return "Montreaux, Switzerland"
        case .exhibition:
            return "Genève, Switzerland"
        case .exposition:
            return "Lausanne, Switzerland"
        case .wineTasting:
            return "Lutry, Switzerland"
        case .colorsFestival:
            return "Morges, Switzerland"
        }
    }
    
}

struct reviewsModel {
    
    public var title: [String] = ["Amazing!", "Finally :)", "Soooo great!"]
}

//struct FavoriteCardsModel {
//
//    
//    public var images: [String] = ["exposition", "wine-tasting", "color-festival"]
//    
//    public var eventLabel: [String] = ["Exposition", "Wine tasting", "Colors festival"]
//    
//    public var cities: [String] = [ "Lausanne, Switzerland", "Lutry, Switzerland", "Morges, Switzerland"]
//    
//}
