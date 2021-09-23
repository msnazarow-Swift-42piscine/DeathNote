//
//  AddNoteScreenAssembly.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//
//

import UIKit

enum AddNoteScreenAssembly {
    // MARK: Static methods

    static func createModule(delegate: PushNewPersonProtocol?) -> UIViewController {
        let viewController = AddNoteScreenViewController()
        let router = AddNoteScreenRouter(view: viewController)
        let interactor = AddNoteScreenInteractor()
        let presenter = AddNoteScreenPresenter(view: viewController, interactor: interactor, router: router)

        presenter.delegate = delegate
        viewController.presenter = presenter

        return viewController
    }
}
