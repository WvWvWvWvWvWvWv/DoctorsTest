//
//  DoctorsView.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

struct DoctorsView: View {
    @StateObject var viewModel = DoctorsViewModel()
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 24)]
        }
    var doctors = DoctorsViewModel().dataManager.loadUsersFromJSON()
    @State var searchText = ""
    var searchResults: [User] {
        if searchText.isEmpty {
            return doctors!
        } else {
            return doctors!.filter { $0.firstName.contains(searchText) }
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack{
                        FilterButtons(firstBtnSelected: $viewModel.firstBtnSelected,firstBtnToggle: $viewModel.firstBtnToggle , secondBtnSelected: $viewModel.secondBtnSelected,secondBtnToggle: $viewModel.secondBtnToggle ,thirdBtnSelected: $viewModel.thirdBtnSelected, thirdBtnToggle: $viewModel.thirdBtnToggle)
                        
                        LazyVStack(spacing: 20){
                            if viewModel.firstBtnSelected == true {
                                if viewModel.firstBtnToggle == true{
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.videoChatPrice < User2.videoChatPrice
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }else{
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.videoChatPrice > User2.videoChatPrice
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }
                            }
                            if viewModel.secondBtnSelected == true {
                                if viewModel.secondBtnToggle == true {
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.seniority < User2.seniority
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }else{
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.seniority > User2.seniority
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }
                            }
                            if viewModel.thirdBtnSelected == true {
                                if viewModel.thirdBtnToggle == true {
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.ratingsRating < User2.ratingsRating
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }else{
                                    ForEach(searchResults.sorted(by: { User, User2 in
                                        User.ratingsRating > User2.ratingsRating
                                    }), id: \.id) { doctor in
                                        DoctorCell(doctor: doctor)
                                    }
                                }
                            }
                            ForEach(searchResults, id: \.id){doctor in
                                    DoctorCell(doctor: doctor)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            HStack{
                                Image(.arrow)

                            }.toolbarTitleDisplayMode(.inlineLarge).navigationBarTitle("Педиатры")
                        }
                    }
            }.background(.mainBG)
            }.searchable(text: $searchText ,prompt: "Найти")
        }
    }


#Preview {
    DoctorsView()
}

