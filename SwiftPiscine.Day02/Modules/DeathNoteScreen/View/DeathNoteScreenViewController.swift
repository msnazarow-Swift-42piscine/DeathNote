//
//  DeathNoteScreenViewController.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//
//

import UIKit

class DeathNoteScreenViewController: UITableViewController {
    // MARK: - Properties

    var presenter: ViewToPresenterDeathNoteScreenProtocol?

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        guard let presenter = presenter else {
            print("DeathNoteScreenViewController Assembly Error")
            return
        }
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = presenter.dataSource
        tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.identifier)
        tableView.register(ClearCell.self, forCellReuseIdentifier: ClearCell.identifier)
        tableView.allowsSelection = false
    }

    func setupUI() {
        title = "Death Note"
        tableView.backgroundColor = .clear
        tableView.overrideUserInterfaceStyle = .light
        tableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }

    @objc private func addButtonTapped() {
        presenter?.addButtonTapped()
    }
}

extension DeathNoteScreenViewController: PresenterToViewDeathNoteScreenProtocol {
    // TODO: Implement View Output Methods
    func update() {
        tableView.reloadData()
    }
}
