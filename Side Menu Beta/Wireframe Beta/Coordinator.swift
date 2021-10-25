//
//  Coordinator.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/18/21.
//

import Foundation
import UIKit

enum Page {
    case Home
    case MyChart
    case BillPay
    case Provider
    case Locations
    case Feedback
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator]? { get set }
    var vms: Dictionary<Page, AnyObject> { get set }
    func start()
    func navToPage(page: Page)
    func goHome()
    var currentPage: Page {get set}
    
}

protocol Coordinating {
    var coordinator:Coordinator { get set }
}

class AppCoordinator: Coordinator {
    var children: [Coordinator]?
    var navigationController: UINavigationController = UINavigationController()
    var vms = Dictionary<Page, AnyObject>()
    var currentPage: Page = .Home
    
    init(){
        vms = [
            .Home: HomeVM(coordinator: self),
            .BillPay: BillPayVM(coordinator: self),
            .MyChart: MyChartVM(coordinator: self)
        ]
    }
    
    func start(){
        goHome()
    }
    
    
    func navToPage(page: Page) {
        switch page {
        case .Home: self.currentPage = .Home; goHome()
        case .MyChart:self.currentPage = .MyChart; goToMyChart()
        case .BillPay: self.currentPage = .BillPay; goToBillPay()
        default: self.currentPage = .Home; goHome()
        }
    }
    
    func goHome(){
        print("Going Home")
        let home = HomeVC()
        home.vm = HomeVM(coordinator: self)
        navigationController.setViewControllers([home], animated: false)
    }
    
    func goToBillPay(){
        print("Going to BillPay")
        let billpay = BillPayController()
        billpay.vm = BillPayVM(coordinator: self)
        navigationController.setViewControllers([billpay], animated: false)
    }
    
    func goToMyChart(){
        print("Going to MyChart")
        
        let myChart = MyChartController()
        myChart.vm = MyChartVM(coordinator: self)
        navigationController.setViewControllers([myChart], animated: false)
    }
}
