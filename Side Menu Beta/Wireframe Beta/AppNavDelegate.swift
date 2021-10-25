//
//  AppNavDelegate.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/22/21.
//

import Foundation

class AppNavDelegate<VM:Menuable>: NSObject, NavDelegate where VM:Coordinating {
    var vm: VM!
    
    init(vm: VM){
        self.vm = vm
    }
    
    func goHome(){
        vm.coordinator.navToPage(page: .Home)
    }
    
    
    func goToMyChart(){
        vm.coordinator.navToPage(page: .MyChart)
    }
    
    func goToBillPay(){
        vm.coordinator.navToPage(page: .BillPay)
    }
    
    func toggleMenu(){
        vm.menu.toggleMenu()
    }
}
