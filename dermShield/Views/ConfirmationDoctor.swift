//
//  ConfirmationDoctor.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 02/01/24.
//

import SwiftUI

struct ConfirmationDoctor: View {
    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all) // Combining red and black for the background

            VStack(spacing: 16) {
                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color(white: 1, opacity: 1))
                        .frame(width: 340, height: 540)
                        .padding(.top, 0) // Adjust the padding as needed
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("PrimaryColor"), lineWidth: 2) // Set border color and width
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                        )
                    VStack {
                        Image(systemName: "checkmark.shield")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .foregroundColor(Color.green)
                            .padding(.top, 8)
                            .padding(.bottom, 16)

                        

                            Text("Results Sent!")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color.black)
                        .padding(.top, 8)
                        .padding(.bottom, 16)

                        Text("The doctor will send you a message within 48 hours with his recommendations and next steps. ")
                            .font(.custom("NunitoSans-Regular", size: 16))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.top, 8)
                            .padding(.bottom, 16)

                        Text("Check in your settings how you want to receive notifications. ")
                            .font(.custom("NunitoSans-Regular", size: 16))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.top, 8)
                            .padding(.bottom, 16)

                        NavigationLink(destination: UserFirstView()) {
                            Text("Analyze a new skin condition")
                                .font(.custom("NunitoSans-Regular", size: 18))
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 48)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(20)
                            
                        }
                        .padding(.bottom, 8)

                        NavigationLink(destination: UserFirstView()) {
                            Text("Done")
                                .font(.custom("NunitoSans-Regular", size: 18))
                                .bold()
                                .foregroundColor(Color("PrimaryColor"))
                                .padding()
                                .frame(width: 300, height: 46)
                                .background(Color(.white))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("PrimaryColor"), lineWidth: 2)
                                )
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ConfirmationDoctor()
}
