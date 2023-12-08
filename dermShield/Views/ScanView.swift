//
//  HomeView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 10/12/23.
//

import SwiftUI

class ImageRecognitionViewModel: ObservableObject {
    
    @Published var predictions: [Prediction] = []
    
    struct Prediction: Decodable {
        let x: Double
        let y: Double
        let width: Double
        let height: Double
        let confidence: Double
        let `class`: String
    }
    
    func performImageRecognition(with image: UIImage, completion: @escaping ([Prediction]?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 1.0)?.base64EncodedString() else {
            print("Failed to convert image to base64 string")
            completion(nil)
            return
        }
        
        let apiUrl = URL(string: "https://detect.roboflow.com/acnedet-v1/2?api_key=5ybyqFjllje0IqutefB5&name=YOUR_IMAGE.jpg")!
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = imageData.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                completion(nil)
                return
            }
            
            do {
                let predictionsResponse = try JSONDecoder().decode(PredictionsResponse.self, from: data)
                
                // Log the fetched predictions
                print("Fetched Predictions: \(predictionsResponse.predictions)")
                
                // Update the predictions on the main thread
                DispatchQueue.main.async {
                    self.predictions = predictionsResponse.predictions
                    completion(predictionsResponse.predictions)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }

            
        }.resume()
    }

    
    struct PredictionsResponse: Decodable {
        let predictions: [Prediction]
    }
}

// body
struct ScanView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var showResultView: Bool = false
    @StateObject private var viewModel = ImageRecognitionViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Please choose the following option.")
                        .frame(maxWidth: 360, alignment: .leading)
                        .padding(.top)
                        .padding(.bottom, 5)
                        .navigationBarTitle("Scan")
                        .navigationBarItems(trailing:
                                                NavigationLink(destination: ProfileView(), label: {
                            Image(systemName: "person.crop.circle")
                                .font(.title3)
                                .foregroundColor(Color("PrimaryColor"))
                        }))

                    VStack() {
                        Image("analysisOne")
                            .resizable()
                            .frame(width: 330, height: 160)
                            .cornerRadius(20.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding(.top)
                            .padding(.trailing)
                            .padding(.leading)

                        Text("Analysis")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: 330, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.top, 6)

                        Text("Capture two images of the impacted area, provide a symptom description, and receive instant results and advice.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: 330, alignment: .leading)
                            .padding(.horizontal)

                        HStack {
                            Spacer()
                            Button(action: {
                                isShowingImagePicker = true
                            }) {
                                Text("Start")
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            .sheet(isPresented: $isShowingImagePicker, onDismiss: {
                                // Handle the selected image
                                if selectedImage != nil {
                                    // Save the image or perform any necessary actions
                                    // Set the flag to show SymptomsView
                                    showResultView = true
                                    
                                    // image sent to the dataset ML API to fetch the results
                                    if let imageToRecognize = selectedImage {
                                        viewModel.performImageRecognition(with: imageToRecognize) { fetchedPredictions in
                                            DispatchQueue.main.async {
                                                if let fetchedPredictions = fetchedPredictions, !fetchedPredictions.isEmpty {
                                                    // Navigate to ResultView with predictions
                                                    self.showResultView = true
                                                } else {
                                                    // Handle error or no predictions scenario
                                                    print("No predictions fetched or empty predictions array")
                                                }
                                            }
                                        }
                                    }
                                    // end to ML model request sent
                                }
                            }) {
                                ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
                            }
                            .background(
                                NavigationLink(destination: ResultView(predictions: viewModel.predictions).toolbar(.hidden, for: .tabBar), isActive: $showResultView) {
                                    EmptyView()
                                }
                            )
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding([.leading, .trailing])
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    Spacer()
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    ScanView()
}
