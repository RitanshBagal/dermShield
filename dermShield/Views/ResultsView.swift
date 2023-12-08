//
//  ResultView.swift
//  dermShieldModelTesting
//
//  Created by Abhishek Jadaun on 09/01/24.
//

import SwiftUI

struct ResultView: View {
    
    // for receiving the data from the ML model
    var predictions: [ImageRecognitionViewModel.Prediction]
    
    init(predictions: [ImageRecognitionViewModel.Prediction]) {
        // Use a set to keep track of seen classes
        var seenClasses = Set<String>()
        
        // Filter out duplicates based on class
        self.predictions = predictions.filter { prediction in
            let isUnique = seenClasses.insert(prediction.class).inserted
            return isUnique
        }
        
        // Log the filtered predictions
        print("Filtered Predictions in ResultView: \(self.predictions)")
    }
    
    
    
    //body
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Image(systemName: "checkmark.gobackward")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding(.leading)
                        .navigationBarTitle("result", displayMode: .inline)
                    HStack{
                        VStack{
                            HStack{
                                Text("Case saved")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Stored in your Case files")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                NavigationLink(destination: EmptyView(), label: {
                                    HStack{
                                        Text("View")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.orange)
                                        Image(systemName: "arrow.right")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                        .foregroundColor(.orange)                            }
                                })
                            }
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
                .padding(.top)
                
                
                HStack {
                    HStack{
                        VStack{
                            HStack{
                                Text("Recommendation")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .padding(.bottom, 3)
                                Spacer()
                            }
                            HStack{
                                Text("The analysis indicate that you may have a serious condition.  You should send your results to a doctor for further evaluation.")
                                    .font(.caption)
                                Spacer()
                            }
                        }
                        .padding()
                        Image(systemName: "exclamationmark.square.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.red)
                            .padding([.leading, .trailing])
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2) // Add shadow directly
                .padding([.top, .bottom])
                
                
                VStack {
                    HStack{
                        Text("Possible results")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                    }
                    .padding([.trailing, .leading, .top])
                    
                    Divider()
                        .padding([.leading, .trailing])
                    
                    
                    ForEach(predictions, id: \.class) { prediction in
                        if(prediction.class == "nodules"){
                            var risk = "High risk"
                            NavigationLink(destination: DiseaseDescription(predictionClass: prediction.class, Confidence: prediction.confidence)){
                                HStack{
                                    var progressValue: Double = prediction.confidence
                                    ProgressView(value: progressValue, total: 1.0)
                                        .accentColor(.red)
                                        .frame(width: 70)
                                        .padding(.leading)
                                    
                                    VStack(alignment: .leading){
                                        Text("\(prediction.class)")
                                            .font(.callout)
                                        HStack{
                                            Text(risk)
                                                .font(.caption)
                                            Text(String(format: "%.1f%%", progressValue * 100))
                                                .font(.caption)
                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .padding([.trailing, .leading])
                                }}
                            .foregroundColor(.black)
                            .padding()
                            Divider()
                                .padding([.leading, .trailing])
                            
                        } else if(prediction.class == "pustules"){
                            var risk = "Medium risk"
                            NavigationLink(destination: DiseaseDescription(predictionClass: prediction.class, Confidence: prediction.confidence)){
                                HStack{
                                    var progressValue: Double = prediction.confidence
                                    ProgressView(value: progressValue, total: 1.0)
                                        .accentColor(.orange)
                                        .frame(width: 70)
                                        .padding(.leading)
                                    
                                    VStack(alignment: .leading){
                                        Text("\(prediction.class)")
                                            .font(.callout)
                                        HStack{
                                            Text(risk)
                                                .font(.caption)
                                            Text(String(format: "%.1f%%", progressValue * 100))
                                                .font(.caption)
                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .padding([.trailing, .leading])
                                }}
                            .foregroundColor(.black)
                            .padding()
                            Divider()
                                .padding([.leading, .trailing])
                            
                        } else if(prediction.class == "papules"){
                            var risk = "Medium risk"
                            NavigationLink(destination: DiseaseDescription(predictionClass: prediction.class, Confidence: prediction.confidence)){
                                HStack{
                                    var progressValue: Double = prediction.confidence
                                    ProgressView(value: progressValue, total: 1.0)
                                        .accentColor(.orange)
                                        .frame(width: 70)
                                        .padding(.leading)
                                    
                                    VStack(alignment: .leading){
                                        Text("\(prediction.class)")
                                            .font(.callout)
                                        HStack{
                                            Text(risk)
                                                .font(.caption)
                                            Text(String(format: "%.1f%%", progressValue * 100))
                                                .font(.caption)
                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .padding([.trailing, .leading])
                                }}
                            .foregroundColor(.black)
                            .padding()
                            Divider()
                                .padding([.leading, .trailing])
                            
                        } else if (prediction.class == "whiteheads" || prediction.class == "blackheads" || prediction.class == "dark spot" || prediction.class == "comedone") {
                            var risk = "Low risk"
                            NavigationLink(destination: DiseaseDescription(predictionClass: prediction.class, Confidence: prediction.confidence)){
                                HStack{
                                    var progressValue: Double = prediction.confidence
                                    ProgressView(value: progressValue, total: 1.0)
                                        .accentColor(.green)
                                        .frame(width: 70)
                                        .padding(.leading)
                                    
                                    VStack(alignment: .leading){
                                        Text("\(prediction.class)")
                                            .font(.callout)
                                        HStack{
                                            Text(risk)
                                                .font(.caption)
                                            Text(String(format: "%.1f%%", progressValue * 100))
                                                .font(.caption)
                                        }
                                    }
                                    .padding([.leading, .trailing])
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .padding([.trailing, .leading])
                                }}
                            .foregroundColor(.black)
                            .padding()
                            Divider()
                                .padding([.leading, .trailing])
                        }
                        
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2) // Add shadow directly
            }
            .padding([.trailing, .leading])
            
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                NavigationLink(destination: MyDoctorsView()) {
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
            
            NavigationLink(destination: ScanView()) {
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


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        // Create sample predictions array for preview
        let samplePredictions: [ImageRecognitionViewModel.Prediction] = [
            ImageRecognitionViewModel.Prediction(x: 0.1, y: 0.1, width: 0.2, height: 0.2, confidence: 0.9, class: "papules"),
            ImageRecognitionViewModel.Prediction(x: 0.3, y: 0.3, width: 0.4, height: 0.4, confidence: 0.8, class: "whiteheads")
        ]
        
        // Return the ResultView with sample predictions
        return ResultView(predictions: samplePredictions)
    }
}
