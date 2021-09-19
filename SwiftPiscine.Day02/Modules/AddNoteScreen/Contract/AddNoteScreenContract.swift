//
//  AddNoteScreenContract.swift
//  SwiftPiscine.Day02
//
//  Created by out-nazarov2-ms on 18.09.2021.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAddNoteScreenProtocol: AnyObject {
   func showAlert()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAddNoteScreenProtocol: AnyObject {
    func savePersonDeath(name: String?, date: Date, description: String?)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAddNoteScreenProtocol: AnyObject {

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAddNoteScreenProtocol: AnyObject {
    func routeToDeathNoteScreen()
}
