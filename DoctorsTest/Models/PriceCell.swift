//
//  PriceCell.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

struct PriceCell: View {
    var title: String
    var price: String
    var service: String
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title).font(.system(size: 16, weight: .bold))
            HStack{
                Text(service)
                Spacer()
                Text("\(price) ₽")
            }.frame(maxWidth: .infinity)
                .padding(16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
    }
}
