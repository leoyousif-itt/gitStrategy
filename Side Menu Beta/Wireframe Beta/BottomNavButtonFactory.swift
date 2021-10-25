//
//  BottomNavButtonFactory.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/22/21.
//
import Foundation
import UIKit

class BottomNavButtonsFactory: UIView {
    var isMenuOpen: Bool!
    var navDelegate: NavDelegate!
    var buttons: [UIBarButtonItem]!
    
    convenience init(frame: CGRect, isMenuOpen: Bool, navDelegate: NavDelegate) {
        self.init(frame: frame)
        self.navDelegate = navDelegate
        self.isMenuOpen = isMenuOpen
        self.buttons = self.defaultButtonsFactory()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonImages(){
        var homeButton = UIImage(systemName: "house")
        var providerButton = UIImage(systemName: "house")
        var myChartButton = UIImage(systemName: "folder")
        var locationButton = UIImage(systemName: "house")
        var payABillButton = UIImage(systemName: "dollarsign.square")
        
    }
    
    func defaultButtonsFactory() -> [UIBarButtonItem] {
        var homeButton: UIBarButtonItem { UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(goHome)) }
        var providerButton: UIBarButtonItem { UIBarButtonItem() }
        var myChartButton: UIBarButtonItem { UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(goToMyChart)) }
        var locationButton: UIBarButtonItem { UIBarButtonItem() }
        var payABillButton: UIBarButtonItem { UIBarButtonItem(image: UIImage(systemName: "dollarsign.square"), style: .plain, target: self, action: #selector(goToBillPay)) }
        var sideMenuButton: UIBarButtonItem!
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        sideMenuButton =  UIBarButtonItem(image: getSideMenuImage(), style: .plain, target: self, action: #selector(openMenu))
        
        return [homeButton, space, myChartButton, space, payABillButton, space, sideMenuButton]
    }
    
    @objc func goHome(){
    }
    
    @objc func goToMyChart(){
    }
    
    @objc func goToBillPay(){
    }
    
    @objc func openMenu(){
    }
    
    func getSideMenuImage() -> UIImage! {
        if isMenuOpen {
            print("is")
            print("______________")
            return UIImage(systemName: "xmark")
        } else {
            print("isnot")
            print("______________")
            return UIImage(systemName: "ellipsis")
        }
    }
}
