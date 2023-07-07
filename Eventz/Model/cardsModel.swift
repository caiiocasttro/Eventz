//
//  cardsModel.swift
//  Eventz
//
//  Created by Caio Chaves on 26.06.23.
//

import Foundation

struct cardsModel {
    
    public var items: [String] = ["concert", "fashion", "exhibition", "exposition", "wine-tasting", "color-festival"]
    
    public var labels: [String] = ["Paléo Festival", "Fall fashion show", "Tech exhibition", "Exposition", "Wine tasting", "Colors festival"]
    
    public var cityLabels: [String] = ["Nyon, Switzerland", "Montreaux, Switzerland", "Genève, Switzerland", "Lausanne, Switzerland", "Lutry, Switzerland", "Morges, Switzerland"]
    
}

struct reviewsModel {
    
    public var title: [String] = ["Amazing!", "Finally :)", "Soooo great!"]
}

struct FavoriteCardsModel: updateFavoriteList {

    
    public var images: [String] = ["exposition", "wine-tasting", "color-festival"]
    
    public var eventLabel: [String] = ["Exposition", "Wine tasting", "Colors festival"]
    
    public var cities: [String] = [ "Lausanne, Switzerland", "Lutry, Switzerland", "Morges, Switzerland"]
    
   mutating func updateList(image: String, eventName: String, city: String) {
       
        self.images.append(contentsOf: [image])
        self.eventLabel.append(contentsOf: [eventName])
        self.cities.append(contentsOf: [city])
       
    }
    
}
