//
//  PersonCellModel.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//

import Foundation

struct PersonModel {
    let name: String
    let date: Date
    let description: String
}

struct PersonCellModel: CellIdentifiable {
    let name: String
    let date: String
    let description: String
    var cellIdentifier: String { "PersonCell" }

    var cellHeight: Float { Float(85.0 * verticalTranslation) }

    init(_ property: PersonModel) {
        name = property.name
        date = property.date.iso8601String
        description = property.description
    }
}
