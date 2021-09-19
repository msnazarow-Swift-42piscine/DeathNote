//
//  AddNoteScreenPresenter.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//  
//

import Foundation

class AddNoteScreenPresenter: ViewToPresenterAddNoteScreenProtocol {

    // MARK: Properties
    weak var view: PresenterToViewAddNoteScreenProtocol?
    let interactor: PresenterToInteractorAddNoteScreenProtocol?
    let router: PresenterToRouterAddNoteScreenProtocol?
    weak var delegate: PushNewPersonProtocol?
    // MARK: Init
    init(view: PresenterToViewAddNoteScreenProtocol, interactor: PresenterToInteractorAddNoteScreenProtocol?, router: PresenterToRouterAddNoteScreenProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func savePersonDeath(name: String?, date: Date, description: String?) {
        guard let name = name, !name.isEmpty else {
            view?.showAlert()
            return
        }
        delegate?.pushNewPerson(PersonModel(name: name, date: date, description: description ?? ""))
        router?.routeToDeathNoteScreen()
    }
}
