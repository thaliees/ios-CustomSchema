//
//  ItemModel.swift
//  UniversalLinks
//
//  Created by Thaliees on 4/15/20.
//  Copyright © 2020 Thaliees. All rights reserved.
//

import Foundation

// MARK: - ItemModel
struct ItemModel: Codable {
    let wines: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id, name, wineDescription: String
        let category: String
        let subcategory: String
        let image: String
        let lastModification: String
        let store: Store
        let characteristics: Characteristics
        let salesConfig: SalesConfig

        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
            case wineDescription = "description"
            case category, subcategory, image, lastModification, store, characteristics, salesConfig
        }
}

// MARK: - Store
struct Store: Codable {
    let id, name: String
    let avatar: String
    let phoneContact, emailContact: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, avatar, phoneContact, emailContact
    }
}

// MARK: - Characteristics
struct Characteristics: Codable {
    let volume: String
    let volAlch: String
    let compositions: [String]
    let pairsWellWith: [String]
}

// MARK: - SalesConfig
struct SalesConfig: Codable {
    let publicPrice, memberPrice: Int
}

// MARK: - ErrorModel
struct ErrorModel: Codable {
    let code: Int
    let message: String
}

