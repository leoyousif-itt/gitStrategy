//
//  ViewController.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/18/21.
//

import UIKit
import Combine

class MyChartController: UIViewController {
    var content:UIView!
    var page:UIPage<MyChartVM>!
    var vm: MyChartVM!
    
    var sideMenuOpenedSubscription: AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = UIView(frame: view.frame)
        content.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sideMenuOpenedSubscription = vm.$menu.sink {menu in
            print(menu)
            self.page = UIPage<MyChartVM>(frame: self.view.frame, content: self.content, vm: self.vm, isMenuOpen: menu.isOpened, currentPage: self.vm.coordinator.currentPage)
            self.view = self.page
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sideMenuOpenedSubscription?.cancel()
        sideMenuOpenedSubscription = nil
    }
}

class BillPayController: UIViewController {
    var content:UIView!
    var page:UIPage<BillPayVM>!
    var vm: BillPayVM!
    
    var sideMenuOpenedSubscription: AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = UIView(frame: view.frame)
        content.backgroundColor = .yellow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sideMenuOpenedSubscription = vm.$menu.sink {menu in
            print(menu)
            self.page = UIPage<BillPayVM>(frame: self.view.frame, content: self.content, vm: self.vm, isMenuOpen: menu.isOpened,currentPage: self.vm.coordinator.currentPage)
            self.view = self.page
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sideMenuOpenedSubscription?.cancel()
        sideMenuOpenedSubscription = nil
    }
}

class HomeVC: UIViewController {
    var content:UIView!
    var page:UIPage<HomeVM>!
    
    var vm: HomeVM!
    var sideMenuOpenedSubscription: AnyCancellable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = UIView(frame: view.frame)
        content.backgroundColor = .orange
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.view.safeAreaInsets)
        sideMenuOpenedSubscription = vm.$menu.sink {menu in
            print(menu)

            self.page = UIPage<HomeVM>(frame: self.view.frame, content: self.content, vm: self.vm, isMenuOpen: menu.isOpened,currentPage: self.vm.coordinator.currentPage)

            self.view = self.page
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sideMenuOpenedSubscription?.cancel()
        sideMenuOpenedSubscription = nil
    }
}


