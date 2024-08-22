//
//  PriceView.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

struct PriceView: View {
    @Environment(\.dismiss) private var dismiss
    var doctor: User
    init(doctor: User) {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 24)]
        self.doctor = doctor
    }
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing: 24){
                    PriceCell(title: "Видеоконсультация", price: doctor.videoChatPrice.description, service: "30 мин")
                    PriceCell(title: "Чат с врачом", price: doctor.textChatPrice.description, service: "30 мин")
                    PriceCell(title: "Приём в клинике", price: doctor.hospitalPrice.description, service: "в клинике")
                    Spacer()
                }.padding(.top, 16)
                .padding(.horizontal, 16)
            }.background(.mainBG).navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            dismiss()
                        } label: {
                            // Creating a button with an image and text
                            HStack {
                                Image(.arrow)
                                Spacer()
                            }.toolbarTitleDisplayMode(.inlineLarge).navigationBarTitle("Стоимость услуг")
                        }
                    }
                }
        }
    }
}
