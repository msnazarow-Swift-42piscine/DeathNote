//
//  Cell.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 04.09.2021.
//

import UIKit

class Cell: UITableViewCell, ModelRepresentable {
    var model: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
