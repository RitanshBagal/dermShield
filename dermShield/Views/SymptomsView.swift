//
//  SymptomsView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 17/12/23.
//

import SwiftUI

struct SymptomsView: View {
    
    @State private var showConfirmation = false
    @State private var navigateToNextScreen = false
    
    @State private var selectedBodyPart: String? = nil
    @State private var selectedTime: String? = nil
    @State private var selectedSymptom: String? = nil
    @State private var selectedBoxSymptom: String? = nil
    
    @State private var isMenuVisibleTime = false
    @State private var selectedOptionTime = ""
    
    @State private var isMenuVisibleSymptom = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Please describe your symptoms.")
                    .frame(maxWidth: 360, alignment: .leading)
                    .fontWeight(.semibold)
                    .navigationBarTitle("Symptoms", displayMode: .inline)
                    .padding(.bottom)
                    .padding(.top)
                
                Text("Select affected body part. ")
                    .frame(maxWidth: 360, alignment: .leading)
                    .font(.system(size: UIFont.systemFontSize))
                
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CustomBoxBodyParts(image: Image("Face"), text: Text("Face"), isSelected: selectedBodyPart == "Face") {
                                selectedBodyPart = "Face"
                            }
                            CustomBoxBodyParts(image: Image("Chest"), text: Text("Chest"), isSelected: selectedBodyPart == "Chest") {
                                selectedBodyPart = "Chest"
                            }
                            CustomBoxBodyParts(image: Image("Back"), text: Text("Back"), isSelected: selectedBodyPart == "Back") {
                                selectedBodyPart = "Back"
                            }
                            CustomBoxBodyParts(image: Image("Neck"), text: Text("Neck"), isSelected: selectedBodyPart == "Neck") {
                                selectedBodyPart = "Neck"
                            }
                            CustomBoxBodyParts(image: Image("Shoulder"), text: Text("Shoulder"), isSelected: selectedBodyPart == "Shoulder") {
                                selectedBodyPart = "Shoulder"
                            }
                        }
                    }
                    .padding(.top, 5)
                }
                .padding([.leading, .trailing])
                
                Divider()
                .padding()
                
                Text("How long have you had the skin condition? ")
                    .frame(maxWidth: 360, alignment: .leading)
                    .font(.system(size: UIFont.systemFontSize))
                    .padding(.bottom, 5)
                    .padding([.leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CustomBoxTime(text: "Up to a week", isSelected: selectedTime == "Up to a week") {
                            selectedTime = "Up to a week"
                        }
                        CustomBoxTime(text: "Around 2 weeks", isSelected: selectedTime == "Around 2 weeks") {
                            selectedTime = "Around 2 weeks"
                        }
                        CustomBoxTime(text: "Up to a month", isSelected: selectedTime == "Up to a month") {
                            selectedTime = "Up to a month"
                        }
                        CustomBoxTime(text: "Several months", isSelected: selectedTime == "Several months") {
                            selectedTime = "Several months"
                        }
                        CustomBoxTime(text: "Up to a year", isSelected: selectedTime == "Up to a year") {
                            selectedTime = "Up to a year"
                        }
                    }
                }
                .padding([.leading, .trailing])
                .frame(height: 60)
                
                Divider()
                    .padding()  // Adjusted padding for dividers
                
                Text("Select any symptoms related to your skin condition.")
                    .frame(maxWidth: 360, alignment: .leading)
                    .font(.system(size: UIFont.systemFontSize))
                    .padding([.leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CustomBoxSymptoms(image: Image("Bleeding"), text: Text("Bleeding"), isSelected: selectedBoxSymptom == "Bleeding") {
                            selectedBoxSymptom = "Bleeding"
                        }
                        CustomBoxSymptoms(image: Image("Itching"), text: Text("Itching"), isSelected: selectedBoxSymptom == "Itching") {
                            selectedBoxSymptom = "Itching"
                        }
                        CustomBoxSymptoms(image: Image("Growing"), text: Text("Growing"), isSelected: selectedBoxSymptom == "Growing") {
                            selectedBoxSymptom = "Growing"
                        }
                        CustomBoxSymptoms(image: Image("Changing"), text: Text("Changing"), isSelected: selectedBoxSymptom == "Changing") {
                            selectedBoxSymptom = "Changing"
                        }
                    }
                }
                .padding([.leading, .trailing])
                .padding(.top, 5)
                
                Divider()
                    .padding()  // Adjusted padding for dividers
                
                Text("Add more symptoms for a more accurate result. ")
                    .frame(maxWidth: 360, alignment: .leading)
                    .font(.system(size: UIFont.systemFontSize))
                    .padding([.leading, .trailing])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CustomBoxSymptom(text: "Acute pain", isSelected: selectedSymptom == "Acute pain") {
                            selectedSymptom = "Acute pain"
                        }
                        CustomBoxSymptom(text: "Moderate pain", isSelected: selectedSymptom == "Moderate pain") {
                            selectedSymptom = "Moderate pain"
                        }
                        CustomBoxSymptom(text: "Pain when touching", isSelected: selectedSymptom == "Pain when touching") {
                            selectedSymptom = "Pain when touching"
                        }
                        CustomBoxSymptom(text: "Punctual pain", isSelected: selectedSymptom == "Punctual pain") {
                            selectedSymptom = "Punctual pain"
                        }
                    }
                }
                .padding([.leading, .trailing])
                .frame(height: 60)
                
            Button(action: {
                                // Action to perform when the button is tapped
                                showConfirmation = true
                            }) {
                                Text("Submit")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color("PrimaryColor"))
                                    .cornerRadius(50)
                            }
                            .padding([.leading, .trailing, .top])
                            .alert(isPresented: $showConfirmation) {
                                Alert(
                                    title: Text("Results Sent!"),
                                    message: Text("The doctor will send you a message within 48 hours with his recommendations and next steps."),
                                    dismissButton: .default(Text("Ok")) {
                                        navigateToNextScreen = true
                                    }
                                )
                            }
                            
                            NavigationLink(
                                destination: UserFirstView(),
                                isActive: $navigateToNextScreen,
                                label: { EmptyView() }
                            )
                        }
                    }
                }


