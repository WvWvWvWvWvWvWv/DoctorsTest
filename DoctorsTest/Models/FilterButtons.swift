//
//  FilterButtons.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

struct FilterButtons: View {
    @Binding var firstBtnSelected: Bool
    @Binding var firstBtnToggle: Bool
    @Binding var secondBtnSelected : Bool
    @Binding var secondBtnToggle: Bool
    @Binding var thirdBtnSelected : Bool
    @Binding var thirdBtnToggle: Bool
    var body: some View{
        HStack(){
                Button(action: {
                    if firstBtnSelected == true {
                        firstBtnToggle.toggle()
                    }else{
                        firstBtnSelected = true
                        secondBtnSelected = false
                        thirdBtnSelected = false
                    }
                }, label: {
                    Text("По цене").foregroundStyle(
                        firstBtnSelected ?    .white : .appDarkGray)
                    .font(.system(size: 14))
                    Image(firstBtnToggle ? .vectorTop : .vectorDown)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 32)
                .background(
                    firstBtnSelected ? .appPink : .white
                )
                Button(action: {
                    if secondBtnSelected == true {
                        secondBtnToggle.toggle()
                    }else{
                        firstBtnSelected = false
                        secondBtnSelected = true
                        thirdBtnSelected = false
                    }
                }, label: {
                    Text("По стажу").foregroundStyle(
                        secondBtnSelected ?    .white : .appDarkGray)
                    .font(.system(size: 14))
                    Image(secondBtnToggle ? .vectorTop : .vectorDown)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 32)
                .background(
                    secondBtnSelected ? .appPink : .white
                )
                Button(action: {
                    if thirdBtnSelected == true {
                        thirdBtnToggle.toggle()
                    }else{
                        firstBtnSelected = false
                        secondBtnSelected = false
                        thirdBtnSelected = true
                    }
                }, label: {
                    Text("По рейтингу").foregroundStyle(
                        thirdBtnSelected ?    .white : .appDarkGray)
                    .font(.system(size: 14))
                    Image(thirdBtnToggle ? .vectorTop : .vectorDown)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 32)
                .background(
                    thirdBtnSelected ? .appPink : .white
                )
            }.frame(height: 32)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal , 17)
                .padding(.vertical , 6)
    }
}
