//
//  CaseView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 10/12/23.
//

import SwiftUI

class DateTimeCasesViewModel: ObservableObject {
    @Published var currentDate = Date()
    
    func fetchDateTimeFromDatabase() {
        // Simulate fetching date and time from the database
        // Replace this with your actual database interaction code
        // For demonstration, we are using a static date
        currentDate = Date()
    }
}

struct CaseView: View {
    @State private var selectedSegment = 0
    @StateObject private var viewModelCases = DateTimeCasesViewModel()
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    Picker(selection: $selectedSegment, label: Text("")) {
                        Text("All").tag(0)
                        Text("Low Risk").tag(1)
                        Text("Medium").tag(2)
                        Text("High").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    // Display different content based on the selected segment
                    if selectedSegment == 0 {
                        VStack{
                            AllCases(viewModel: viewModelCases)
                            Spacer()
                        }
                    } else if selectedSegment == 1 {
                        VStack{
                            LowRiskCases(viewModel: viewModelCases)
                            Spacer()
                        }
                    } else if selectedSegment == 2 {
                        VStack{
                            MediumRiskCases(viewModel: viewModelCases)
                            Spacer()
                        }
                    } else {
                        VStack{
                            HighRiskCases(viewModel: viewModelCases)
                            Spacer()
                        }
                    }
                }
                .navigationBarTitle("Calendar")
                .navigationBarItems(trailing: NavigationLink(destination: ProfileView(), label: {
                    Image(systemName: "person.crop.circle")
                        .font(.title3)
                        .foregroundColor(Color("PrimaryColor"))
                }))
            }
        }
    }
}

struct AllCases: View {
    @ObservedObject var viewModel: DateTimeCasesViewModel

    var body: some View {
        VStack {
            HighRiskCases(viewModel: viewModel)
            MediumRiskCases(viewModel: viewModel)
            LowRiskCases(viewModel: viewModel)
        }
    }
}


struct LowRiskCases: View {
    @ObservedObject var viewModel: DateTimeCasesViewModel
    
    var body: some View {
        VStack{
            HStack {
                Image("LowRisk")
                    .cornerRadius(10)
                    .padding()
                Spacer()
                VStack {
                    HStack{
                        Text("Case 1")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Disease Name")
                            .font(.callout)
                        Spacer()
                    }
                    
                    HStack{
                        Image("greenCircle")
                        Text("Low risk")
                            .font(.caption)
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                        Text(formatDate(date: viewModel.currentDate))
                            .font(.caption)
                        Spacer()
                    }
                    
                }
                .padding()
            }
            .background(Color.green.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                                RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                    .stroke(Color.green, lineWidth: 1) // Adjust border color and width
            )
            .padding([.leading, .trailing])
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}


struct MediumRiskCases: View {
    @ObservedObject var viewModel: DateTimeCasesViewModel
    
    var body: some View {
        VStack{
            HStack {
                Image("MediumRisk")
                    .cornerRadius(10)
                    .padding()
                Spacer()
                VStack {
                    HStack{
                        Text("Case 2")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Disease Name")
                            .font(.callout)
                        Spacer()
                    }
                    
                    HStack{
                        Image("orangeCircle")
                        Text("Medium risk")
                            .font(.caption)
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                        Text(formatDate(date: viewModel.currentDate))
                            .font(.caption)
                        Spacer()
                    }
                    
                }
                .padding()
            }
            .background(Color.orange.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                                RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                    .stroke(Color.orange, lineWidth: 1) // Adjust border color and width
            )
            .padding([.leading, .trailing])
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct HighRiskCases: View {
    @ObservedObject var viewModel: DateTimeCasesViewModel
    
    var body: some View {
        VStack{
            HStack {
                Image("HighRisk")
                    .cornerRadius(10)
                    .padding()
                Spacer()
                VStack {
                    HStack{
                        Text("Case 3")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("Disease Name")
                            .font(.callout)
                        Spacer()
                    }
                    
                    HStack{
                        Image("redCircle")
                        Text("High risk")
                            .font(.caption)
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                        Text(formatDate(date: viewModel.currentDate))
                            .font(.caption)
                        Spacer()
                    }
                    
                }
                .padding()
            }
            .background(Color.red.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                                RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                    .stroke(Color.red, lineWidth: 1) // Adjust border color and width
            )
            .padding([.leading, .trailing])
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}


#Preview {
    CaseView()
}
