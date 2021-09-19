//
//  AddNoteScreenRouter.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//  
//

import UIKit

class AddNoteScreenRouter: PresenterToRouterAddNoteScreenProtocol {
    // MARK: - Properties
    weak var view: UIViewController?

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }

    func routeToDeathNoteScreen() {
        view?.navigationController?.popViewController(animated: true)
    }
}
