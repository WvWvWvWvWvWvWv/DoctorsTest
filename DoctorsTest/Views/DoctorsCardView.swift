//
//  DoctorsCardView.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DoctorsCardView : View {
    @Environment(\.dismiss) private var dismiss
    var doctor: User
    init(doctor: User) {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 24)]
        self.doctor = doctor
    }
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading ,spacing: 22){
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
                    }
                    
                    
                    Spacer()
                }
                VStack(alignment: .leading ,spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Image(.clock).resizable().frame(width: 24, height: 24)
                            Text(doctor.seniority < 5 && doctor.seniority != 0 ? "Опыт работы: \(doctor.seniority.description) года" : "Опыт работы: \(doctor.seniority.description) лет")
                        }
                        HStack{
                            Image(.firstAidPng).frame(width: 24, height: 24)
                            Text(doctor.scientificDegreeLabel.rawValue)
                        }
                        HStack{
                            Image(.graduationPng).frame(width: 24, height: 24)
                            Text(doctor.higherEducation.first?.university ?? "Образование не указано")
                        }
                        HStack{
                            Image(.locationPng).frame(width: 24, height: 24)
                            Text(doctor.workExpirience.first?.organization ?? "Место работы не указано")
                        }
                    }
                    VStack(spacing: 24  ){
                        NavigationLink(destination: {
                            PriceView(doctor: doctor)
                        }, label: {
                            HStack{
                                Text("Стоимость услуг")
                                Spacer()
                                Text(("от \([doctor.videoChatPrice, doctor.hospitalPrice, doctor.textChatPrice].min() ?? 0) ₽"))
                            }
                        }).buttonStyle(PlainButtonStyle())
                
                        .font(.system(size: 16, weight: .bold))
                        .padding(18)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack{
                            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                                .lineSpacing(15)
                                .font(.system(size: 14))
                            Spacer()
                            Button {
                                //
                            } label: {  doctor.freeReceptionTime.count > 0 ?
                                Text("Записаться").font(.system(size: 16, weight: .bold)).foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(16)
                                    .background(.appPink)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                :
                                Text("Нет свободного расписания").font(.system(size: 16, weight: .bold)).foregroundStyle(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(16)
                                    .background(.appLightGray)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }

                        }
                    }
                }
                Spacer()
            }.padding(.horizontal , 16)
                .padding(.top, 16)
                .background(.mainBG)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(.arrow)
                                Spacer()
                            }.toolbarTitleDisplayMode(.inlineLarge).navigationBarTitle("Педиатр")
                        }
                    }
                }
        }
    }
}
