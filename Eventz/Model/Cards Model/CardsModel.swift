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
    
    //TODO: Finish imlplementation
    var date: String {
        switch self {
        case .concert:
            return "2024-02-25T20:00:00"
        case .fashion:
            return "2024-05-05T19:00:00"
        case .exhibition:
            return "2024-03-12T18:00:00"
        case .exposition:
            return "2023-12-18T12:00:00"
        case .wineTasting:
            return "2023-12-25T21:00:00"
        case .colorsFestival:
            return "2024-06-20T21:00:00"
        }
    }
    
}

struct reviewsModel {
    
    public var title: [String] = ["Amazing!", "Finally :)", "Soooo great!"]
}
