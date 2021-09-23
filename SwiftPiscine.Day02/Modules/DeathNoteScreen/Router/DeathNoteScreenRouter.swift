//
//  DeathNoteScreenRouter.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//
//

import UIKit

class DeathNoteScreenRouter: PresenterToRouterDeathNoteScreenProtocol {
    // MARK: - Properties

    weak var view: UIViewController?

    // MARK: - Init

    init(view: UIViewController) {
        self.view = view
    }

    func routeToAddScreen(delegate: PushNewPersonProtocol?) {
        view?.navigationController?.pushViewController(AddNoteScreenAssembly.createModule(delegate: delegate), animated: true)
    }
}
