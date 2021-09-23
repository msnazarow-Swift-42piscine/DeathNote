//
//  DateFormatter+Ext.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 19.09.2021.
//

import Foundation

extension DateFormatter {
    static let ddmmmmyyyy: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return dateFormatter
    }()
}
