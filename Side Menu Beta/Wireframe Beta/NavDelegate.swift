//
//  NavDelegate.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/22/21.
//

import Foundation

protocol NavDelegate: NSObject {
    func goHome()
    func goToMyChart()
    func goToBillPay()
    func toggleMenu()
}

