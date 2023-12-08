//
//  HomeView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchElement: String = ""
    @State private var progressValue: Double = 0
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search cases or doctor", text: $searchElement)
                    .padding(10)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding([.leading, .trailing])
                VStack{
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 50))
                            .foregroundColor(Color.gray)
                            .overlay(
                                                RoundedRectangle(cornerRadius: 50) // Adjust corner radius as needed
                                                    .stroke(Color.white, lineWidth: 3) // Adjust border color and width
                            )
                            .padding(.leading)
                        VStack{
                            HStack{
                                Text("My Profile")
                                    .fontWeight(.bold)
                                    .padding([.leading, .trailing])
                                Spacer()
                            }
                            
                            HStack{
                                ProgressView(value: progressValue, total: 100)
                                    .accentColor(Color("PrimaryColor"))
                                
                                Text(String(format: "%.0f%", progressValue) + "%")
                                    .font(.caption)
                            }
                            .padding([.leading, .trailing])
                            
                            HStack{
                                Text("Not Completed")
                                    .font(.caption)
                                    .padding([.leading, .trailing])
                                Spacer()
                            }
                        }
                        .padding([.trailing, .top, .bottom])
                    }
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                                        RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                            .stroke(Color.orange, lineWidth: 1) // Adjust border color and width
                    )
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Home")
            .navigationBarItems(trailing: NavigationLink(destination: ProfileView()) {
                Image(systemName: "envelope.badge")
                    .font(.subheadline)
                    .foregroundColor(Color("PrimaryColor"))
            })
        }
    }
}

#Preview {
    HomeView()
}
