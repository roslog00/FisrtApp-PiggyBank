//
//  Goals'sScreen.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 21.06.2023.
//
import SwiftUI
import RealmSwift

struct GoalsScreen: View {
    
    @ObservedResults(PersonsGoals.self) var personsGoals
    @ObservedObject var realmManager = RealmManager()
    //@ObservedObject var dateManager = DateOfGoal()
    @State var idOfList = ""
    @State var addCashToggle = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack(alignment: .topLeading){
                Image("Rectangle 11")
                    .resizable()
                    .frame(minWidth: size.width * (1), minHeight: size.height * (1))
                
                ExtractedView4()
                
                ZStack (alignment: .trailing){
                    
                    Image("Cloud2GoalScreen")
                        .resizable()
                        .frame(width: size.width * (0.7), height: size.width * (0.37))
                        .offset(x: size.width * (0.45), y: size.height * (0.06))
                    
                    Image("Cloud3GoalScreen")
                        .resizable()
                        .frame(width: size.width * (0.9), height: size.width * (0.47))
                        .offset(x: size.width * (-0.2), y: size.height * (0.02))
                    
                    Button(action: {
                        addCashToggle.toggle()
                    }, label: {
                        ZStack {
                            Image("sun")
                                .resizable()
                                .frame(width: size.width * (0.4), height: size.width * (0.4))
                            Image("plus icon")
                                .resizable()
                                .frame(width: size.width * (0.17), height: size.width * (0.17))
                        }
                    }).padding(.bottom, size.height * (0.07))
                        .fullScreenCover(isPresented: $addCashToggle, content: {
                            AddMoneyScreen()
                        })
                    
                }.frame(maxWidth: .infinity, maxHeight: size.height * (1))
                
                ExtractedView6()
            }
        }.ignoresSafeArea(.all)
    }
}

struct GoalsScreen_Preview: PreviewProvider {
    static var previews: some View {
        GoalsScreen()
            .environmentObject(RealmManager())
    }
}


struct ExtractedView4: View {
    
    @EnvironmentObject var arrayOfItem: RealmManager
    @ObservedObject var realmManager = RealmManager()
    @State var backToggle = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            LazyVStack(alignment: .leading, spacing: size.height * (0.04)){
                HStack(alignment: .center, spacing: size.width * (0)){
                    Button(action: {
                        backToggle.toggle()
                    }, label: {
                        Image("back")
                            .resizable()
                            .frame(maxWidth: size.width * (0.09), maxHeight: size.width * (0.08))
                    }).fullScreenCover(isPresented: $backToggle, content: { NewMainScreen()})
                        .padding(.leading, size.width * (-0.15))
                    
                    Text(UserDefaults.standard.string(forKey: "name") ?? "name")
                        .lineLimit(2)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Polka", fixedSize: size.width / 9))
                        .frame(width: size.width * (0.6))
                }.padding(.top, size.height * (0.08))
                    .frame(width: size.width * 1, alignment: .center)
                
                HStack(spacing: size.width * (-0.001)){
                    Text(" \(UserDefaults.standard.string(forKey: "savedMoney") ?? "3")$")
                        .foregroundStyle(.white)
                        .font(.custom("MullerBold", size: size.width / 7))
                    
                    Text("/ \(UserDefaults.standard.string(forKey: "cost") ?? "3") $")
                        .foregroundStyle(.white)
                        .font(.custom("MullerMedium", size: size.width / 10))
                }.padding(.leading, size.width * (0.06))
                
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(minWidth: (CGFloat(1) * (0.8) * size.width))
                        .frame(maxWidth: (1 * size.width), maxHeight: size.height * (0.02))
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: size.width * (0.8) , height: size.height * (0.02))
                        .foregroundColor(Color("7EBEF3"))
                    
                }.cornerRadius(45.0)
                    .padding(.horizontal, size.width * (0.06)).ignoresSafeArea(.all)
                
            }
        }
    }
}


struct ExtractedView6: View {
    
    
    @ObservedResults(PersonsGoals.self) var personsGoals
    @ObservedObject var realmManager = RealmManager()
    @State var size = UIScreen.main.bounds.size
    @State var addCashToggle = false
    @State var idOfList = ""
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack {
                Image("Cloud1GoalScreen")
                    .resizable()
                .aspectRatio(contentMode: .fill)
                
                Text("History")
                    .font(.custom("Polka", size: size.width / 8))
                    .foregroundColor(Color("2670AD"))
                    .padding(.top, size.height * (-0.6))
            }
            
            let dataOfId = realmManager.getDataWithId(id: UserDefaults.standard.string(forKey: "id")!)
            
            ScrollView(showsIndicators: false) {
                if UserDefaults.standard.string(forKey: "id") == dataOfId![0].id.stringValue {
                    ForEach(dataOfId![0].listOfAddedMoney, id: \.id) { list in
                            HStack {
                                Text("+" + list.addMoney)
                                    .font(.custom("MullerMedium", size: size.width / 10))
                                    .foregroundStyle(.white)
                                Image(systemName: UserDefaults.standard.string(forKey: "currency") ?? "Not Currency")
                                    .font(.custom("MullerMedium", size: size.width / 10))
                                    .foregroundStyle(.white)
                                    .padding(.leading, size.width * (-0.037))
                                    .padding(.bottom,  size.width * (0.01))
                                
                                Spacer(minLength: size.width * (0.13))
                                
                                Text(list.dateOfAddMoney)
                                    .font(.custom("MullerMedium", size: size.width / 14))
                                    .foregroundStyle(.white)
                            }.padding(.horizontal, size.width * (0.05))
                        }
                    }
                    Spacer(minLength: size.height * (0.04))
                
                ZStack(alignment: .center){
                    
                    Image("StartGoalRectangle")
                        .resizable()
                        .padding(.horizontal, size.width * (0.07))
                    
                    VStack{
                        Text("Goal started")
                            .font(.custom("MullerMedium", size: size.width / 13))
                            .foregroundStyle(.white)
                        
                        Text(UserDefaults.standard.string(forKey: "date") ?? "Date.now.")
                            .font(.custom("Polka", size: size.width / 10))
                            .foregroundStyle(.white)
                    }
                }
                
                Spacer(minLength: size.height * (0.04))
                
            }.padding(.top, size.height * (0.3))
        }.padding(.top, size.height * (0.475))
    }
}
