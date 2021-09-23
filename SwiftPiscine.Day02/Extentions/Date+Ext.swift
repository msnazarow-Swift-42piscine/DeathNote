//
//  Date+Ext.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 19.09.2021.
//

import Foundation

extension Date {
    var iso8601String: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return formatter.string(from: self)
    }
}
