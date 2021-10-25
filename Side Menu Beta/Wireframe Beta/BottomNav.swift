//
//  BottomNav.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/19/21.
//
import Foundation
import UIKit

class BottomNav<VM: Menuable>: UIToolbar where VM:Coordinating {
    var isMenuOpen: Bool!
    var navDelegate: NavDelegate!
    var currentPage: Page!
    var buttons: [UIBarButtonItem]!
    
    init(frame: CGRect, vm: VM?, isMenuOpen: Bool, navDelegate: NavDelegate, currentPage: Page){
        self.currentPage = currentPage
        self.navDelegate = navDelegate
        super.init(frame: frame)
        self.isMenuOpen = isMenuOpen
        instantiate(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiate(frame: CGRect){
        let btnFct = BottomNavButtonsFactory(frame: frame, isMenuOpen: isMenuOpen, navDelegate: navDelegate)
        self.buttons = btnFct.buttons
        self.setItems(self.buttons, animated: false)
    }
    
    @objc func goHome(){
        print("Hello")
        self.navDelegate.goHome()
    }

    
    @objc func goToMyChart(){
        print("Hello")
        self.navDelegate.goToMyChart()
    }
    
    @objc func goToBillPay(){
        print("Hello")
        self.navDelegate.goToBillPay()
    }
    
    @objc func openMenu(){
        print("Hello")
        self.navDelegate.toggleMenu()
    }

}
