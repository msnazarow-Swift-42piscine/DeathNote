//
//  DeathNoteScreenPresenter.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//  
//

import Foundation

class DeathNoteScreenPresenter: ViewToPresenterDeathNoteScreenProtocol {

    // MARK: Properties
    weak var view: PresenterToViewDeathNoteScreenProtocol?
    let interactor: PresenterToInteractorDeathNoteScreenProtocol?
    let router: PresenterToRouterDeathNoteScreenProtocol?

    var dataSource: DataSourceDeathNoteScreenProtocol?
    
    // MARK: Init
    init(view: PresenterToViewDeathNoteScreenProtocol, interactor: PresenterToInteractorDeathNoteScreenProtocol?, router: PresenterToRouterDeathNoteScreenProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func addButtonTapped() {
        router?.routeToAddScreen(delegate: self)
    }
}

extension DeathNoteScreenPresenter: PushNewPersonProtocol {
    func pushNewPerson(_ person: PersonModel) {
        dataSource?.pushNewPerson(person)
        view?.update()
    }
}
