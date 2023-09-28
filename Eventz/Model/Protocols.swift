//
//  Protocols.swift
//  Eventz
//
//  Created by Caio Chaves on 17.06.23.
//

import Foundation

//// Protocol created to use the accept button inside the sheet
//protocol TermsOfConditionsDelegate {
//    func acceptDidTapped(view: LocationPage)
//}

//Protocol createed to align the UICollectionViewCells
protocol CollectionCellAutoLayout: AnyObject {
    var cachedSize: CGSize? { get set }
}

//Protocol to update favorite list
protocol updateFavoriteList {
   mutating func updateList(image: String, eventName: String, city: String)
}
