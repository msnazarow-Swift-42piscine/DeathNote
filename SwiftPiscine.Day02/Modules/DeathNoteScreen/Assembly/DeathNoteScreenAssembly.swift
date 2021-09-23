//
//  DeathNoteScreenAssembly.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//
//

import UIKit

enum DeathNoteScreenAssembly {
    // MARK: Static methods

    static func createModule() -> UIViewController {
        let viewController = DeathNoteScreenViewController()
        let router = DeathNoteScreenRouter(view: viewController)
        let interactor = DeathNoteScreenInteractor()
        let dataSourve = DeathNoteScreenPresenterDataSource()
        let presenter = DeathNoteScreenPresenter(view: viewController, interactor: interactor, router: router)
        presenter.dataSource = dataSourve
        viewController.presenter = presenter

        return viewController
    }
}
