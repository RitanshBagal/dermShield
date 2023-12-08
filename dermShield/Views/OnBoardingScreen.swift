//
//  OnBoardingScreen.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 28/12/23.
//

import SwiftUI

struct OnBoardingScreen: View {
    @State private var currentPage = 0
    var body: some View {
                VStack{
                    if(currentPage<3){
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: SignupView()) {
                                Text("Skip")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding([.leading, .trailing])
                            }
                        }
                    } else{
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: SignupView()) {
                                Text("Get Started")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding([.leading, .trailing])
                            }
                        }
                    }
                    
                    TabView(selection: $currentPage) {
                        OnboardingStepView(imageName: "OnBoardScreen1", title: "Welcome to dermShield!", description: "Assess the current state of your skin and receive immediate results along with personalized recommendations.").tag(0)
                        
                        OnboardingStepView(imageName: "OnBoardScreen2", title: "Consult a medical expert", description: "Consult a healthcare professional and share results with your chosen doctor for review and guidance..").tag(1)
                        
                        OnboardingStepView(imageName: "OnBoardScreen3", title: "Map & Track", description: "Develop a personalized body map and consistently monitor your skin conditions.").tag(2)
                        
                        OnboardingStepView(imageName: "OnBoardScreen4", title: "Your data is safe", description: "Safely archive your case files and medical records.").tag(3)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                .navigationBarHidden(true)
                .padding()
            }
        }

struct OnboardingStepView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            
            Text(description)
                .foregroundColor(.gray)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

#Preview {
    OnBoardingScreen()
}