struct CustomBoxBodyParts: View {
    var image: Image
    var text: Text
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .topTrailing) {
                VStack {
                    image
                        .resizable()
                        .frame(width: 120, height: 80)
                    
                    text
                        .padding(.bottom, 8)
                }
                Image(systemName: "checkmark.square.fill")
                    .font(.title)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
                if isSelected {
                    Image(systemName: "checkmark.square.fill")
                        .font(.title)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .background(Color("SkinColor"))
            .foregroundColor(.black)
            .cornerRadius(20.0)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct CustomBoxSymptoms: View {
    var image: Image
    var text: Text
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .topTrailing) {
                VStack {
                    image
                        .frame(width: 120, height: 70)
                    
                    text
                        .padding(.bottom, 8)
                }
                
                Image(systemName: "checkmark.square.fill")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
                if isSelected {
                    Image(systemName: "checkmark.square.fill")
                        .font(.title)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(20.0)
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}


struct CustomBoxTime: View {
    var text: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .padding()
                .foregroundColor(Color("PrimaryColor"))
                .background(isSelected ? Color("SkinColor").opacity(0.5) : Color.gray.opacity(0.1))
                .cornerRadius(15)
        }
    }
}

struct CustomBoxSymptom: View {
    var text: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .padding()
                .foregroundColor(Color("PrimaryColor"))
                .background(isSelected ? Color("SkinColor").opacity(0.5) : Color.gray.opacity(0.1))
                .cornerRadius(15)
        }
    }
}

#Preview {
    SymptomsView()
}
