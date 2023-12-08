import SwiftUI

struct SummaryView: View {
    var doctor: Doctor // Receive the selected doctor as a parameter
    @State private var fullName: String = "Demo user"
    @State private var gender: String = "Male"
    @State private var age: String = "25"
    @StateObject private var viewModelCases = DateTimeCasesViewModel()
    
    var body: some View {
        ZStack {
            ScrollView{
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text("Patient's medical summary")
                            .font(.callout)
                            .foregroundColor(.black)
                            .navigationBarTitle("summary", displayMode: .inline)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                    
                    VStack() {
                        HStack{
                            Text("Full Name")
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        .padding(.top)
                        TextField("Enter full name", text: $fullName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding([.leading, .trailing])
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    Text("Gender")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding([.leading, .trailing])
                                    Spacer()
                                }
                                
                                TextField("Enter gender", text: $gender)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing])
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    Text("Age")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding([.leading, .trailing])
                                    Spacer()
                                }
                                
                                TextField("Enter age", text: $age)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing])
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                            }
                        }
                        .padding(.top, 5)
                        
                        HStack {
                            Text("See full medical profile")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(Color("PrimaryColor"))
                            Image(systemName: "arrow.right.circle")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(Color("PrimaryColor"))
                            Spacer()
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    .padding([.leading, .trailing])
                    
                    HStack{
                        Text("Case details")
                            .font(.custom("NunitoSans-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding([.leading, .trailing, .top])
                        Spacer()
                    }
                    
                    LowRiskCases(viewModel: viewModelCases)
                    
                    HStack{
                        Text("Doctor details")
                            .font(.custom("NunitoSans-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding([.leading, .trailing, .top])
                        Spacer()
                    }
                    
                    // Add Doctor's card here
                    DoctorCard(doctorDetails: doctor)
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        NavigationLink(destination: SymptomsView()) {
                        Text("Choose your Doctor")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50)
                    }
                        .padding([.leading, .trailing, .top])
                        .padding(.bottom, 8)
                }
                    
                    NavigationLink(destination: MyDoctorsView()) {
                        Text("Not now")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color("PrimaryColor"), lineWidth: 5)
                            )
                            .cornerRadius(50)
                    }
                    .padding([.leading, .trailing, .bottom])
                    }
                }
            }
        }
    }

#if DEBUG
struct SummaaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(doctor: Doctor(
            image: "SampleImage",
            name: "Dr. Sample Doctor",
            specialization: "Specialization",
            clinic: "Sample Clinic",
            pricePerReview: "100₹ per review",
            rating: "4.5",
            about: About(
                description: "Sample description about the doctor.",
                viewMoreAction: {}
            ),
            workingTime: WorkingTime(
                schedule: "Monday to Friday, 09:00 AM - 06:00 PM"
            ),
            address: Address(
                addressLine: "123 Main Street, City, Country"
            ),
            sampleReview: Review(
                reviewerName: "John Doe",
                rating: "4.0",
                date: "January 1, 2024",
                feedback: "Great experience with Dr. Sample Doctor!"
            )
        ))
    }
}
#endif

