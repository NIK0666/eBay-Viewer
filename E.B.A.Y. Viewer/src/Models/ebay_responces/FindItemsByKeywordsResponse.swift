//
//  FindItemsByKeywordsResponse.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.


import Foundation

struct FindItemsByKeywordsResponse: Codable {
    let ack, version, timestamp: [String]
    let searchResult: [SearchResult]
    let paginationOutput: [PaginationOutput]
    let itemSearchURL: [String]
}

struct PaginationOutput: Codable {
    let pageNumber, entriesPerPage, totalPages, totalEntries: [String]
}

struct SearchResult: Codable {
    let count: String
    let item: [FindingResultItem]?
    
    enum CodingKeys: String, CodingKey {
        case count = "@count"
        case item
    }
}

struct FindingResultItem: Codable {
    let itemID, title: [String]
    let globalID: [String]
    let primaryCategory: [AryCategory]
    let galleryURL: [String]?
    let viewItemURL: [String]
    let paymentMethod: [String]?
    let autoPay: [String]
    let postalCode: [String]?
    let location: [String]
    let country: [String]
    let shippingInfo: [ShippingInfo]
    let sellingStatus: [SellingStatus]
    let listingInfo: [ListingInfo]
    let returnsAccepted: [String]
    let condition: [Condition]?
    let isMultiVariationListing, topRatedListing: [String]
    let subtitle: [String]?
    let secondaryCategory: [AryCategory]?
    let discountPriceInfo: [DiscountPriceInfo]?
    let galleryPlusPictureURL: [String]?
    let charityID: [String]?
    let productID: [ProductID]?
    
    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case title
        case globalID = "globalId"
        case primaryCategory, galleryURL, viewItemURL, paymentMethod, autoPay, postalCode, location, country, shippingInfo, sellingStatus, listingInfo, returnsAccepted, condition, isMultiVariationListing, topRatedListing, subtitle, secondaryCategory, discountPriceInfo, galleryPlusPictureURL
        case charityID = "charityId"
        case productID = "productId"
    }
}

struct Condition: Codable {
    let conditionID: [String]
    let conditionDisplayName: [String]?
    
    enum CodingKeys: String, CodingKey {
        case conditionID = "conditionId"
        case conditionDisplayName
    }
}

struct DiscountPriceInfo: Codable {
    let originalRetailPrice: [OriginalRetailPrice]?
    let pricingTreatment: [PricingTreatment]
    let soldOnEbay, soldOffEbay: [String]?
}

struct OriginalRetailPrice: Codable {
    let currencyID: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case currencyID = "@currencyId"
        case value = "__value__"
    }
}

enum PricingTreatment: String, Codable {
    case stp = "STP"
    case map = "MAP"
}

enum GlobalID: String, Codable {
    case ebayAu = "EBAY-AU"
    case ebayEnca = "EBAY-ENCA"
    case ebayMotor = "EBAY-MOTOR"
    case ebayUs = "EBAY-US"
    case ebayGb = "EBAY-GB"
}

struct ListingInfo: Codable {
    let bestOfferEnabled, buyItNowAvailable, startTime, endTime: [String]
    let listingType: [ListingType]
    let gift: [String]
    let watchCount: [String]?
    let buyItNowPrice, convertedBuyItNowPrice: [OriginalRetailPrice]?
}

enum ListingType: String, Codable {
    case auction = "Auction"
    case auctionWithBIN = "AuctionWithBIN"
    case fixedPrice = "FixedPrice"
    case storeInventory = "StoreInventory"
}

struct AryCategory: Codable {
    let categoryID, categoryName: [String]
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName
    }
}

struct ProductID: Codable {
    let type: TypeEnum
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case value = "__value__"
    }
}

enum TypeEnum: String, Codable {
    case referenceID = "ReferenceID"
}

struct SellingStatus: Codable {
    let currentPrice, convertedCurrentPrice: [OriginalRetailPrice]
    let sellingState: [SellingState]
    let timeLeft: [String]
    let bidCount: [String]?
}

enum SellingState: String, Codable {
    case active = "Active"
}

struct ShippingInfo: Codable {
    let shippingServiceCost: [OriginalRetailPrice]?
    let shippingType: [ShippingType]
    let shipToLocations: [ShipToLocation]
    let expeditedShipping, oneDayShippingAvailable: [String]
    let handlingTime: [String]?
}

enum ShipToLocation: String, Codable {
    case worldwide = "Worldwide"
}

enum ShippingType: String, Codable {
    case calculated = "Calculated"
    case calculatedDomesticFlatInternational = "CalculatedDomesticFlatInternational"
    case flat = "Flat"
    case flatDomesticCalculatedInternational = "FlatDomesticCalculatedInternational"
    case free = "Free"
    case freePickup = "FreePickup"
    case freight = "Freight"
    case notSpecified = "NotSpecified"
}
