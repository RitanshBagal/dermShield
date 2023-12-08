import SwiftUI

struct DoctorProfileView: View {

    var doctor: Doctor // Receive the selected doctor as a parameter
    
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack() {
                    // Doctor's card
                    DoctorCard(doctorDetails: doctor)
                        .padding([.top, .bottom])
                    
                    // Address
                    HStack{
                        Text("Address")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                    
                    HStack{
                        Text(doctor.address.addressLine)
                            .font(.callout)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                    
                    
                    // About
                    HStack{
                        Text("About")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding([.leading, .trailing, .top])
                        Spacer()
                    }
                    
                    HStack{
                        Text(doctor.about.description)
                            .font(.callout)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                    
                    // "View More" section
                    HStack(spacing: 4) {
                        Text("View More")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                        Button(action: {
                            // Execute the View More action
                            doctor.about.viewMoreAction()
                        }) {
                            Image(systemName: "arrow.right.circle")
                                .foregroundColor(Color("PrimaryColor"))
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    .padding([.trailing, .leading, .bottom])
                }
                
                // Working Time
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text("Working Time")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding([.leading, .trailing])
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(Color("PrimaryColor"))
                            .font(.callout)
                        HStack{
                            Text(doctor.workingTime.schedule)
                                .font(.custom("NunitoSans-Regular", size: 14))
                            Spacer()
                        }
                    }
                    .padding([.trailing, .leading])
                }
                
                // Review Card
                ReviewCard(review: doctor.sampleReview)
                
                // Rest of the content...
                
                Spacer()
                
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        NavigationLink(destination: SummaryView(doctor: doctor)) {
                        Text("Select this Doctor")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50)
                    }
                    .padding()
                }

            }
            .navigationBarTitle("Doctor Profile", displayMode: .inline)
        }
    }
}

struct DoctorCard: View {
    var doctorDetails: Doctor
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                .frame(maxHeight: 125)
            HStack {
                Image(doctorDetails.image) // Replace "doctorImage" with the actual image name
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(doctorDetails.name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.top)
                    Text(doctorDetails.specialization)
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text(doctorDetails.clinic)
                        .font(.callout)
                        .foregroundColor(.gray)
                    HStack {
                        Text(doctorDetails.pricePerReview)
                            .font(.callout)
                        Spacer()
                        HStack(spacing: 2) {
                            Text(doctorDetails.rating)
                                .font(.callout)
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("PrimaryColor"))
                                .padding(.trailing)
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
        .padding([.trailing, .leading])
    }
}

// Review Card structure
struct ReviewCard: View {
    var review: Review
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Review")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()

                    HStack(spacing: 4) {
                        Text("See All")
                            .font(.caption)
                            .foregroundColor(Color("PrimaryColor"))
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }

                HStack {
                    Text(review.reviewerName)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                    HStack(spacing: 2) {
                        Text(review.rating)
                            .font(.callout)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("PrimaryColor"))
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                }

                HStack {
                    Text(review.date)
                        .font(.caption)
                        .foregroundColor(.black)
                    Spacer()
                    Text("Great")
                        .font(.caption)
                        .foregroundColor(.black)
                }

                Text(review.feedback)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
        }
        .padding()
    }
}

// Doctor structure
struct Doctor: Hashable {
    var image: String
    var name: String
    var specialization: String
    var clinic: String
    var pricePerReview: String
    var rating: String
    var about: About
    var workingTime: WorkingTime
    var address: Address
    var sampleReview: Review

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        // You can combine more properties if needed to ensure uniqueness
    }

    static func ==(lhs: Doctor, rhs: Doctor) -> Bool {
        // Implement equality based on properties you consider for uniqueness
        return lhs.name == rhs.name
    }
}

// About structure
struct About {
    var description: String
    var viewMoreAction: () -> Void // Closure for the View More action
}

// Address structure
struct Address {
    var addressLine: String
}

// WorkingTime structure
struct WorkingTime {
    var schedule: String
}

// Review structure
struct Review {
    var reviewerName: String
    var rating: String
    var date: String
    var feedback: String
}

#if DEBUG
struct DoctorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProfileView(doctor: Doctor(
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
