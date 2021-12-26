//
//  DeathNoteContract.swift
//  WeatherApp
//
//  Created by out-nazarov2-ms on 12.09.2021.
//

import UIKit

let verticalTranslation = max(!UIWindow.isLandscape ?
                            UIScreen.main.bounds.height / 844.0 :
                            UIScreen.main.bounds.height / 390.0, 1)
let horisontalTranslation = max(!UIWindow.isLandscape ?
                            UIScreen.main.bounds.width / 390.0 :
                            UIScreen.main.bounds.width / 844.0, 1)
