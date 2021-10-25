//
//  HomeVM.swift
//  Wireframe Beta
//
//  Created by Leo Yousif on 10/19/21.
//

import Combine



struct Menu {
    var isOpened: Bool = false
    
    mutating func toggleMenu(){
        self.isOpened.toggle()
    }
}

protocol Menuable{
    var menu: Menu { get set }
}

class HomeVM: ObservableObject, Coordinating, Menuable  {
    @Published var menu: Menu = Menu()
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator){
        self.coordinator = coordinator
    }
}

class MyChartVM: ObservableObject, Coordinating, Menuable  {
    @Published var menu: Menu = Menu()
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator){
        self.coordinator = coordinator
    }
}


class BillPayVM: ObservableObject, Coordinating, Menuable  {
    @Published var menu: Menu = Menu()
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator){
        self.coordinator = coordinator
    }
}


