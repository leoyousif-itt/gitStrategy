//
//  UIPage.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/19/21.
//

import Foundation
import UIKit
import Combine

class UIPage<VM: Menuable>: UIStackView where VM: Coordinating {
    var content: UIView!
    var bottomNav: BottomNav<VM>?
    var isMenuOpen: Bool!
    var currentPage: Page!
    var sideMenu: UIView!
    
    func currentPageFactory (currentPage: Page, content: UIView) {
        self.content = UIView()
        self.currentPage = currentPage
        self.content.addSubview(content)
        self.insertArrangedSubview(self.content, at: 0)
    }
    
    func sideMenuFactory(isMenuOpen: Bool){
        let sideMenuSized = CGRect(x: frame.width-(frame.width*0.55), y: 0, width: frame.width*0.65, height:frame.height)
        self.sideMenu = UIView(frame: sideMenuSized)
        self.sideMenu.backgroundColor = .green
        
        self.isMenuOpen = isMenuOpen
        
        if isMenuOpen {
            self.content.addSubview(sideMenu)
        }
    }
    
    func bottomNavFactory(frame: CGRect, vm:VM, isMenuOpen: Bool, currentPage: Page){
        let bottomNav = BottomNav<VM>(frame: frame, vm: vm, isMenuOpen: isMenuOpen, navDelegate: AppNavDelegate(vm: vm) as! NavDelegate, currentPage: currentPage)
        self.bottomNav = bottomNav
    }
    
    
    convenience init(frame: CGRect, content: UIView, vm: VM, isMenuOpen: Bool, currentPage: Page) {
        self.init(frame: frame)
        currentPageFactory(currentPage: currentPage, content: content)
        sideMenuFactory(isMenuOpen: isMenuOpen)
        bottomNavFactory(frame: frame, vm: vm, isMenuOpen: isMenuOpen, currentPage: currentPage)
        
        self.insertArrangedSubview(bottomNav!, at: 1)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.axis = .vertical
        print(safeAreaInsets)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

