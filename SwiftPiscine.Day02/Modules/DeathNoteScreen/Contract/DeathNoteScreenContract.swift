//
//  DeathNoteScreenContract.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//
//

import UIKit

// MARK: View Output (Presenter -> View)

protocol PresenterToViewDeathNoteScreenProtocol: AnyObject {
    func update()
}

// MARK: View Input (View -> Presenter)

protocol ViewToPresenterDeathNoteScreenProtocol: AnyObject {
    var dataSource: DataSourceDeathNoteScreenProtocol? { get set }

    func addButtonTapped()
}

// MARK: Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorDeathNoteScreenProtocol: AnyObject {}

// MARK: Router Input (Presenter -> Router)

protocol PresenterToRouterDeathNoteScreenProtocol: AnyObject {
    func routeToAddScreen(delegate: PushNewPersonProtocol?)
}

protocol DataSourceDeathNoteScreenProtocol: AnyObject, UITableViewDataSource {
    func pushNewPerson(_: PersonModel)
}

protocol PushNewPersonProtocol: AnyObject {
    func pushNewPerson(_: PersonModel)
}
