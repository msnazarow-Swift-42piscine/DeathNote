//
//  ClearCell.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 19.09.2021.
//

import UIKit

final class ClearCell: Cell {
    static let identifier = "ClearCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let constraint = contentView.heightAnchor.constraint(equalToConstant: 10 * verticalTranslation)
        constraint.priority = UILayoutPriority(rawValue: 999)
        constraint.isActive = true
        backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
