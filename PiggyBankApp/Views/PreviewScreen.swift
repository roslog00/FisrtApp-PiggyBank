//
//  PreviewScreen.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 21.06.2023.
//

import SwiftUI

struct PreviewScreen: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack{
                Image("Rectangle 11")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                ZStack {
                    Image("PreviewCloud")
                        .resizable()
                    Text("My Piggy Bank")
                        .font(.custom("Polka", size: size.width / 10))
                        .foregroundColor(Color("2670AD"))
                }.frame(maxWidth: size.width * (0.8), maxHeight: size.height * (0.28))
                
                Image("PreviewCloud")
                    .resizable()
                    .frame(maxWidth: size.width * (0.5), maxHeight: size.height * (0.18))
                    .padding(.top, size.height * (-0.4))
                    .padding(.leading, size.width * (-0.61))
                
                Image("PreviewCloud")
                    .resizable()
                    .frame(maxWidth: size.width * (0.4), maxHeight: size.height * (0.14))
                    .padding(.top, size.height * (0.47))
                    .padding(.leading, size.width * (-0.59))
                
                Image("PreviewCloud")
                    .resizable()
                    .frame(maxWidth: size.width * (0.27), maxHeight: size.height * (0.1))
                    .offset(x: size.width * (0.409), y: size.height * (-0.27))
                
                Image("PreviewCloud")
                    .resizable()
                    .frame(maxWidth: size.width * (0.6), maxHeight: size.height * (0.21))
                    .offset(x: size.width * (0.37), y: size.height * (0.29))
                
            }
            
        }.ignoresSafeArea(.all)
    }
}

struct PreviewScreen_Preview: PreviewProvider {
    static var previews: some View {
        PreviewScreen()
    }
}
