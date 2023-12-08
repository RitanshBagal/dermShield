//
//  MyDoctorsView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 29/12/23.
//

import SwiftUI

struct MyDoctorsView: View {
    var body: some View {
        VStack{
                HStack {
                    Image(systemName: "i.circle")
                        .foregroundColor(Color("PrimaryColor"))
                        .font(.title2)
                        .padding()
                    Spacer()
                    VStack {
                        HStack{
                            Text("No doctor has been added!")
                                .font(.title3)
                                .fontWeight(.medium)
                            Spacer()
                        }
                        
                        HStack{
                            Text("Start adding your preferred doctors to review your case.")
                                .font(.caption)
                            Spacer()
                        }
                        
                    }
                    .padding([.bottom, .trailing, .top])
                }
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                                    RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                        .stroke(Color("PrimaryColor"), lineWidth: 1) // Adjust border color and width
                )
                .padding()
            
            HStack{
                Text("Receive a response from the doctor of your choice!")
                    .font(.callout)
                    .fontWeight(.medium)
                Spacer()
            }.padding([.trailing, .leading, .top])
            
            Text("Add your current General practitioner and dermatologist so you can easily send them your case files through the app.")
                .font(.caption)
                .padding([.trailing, .leading])
            
            HStack{
                Text("Don't have a doctor yet?")
                    .font(.callout)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding([.trailing, .leading, .top])
            
            Text("dermShield offers a wide range of dermatologists available to review your case quickly. We advise you to check if the doctor's services are chargeable before submitting your results.")
                .font(.caption)
                .padding([.trailing, .leading])
            
            Spacer()
            
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                NavigationLink(destination: AddDoctorView()){
                    Text("Add a Doctor")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("PrimaryColor"))
                        .cornerRadius(50)
                }
            }
            .navigationBarTitle("My Doctors", displayMode: .inline)
            .padding()
        }
    }
}

#Preview {
    MyDoctorsView()
}
