//
//  AddDoctorView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 29/12/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct AddDoctorView: View {
    
    @State private var selectedDoctor: Doctor?
    
    let sampleDoctor = [Doctor(
        image: "Doctor1",
        name: "Dr. Sharmila Nayak",
        specialization: "Dermatologist",
        clinic: "Kolkata Clinin",
        pricePerReview: "200₹ per review",
        rating: "4.8",
        about: About(
            description: "Dr. Sharmila Nayak is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "17 Sector Metro Hospital, Kolkata, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
    )), Doctor(
        image: "Doctor2",
        name: "Dr. Kavish Chouhan",
        specialization: "Dermatologist",
        clinic: "Chennai Clinic",
        pricePerReview: "250₹ per review",
        rating: "4.2",
        about: About(
            description: "Dr. Kavish Chouhan is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "57 Sector Metro Hospital, Chennai, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
        )
    ), Doctor(
        image: "Doctor3",
        name: "Dr. Amrendra Kumar",
        specialization: "Dermatologist",
        clinic: "Chengalpattu Clinic",
        pricePerReview: "250₹ per review",
        rating: "4.8",
        about: About(
            description: "Dr. Amrendra Kumar is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "14 Sector Metro Hospital, Chengalpattu, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
        )
    ), Doctor(
        image: "Doctor4",
        name: "Dr. Meghana Bathina",
        specialization: "Dermatologist",
        clinic: "Delhi Clinic",
        pricePerReview: "300₹ per review",
        rating: "5.0",
        about: About(
            description: "Dr. Meghana Bathina is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "29 Sector Metro Hospital, Delhi, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
        )
    ), Doctor(
        image: "Doctor5",
        name: "Dr. Anuj Singh",
        specialization: "Dermatologist",
        clinic: "Noida Clinic",
        pricePerReview: "200₹ per review",
        rating: "4.8",
        about: About(
            description: "Dr. Anuj Singh is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "24 Sector Metro Hospital, Noida, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
        )
    ), Doctor(
        image: "Doctor6",
        name: "Dr. Rajagopal A",
        specialization: "Dermatologist",
        clinic: "Mumbai Clinic",
        pricePerReview: "250₹ per review",
        rating: "4.8",
        about: About(
            description: "Dr. Rajagopal A is one of the most prestigious dermatologists at the Chennai Central Clinic. He specializes in autoimmune skin diseases and skin cancer...",
            viewMoreAction: {}
        ),
        workingTime: WorkingTime(
            schedule: "Monday to Friday, 08:00 AM - 07:00 PM"
        ),
        address: Address(
            addressLine: "43 Sector Metro Hospital, Mumbai, India"
        ),
        sampleReview: Review(
            reviewerName: "Kate B",
            rating: "5",
            date: "July 15th 2022",
            feedback: "Dr Smith is very professional and the service is excellent. He solved my problem!"
        )
        
    )]
    
    @State private var searchElement: String = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @ObservedObject private var locationManagerDelegate = LocationManagerDelegate()
    @State private var locationManager = CLLocationManager()
    @State private var capsuleOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var userLocationText: String = "Your Location"
    
    // main screen of this view
    var body: some View {
        VStack {
            TextField("Search doctors", text: $searchElement)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                .padding([.leading, .trailing])
            
            HStack {
                Text("6 results")
                    .font(.caption)
                Spacer()
                Text(userLocationText)
                    .font(.caption)
                    .foregroundColor(Color("PrimaryColor"))
            }
            .padding([.bottom, .trailing, .leading])
            
            Map(
                coordinateRegion: $region,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode
            )
            .frame(height: 200)
            .onAppear {
                requestLocationAccess()
            }
            .onChange(of: locationManagerDelegate.lastLocation) { newLocation in
                if let newLocation = newLocation {
                    updateLocationText(location: newLocation)
                }
            }
            
            
                VStack {
                    ScrollView {
                        ForEach(sampleDoctor.indices, id: \.self) { i in
                            NavigationLink(
                                destination: DoctorProfileView(doctor: sampleDoctor[i]),
                                tag: sampleDoctor[i],
                                selection: $selectedDoctor
                            ) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                
                                HStack {
                                    Image("Doctor\(i + 1)") // Assuming your image names are "Doctor1", "Doctor2", ...
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                        .padding()
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(sampleDoctor[i].name)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .padding(.top)
                                        Text(sampleDoctor[i].specialization)
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                        Text(sampleDoctor[i].clinic)
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                        HStack {
                                            Text(sampleDoctor[i].pricePerReview)
                                                .font(.callout)
                                            Spacer()
                                            HStack(spacing: 2) {
                                                Text(sampleDoctor[i].rating)
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
                            .foregroundColor(.black)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing])
                            .onTapGesture {
                                                        selectedDoctor = sampleDoctor[i] // Set the selected doctor when tapped
                                                    }
                        }
                            .buttonStyle(PlainButtonStyle()) // To remove NavigationLink default styling
                    }
                }
            }
        }
        .navigationBarTitle("Add a Doctor", displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func requestLocationAccess() {
        locationManager.delegate = locationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func updateLocationText(location: CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                return
            }
            
            if let city = placemark.locality, let country = placemark.country {
                userLocationText = "\(city), \(country)"
            }
        }
    }
}

class LocationManagerDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var lastLocation: CLLocation?

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        manager.stopUpdatingLocation() // Stop updating location once received
    }
}

#Preview {
    AddDoctorView()
}
