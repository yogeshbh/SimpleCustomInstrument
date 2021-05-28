//
//  Book.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import Foundation


import Foundation
import UIKit

// MARK: - Welcome
struct Welcome: Codable {
//    let kind: String
//    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
//    let kind, id, etag: String
//    let selfLink: String
    let volumeInfo: Book
//    let saleInfo: SaleInfo
//    let accessInfo: AccessInfo
//    let searchInfo: SearchInfo
//    enum CodingKeys: String, CodingKey {
//        case kind, id, etag
//        case selfLink
//        case volumeInfo
//    }
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country, viewability: String
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: String
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: String
    let quoteSharingAllowed: Bool
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country, saleability: String
    let isEbook: Bool
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct Book: Codable {
    var image: UIImage?
    let title: String
//    let authors: [String]
//    let publisher, publishedDate: String
    let volumeInfoDescription: String?
//    let industryIdentifiers: [IndustryIdentifier]
//    let readingModes: ReadingModes
//    let pageCount: Int
//    let printType: String
//    let categories: [String]
//    let averageRating, ratingsCount: Int
//    let maturityRating: String
//    let allowAnonLogging: Bool
//    let contentVersion: String
//    let panelizationSummary: PanelizationSummary
    var imageLinks: ImageLinks?
//    let language: String
//    let previewLink, infoLink: String
//    let canonicalVolumeLink: String

    enum CodingKeys: String, CodingKey {
//        case authors
        case title
//        case publisher, publishedDate
        case imageLinks
        case volumeInfoDescription = "description"
    }
//    enum CodingKeys: String, CodingKey {
////        case authors
//        case title,  publisher, publishedDate
////        case volumeInfoDescription = "description"
////        case imageLinks
////        case industryIdentifiers, readingModes, pageCount, printType, categories, averageRating, ratingsCount, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, imageLinks, language, previewLink, infoLink, canonicalVolumeLink
//    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type, identifier: String
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}
