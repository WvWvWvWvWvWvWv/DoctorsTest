//
//  DoctorsViewModel.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

class DoctorsViewModel: ObservableObject {
    public var dataManager: DataManager = DataManager()
    @Published var doctorsModel: [User] = []
    @Published var firstBtnSelected = false
    @Published var firstBtnToggle = false
    @Published var secondBtnSelected = false
    @Published var secondBtnToggle = false
    @Published var thirdBtnSelected = false
    @Published var thirdBtnToggle = false
    
}
