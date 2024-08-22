//
//  DoctorCell.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DoctorCell: View {
    var doctor: User
    var body: some View {
        NavigationStack{
            VStack {
                HStack(alignment: .top, spacing: 16){
                    WebImage(url: URL(string: doctor.avatar ?? ""))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 8){
                        Text(doctor.lastName).font(.system(size: 16, weight: .bold))
                        Text(doctor.firstName).font(.system(size: 16, weight: .bold))
                        RatingOfDoctorStars(doctor: doctor)
                        Text(doctor.seniority < 5 && doctor.seniority != 0 ? "Педиатр・стаж \(doctor.seniority.description) года" : "Педиатр・стаж \(doctor.seniority.description) лет").font(.system(size: 14, weight: .light))
                        Text("от \([doctor.videoChatPrice, doctor.hospitalPrice, doctor.textChatPrice].min() ?? 0) ₽").font(.system(size: 16, weight: .bold))
                        
                    }
                    Spacer()
                    Image(doctor.isFavorite ? .heart : .topcoatLike)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                }.padding(.bottom , 16).padding(.top , 20).padding(.horizontal, 16).background(.white).clipShape(RoundedRectangle(cornerRadius: 8))
                Button {
                    //
                } label: {  doctor.freeReceptionTime.count > 0 ?
                    NavigationLink{
                        DoctorsCardView(doctor: doctor)
                    } label: {
                        Text("Записаться").font(.custom("SF-Pro-Display-Bold", size: 16)).foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(.appPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    :
                    NavigationLink{
                        DoctorsCardView(doctor: doctor)
                    } label: {
                        Text("Нет свободного расписания").font(.system(size: 16, weight: .bold)).foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(.appLightGray)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }.padding(.horizontal, 16)
        }
    }
}
