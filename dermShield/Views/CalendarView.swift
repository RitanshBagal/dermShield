//
//  CalenderView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 10/12/23.
//

import SwiftUI

class DateTimeCalendarViewModel: ObservableObject {
    @Published var currentDate = Date()
    
    func fetchDateTimeFromDatabase() {
        // Simulate fetching date and time from the database
        // Replace this with your actual database interaction code
        // For demonstration, we are using a static date
        currentDate = Date()
    }
}

struct CalendarView: View {
    @State private var selectedSegment = 0
    @StateObject private var viewModelCalendar = DateTimeCalendarViewModel()
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    Picker(selection: $selectedSegment, label: Text("")) {
                        Text("Upcoming").tag(0)
                        Text("Completed").tag(1)
                        Text("Cancelled").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    // Display different content based on the selected segment
                    if selectedSegment == 0 {
                        UpcomingEventsView(viewModel: viewModelCalendar)
                    } else if selectedSegment == 1 {
                        CompletedEventsView(viewModel: viewModelCalendar)
                    } else {
                        CancelledEventsView(viewModel: viewModelCalendar)
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

struct UpcomingEventsView: View {
    @ObservedObject var viewModel: DateTimeCalendarViewModel
    
    var body: some View {
            VStack {
                Text("My appointments")
                    .frame(width: 360, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dr. Kavish Chouhan")
                                .font(.headline)
                            Text("Dermatologist")
                                .foregroundColor(.gray)
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Image("DoctorOne")
                    }
                    .padding()
                    
                    Divider()
                        .padding([.leading, .trailing])
                    
                    HStack {
                        HStack{
                            Image(systemName: "calendar")
                            Text(formatDate(date: viewModel.currentDate))
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "clock")
                            Text(formatTime(time: viewModel.currentDate))
                                .font(.callout)
                        }
                    }
                    .padding()
                    
                    HStack{
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Cancel")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color.clear) // Set background color to clear
                                    .foregroundColor(Color("PrimaryColor"))
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("PrimaryColor"), lineWidth: 2) // Add stroke
                                    )
                            }
                        }
                        Spacer()
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Reschedule")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding([.trailing, .leading, .bottom])
                }
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                                    RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                        .stroke(Color.orange, lineWidth: 1) // Adjust border color and width
                )
                .padding()
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                Spacer()
            }.padding()
        }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    func formatTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
}

struct CompletedEventsView: View {
    @ObservedObject var viewModel: DateTimeCalendarViewModel
    
    var body: some View {
            VStack {
                Text("My appointments")
                    .frame(width: 360, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dr. Kavish Chouhan")
                                .font(.headline)
                            Text("Dermatologist")
                                .foregroundColor(.gray)
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Image("DoctorOne")
                    }
                    .padding()
                    
                    Divider()
                        .padding([.leading, .trailing])
                    
                    HStack {
                        HStack{
                            Image(systemName: "calendar")
                            Text(formatDate(date: viewModel.currentDate))
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "clock")
                            Text(formatTime(time: viewModel.currentDate))
                                .font(.callout)
                        }
                    }
                    .padding()
                    
                    HStack{
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Cancel")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color.clear) // Set background color to clear
                                    .foregroundColor(Color("PrimaryColor"))
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("PrimaryColor"), lineWidth: 2) // Add stroke
                                    )
                            }
                        }
                        Spacer()
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Reschedule")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding([.trailing, .leading, .bottom])
                }
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                        .stroke(Color.green, lineWidth: 1) // Adjust border color and width
)
.padding()
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                Spacer()
            }.padding()
        }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    func formatTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
}


struct CancelledEventsView: View {
    @ObservedObject var viewModel: DateTimeCalendarViewModel
    
    var body: some View {
            VStack {
                Text("My appointments")
                    .frame(width: 360, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dr. Kavish Chouhan")
                                .font(.headline)
                            Text("Dermatologist")
                                .foregroundColor(.gray)
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Image("DoctorOne")
                    }
                    .padding()
                    
                    Divider()
                        .padding([.leading, .trailing])
                    
                    HStack {
                        HStack{
                            Image(systemName: "calendar")
                            Text(formatDate(date: viewModel.currentDate))
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        HStack{
                            Image(systemName: "clock")
                            Text(formatTime(time: viewModel.currentDate))
                                .font(.callout)
                        }
                    }
                    .padding()
                    
                    HStack{
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Cancel")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color.clear) // Set background color to clear
                                    .foregroundColor(Color("PrimaryColor"))
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("PrimaryColor"), lineWidth: 2) // Add stroke
                                    )
                            }
                        }
                        Spacer()
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Reschedule")
                                    .frame(width: 115)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding([.trailing, .leading, .bottom])
                }
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                                    RoundedRectangle(cornerRadius: 10) // Adjust corner radius as needed
                                        .stroke(Color.red, lineWidth: 1) // Adjust border color and width
                )
                .padding()
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                Spacer()
            }.padding()
        }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    func formatTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
}


#Preview {
    CalendarView()
}
