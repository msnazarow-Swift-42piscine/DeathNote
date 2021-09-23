//
//  PersonCell.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//

import UIKit

final class PersonCell: Cell {
    static let identifier = "PersonCell"

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20 * verticalTranslation)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.font = .systemFont(ofSize: 15 * verticalTranslation)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    lazy var hstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, dateLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let gap = CGFloat(10)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(hstack)
        contentView.addSubview(descriptionLabel)
        contentView.backgroundColor = UIColor(patternImage: .paper)
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: gap),
            hstack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: gap),
            hstack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -gap),
            descriptionLabel.topAnchor.constraint(equalTo: hstack.bottomAnchor, constant: 2 * gap),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: gap),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -gap),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2 * gap),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateViews() {
        guard let model = model as? PersonCellModel else {
            print("PersonCell Error")
            return
        }
        nameLabel.text = model.name
        nameLabel.textAlignment = .justified
        dateLabel.text = model.date
        descriptionLabel.text = model.description
    }
}
