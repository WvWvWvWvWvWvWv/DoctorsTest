//
//  RatingOfDoctorStars.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import Foundation
import SwiftUI

struct RatingOfDoctorStars: View {
    var doctor: User
    var body: some View {
        HStack(spacing: 2.4){
            Image(doctor.ratingsRating >= 1 ? .starPink : .starGray).resizable().frame(width: 12, height: 12)
            Image(doctor.ratingsRating >= 2 ? .starPink : .starGray).resizable().frame(width: 12, height: 12)
            Image(doctor.ratingsRating >= 3 ? .starPink : .starGray).resizable().frame(width: 12, height: 12)
            Image(doctor.ratingsRating >= 4 ? .starPink : .starGray).resizable().frame(width: 12, height: 12)
            Image(doctor.ratingsRating >= 5 ? .starPink : .starGray).resizable().frame(width: 12, height: 12)
            
        }
    }
}
