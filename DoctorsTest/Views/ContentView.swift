//
//  ContentView.swift
//  DoctorsTest
//
//  Created by Сергей Зайцев on 22.08.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State var selectionPage: String = "homeGray"
    let pages: [PageItem] = PageItem.pages()
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $selectionPage) {
            DoctorsView()
                .tag("homeGray")
            Text("Приёмы")
                .tag("pagesIm")
            Text("Чат")
                .tag("chat")
            Text("Профиль")
                .tag("Union")
        }
        HStack(alignment: .bottom,spacing: 0){
            ForEach(pages){
                page in
                TabViewItem(selectionPage: $selectionPage, badge: page.badge, pageItem: page)
            }
        }
        
    }
}
#Preview {
    ContentView()
}


struct TabViewItem: View {
    @Binding var selectionPage: String
    var badge: Int
    var pageItem: PageItem
    var body: some View {
        Button {
            selectionPage = pageItem.pageTag
        } label :{
            VStack{
                ZStack{
                    if selectionPage == pageItem.pageTag{
                        Image(pageItem.pageTag)
                            .renderingMode(.template)
                                .foregroundStyle(.appPink)

                    }
                    else {
                            Image(pageItem.pageTag)
                        
                    }
                    if badge > 0 {
                        ZStack{
                            Circle().foregroundStyle(.appPink)
                            Text(badge.description).foregroundStyle(.white).font(.system(size: 10))
                        }.padding(.leading, 15)
                            .padding(.bottom, 15)
                            .frame(maxWidth: 34)
                    }
                    
                }
                Text(pageItem.pageName).font(.system(size: 12)).foregroundStyle(.appDarkGray)
            }
                .padding(.top, 13)
                .padding(.horizontal, 25)
        }
    }
}

