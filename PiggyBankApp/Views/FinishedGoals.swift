//
//  FinishedGoals.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 15.06.2023.
//

import SwiftUI

struct FinishedGoals: View {
    
    let user = User()
    @State var backToggle = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let size = geometry.size
                
                Image("BackGround_MediumBlue")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }.ignoresSafeArea(.all)
            
            ExtractedView5()
            
            if user.obtainPersonsGoalsName().count == 0 {
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    ZStack{
                        Image("CloudWithText 23")
                            .resizable()
                        
                        Text("It's empty here Goals that you complete will appear here")
                            .font(.custom("MullerMedium", size: size.width / 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("2670AD"))
                    }.frame(maxWidth: size.width / 1.46, maxHeight: size.width / 2)
                        .padding(.top, size.height * (0.22))
                        .padding(.leading, size.width * (0.1545))
                }
            }
            
            
        }
    }
}



struct FinishedGoals_Preview: PreviewProvider {
    static var previews: some View {
        FinishedGoals()
    }
}

struct ExtractedView5: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            HStack(spacing: size.height * (0.06)) {
                Button {
                    
                } label: {
                    Image("back")
                        .resizable()
                        .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                }.padding(.leading, size.width * (0.07))
                
                Text("Finished goals")
                     .font(.custom("Polka", size: size.width / 9))
                     .foregroundStyle(.white)
                     .lineLimit(2)
                     .multilineTextAlignment(.center)
                
            }
            
        }
    }
}
