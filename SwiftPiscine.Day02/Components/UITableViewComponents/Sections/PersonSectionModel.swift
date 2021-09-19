//
//  PersonSectionModel.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//

import Foundation

final class PersonSectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable] = []

    init(_ properties: [PersonModel]) {
        properties.forEach { property in
            rows.append(PersonCellModel(property))
        }
    }
}
