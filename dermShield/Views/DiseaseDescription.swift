//
//  DiseaseDescription.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 13/01/24.
//

import SwiftUI

struct DiseaseDescription: View {
    @State private var showDescription: Bool = true
    @State private var showCauses: Bool = false
    @State private var showSymptoms: Bool = false
    @State private var showTreatment: Bool = false
    let predictionClass: String
    let Confidence: Double
    var body: some View {
        VStack {
            if(predictionClass == "nodules"){
                var risk = "High risk"
                VStack{
                    var progressValue: Double = Confidence
                    
                    HStack{
                        Text("\("\(predictionClass.prefix(1).capitalized + predictionClass.dropFirst())")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        HStack{
                            ProgressView(value: progressValue, total: 1.0)
                                .accentColor(.red)
                                .frame(width: 70)
                            
                            HStack{
                                Text(risk)
                                    .font(.caption)
                                Text(String(format: "%.1f%%", progressValue * 100))
                                    .font(.caption)
                            }
                            
                        }
                        Spacer()
                    }
                }
                .foregroundColor(.black)
                .padding()
                Divider()
                    .padding([.leading, .trailing])
                
                ScrollView{
                    
                    HStack{
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showDescription.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showDescription{
                        Text("Nodular acne is a severe form of acne vulgaris characterized by the presence of large, painful, and inflamed lesions deep within the skin. These nodules are typically hard to the touch and often red or skin-colored. Unlike surface-level pimples, nodules form deep within the skin and can be quite painful to the touch. They are more significant than typical pimples and can lead to scarring if not properly treated.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Image("description1")
                            Image("description2")
                            Image("description3")
                            Image("description4")
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Causes")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showCauses.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showCauses{
                        Text("The development of nodular acne is often attributed to various factors, including hormonal imbalances, genetics, and increased sebum production. Hormonal fluctuations, such as those experienced during puberty, menstruation, or hormonal disorders like polycystic ovary syndrome (PCOS), can trigger the onset of nodular acne. Additionally, genetic predispositions may make certain individuals more susceptible to developing severe forms of acne, including nodules.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Symptoms")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showSymptoms.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showSymptoms{
                            
                        Text("Symptoms of nodular acne primarily revolve around the appearance and sensation of deep, inflamed lesions beneath the skin's surface. Common symptoms include the presence of large, painful nodules that are hard to the touch, redness, and inflammation around the affected area. Unlike superficial acne, nodular acne does not typically come to a head or resolve on its own easily. The condition can lead to significant discomfort and may result in scarring if not adequately managed.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Treatment")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showTreatment.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showTreatment{
                        Text("Treatment for nodular acne often requires a comprehensive approach tailored to the severity and individual needs of the patient. Common treatment modalities include oral medications such as antibiotics, isotretinoin (Accutane), or corticosteroids to reduce inflammation and prevent scarring. Dermatologists may also employ procedures like corticosteroid injections directly into the nodules to expedite healing. Additionally, maintaining a consistent skincare routine, avoiding comedogenic products, and consulting with a dermatologist for personalized treatment recommendations are essential steps in managing nodular acne effectively.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing, .bottom])
                    }
                    
                }

                
            } else if(predictionClass == "papules"){
                var risk = "Medium risk"
                VStack{
                    var progressValue: Double = Confidence
                    
                    HStack{
                        Text("\("\(predictionClass.prefix(1).capitalized + predictionClass.dropFirst())")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        HStack{
                            ProgressView(value: progressValue, total: 1.0)
                                .accentColor(.orange)
                                .frame(width: 70)
                            
                            HStack{
                                Text(risk)
                                    .font(.caption)
                                Text(String(format: "%.1f%%", progressValue * 100))
                                    .font(.caption)
                            }
                            
                        }
                        Spacer()
                    }
                }
                .foregroundColor(.black)
                .padding()
                Divider()
                    .padding([.leading, .trailing])
                
                ScrollView{
                    
                    HStack{
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showDescription.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showDescription{
                        Text("Papules are small, raised bumps or lesions on the skin that are typically less than 1 centimeter in diameter. These bumps can vary in color, ranging from pink to red to brown, and they may or may not be accompanied by other symptoms like itching or pain.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Image("description1")
                            Image("description2")
                            Image("description3")
                            Image("description4")
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Causes")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showCauses.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showCauses{
                        Text("The development of papules on the skin can be attributed to a variety of factors and conditions. One prevalent cause is acne vulgaris, particularly during adolescence due to hormonal fluctuations. Other common triggers include allergic reactions to substances like plants, foods, or chemicals. Additionally, insect bites, skin infections caused by bacteria, fungi, or viruses, and conditions like contact dermatitis, rosacea, or adverse reactions to specific medications can lead to the formation of papules.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Symptoms")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showSymptoms.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showSymptoms{
                            
                        Text("Symptoms associated with papules primarily revolve around their appearance and possible accompanying sensations. These small, raised bumps can manifest in various colors such as pink, red, or brown. While some individuals may experience itching or discomfort, others may not have any associated symptoms. The texture of papules is typically rough to the touch, and their distribution can vary depending on the underlying cause.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Treatment")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showTreatment.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showTreatment{
                        Text("Treatment for papules is largely dependent on identifying the underlying cause through consultation with a healthcare provider or dermatologist. General treatment approaches may involve topical creams containing ingredients like benzoyl peroxide or corticosteroids to address inflammation. Oral medications, including antibiotics or antihistamines, may be prescribed based on the specific diagnosis. In certain cases, procedural interventions like cryotherapy or laser therapy may be recommended.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing, .bottom])
                    }
                    
                }

            } else if(predictionClass == "pustules"){
                var risk = "Medium risk"
                VStack{
                    var progressValue: Double = Confidence
                    
                    HStack{
                        Text("\("\(predictionClass.prefix(1).capitalized + predictionClass.dropFirst())")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        HStack{
                            ProgressView(value: progressValue, total: 1.0)
                                .accentColor(.orange)
                                .frame(width: 70)
                            
                            HStack{
                                Text(risk)
                                    .font(.caption)
                                Text(String(format: "%.1f%%", progressValue * 100))
                                    .font(.caption)
                            }
                            
                        }
                        Spacer()
                    }
                }
                .foregroundColor(.black)
                .padding()
                Divider()
                    .padding([.leading, .trailing])
                
                ScrollView{
                    
                    HStack{
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showDescription.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showDescription{
                        Text("Pustular acne is a moderate form of acne characterized by inflamed, pus-filled lesions known as pustules. These lesions appear as small, red bumps on the skin's surface and contain yellow or white pus at the center. Pustules are typically tender to the touch and can be accompanied by redness and inflammation around the affected area. Unlike blackheads or whiteheads, pustules indicate a more severe inflammatory response and may be more prominent and noticeable on the skin.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Image("description1")
                            Image("description2")
                            Image("description3")
                            Image("description4")
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Causes")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showCauses.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showCauses{
                        Text("The development of pustular acne is often linked to factors such as excess sebum production, bacterial overgrowth (specifically Propionibacterium acnes), and inflammation. Hormonal fluctuations, stress, certain medications, and dietary factors may also contribute to the onset or exacerbation of pustular acne. Additionally, genetic predispositions and underlying skin conditions can make individuals more susceptible to developing pustular lesions.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Symptoms")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showSymptoms.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showSymptoms{
                            
                        Text("Symptoms of pustular acne primarily revolve around the appearance and characteristics of pus-filled lesions on the skin's surface. Common symptoms include the presence of inflamed, tender pustules containing yellow or white pus. These lesions may be surrounded by redness and inflammation, causing discomfort or pain when touched. Without proper treatment, pustular acne can lead to the formation of more significant lesions, scarring, and persistent skin issues.")
                            .font(.callout)
                            .padding(.top, 1)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Treatment")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showTreatment.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showTreatment{
                        Text("The treatment approach for pustular acne often involves addressing the underlying causes, reducing inflammation, and preventing bacterial overgrowth. Topical treatments such as benzoyl peroxide, salicylic acid, or topical antibiotics may be prescribed to reduce inflammation and eliminate bacteria. In more severe cases, oral antibiotics, retinoids, or hormonal treatments may be recommended by a dermatologist. Additionally, maintaining a consistent skincare routine, avoiding comedogenic products, and consulting with a healthcare provider for personalized treatment options are essential steps in managing pustular acne effectively.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing, .bottom])
                    }
                    
                }
                
            } else if (predictionClass == "whiteheads" || predictionClass == "blackheads" || predictionClass == "dark spot" || predictionClass == "comedone") {
                var risk = "Low risk"
                VStack{
                    var progressValue: Double = Confidence
                    
                    HStack{
                        Text("\("\(predictionClass.prefix(1).capitalized + predictionClass.dropFirst())")")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        HStack{
                            ProgressView(value: progressValue, total: 1.0)
                                .accentColor(.green)
                                .frame(width: 70)
                            
                            HStack{
                                Text(risk)
                                    .font(.caption)
                                Text(String(format: "%.1f%%", progressValue * 100))
                                    .font(.caption)
                            }
                            
                        }
                        Spacer()
                    }
                }
                .foregroundColor(.black)
                .padding()
                Divider()
                    .padding([.leading, .trailing])
                
                ScrollView{
                    
                    HStack{
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showDescription.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showDescription{
                        Text("Comedones, which can manifest as either whiteheads or blackheads, are a common form of acne experienced by many individuals at some point in their lives. These are essentially blocked pores or hair follicles filled with a combination of bacteria, oil, and dead skin cells, resulting in raised bumps on the skin.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Image("description1")
                            Image("description2")
                            Image("description3")
                            Image("description4")
                        }
                        .padding()
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Causes")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showCauses.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showCauses{
                        HStack{
                            Text("\n1. Excessive Sebum Production: ")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Overproduction of sebum, an oily substance produced by the sebaceous glands, can lead to pore blockage.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("2. Hormonal Changes:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Fluctuations in hormone levels, particularly during puberty, menstruation, pregnancy, or due to conditions like polycystic ovary syndrome (PCOS), can contribute to the development of comedonal acne.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("3. Genetics")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("A family history of acne or comedonal acne can increase the likelihood of developing the condition.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("4. Cosmetics and Skincare Products:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Certain cosmetics and skincare products, especially those that are oil-based or comedogenic, can clog pores and contribute to comedone formation")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Symptoms")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showSymptoms.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showSymptoms{
                        HStack{
                            Text("\n1. Appearance of Comedones: ")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("The primary symptom is the presence of comedones, which can manifest as whiteheads (closed comedones) or blackheads (open comedones).\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("2. Skin Texture:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("The affected skin may feel rough or uneven due to the presence of these clogged pores.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("3. Mild Redness:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Some individuals may experience mild redness or inflammation around the affected areas.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("4. Occasional Breakouts:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Periodic flare-ups or breakouts may occur, especially in areas with a higher concentration of sebaceous glands, such as the face, neck, chest, and back.\n")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                        
                        HStack{
                            Text("5. Painless Lesions:")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding([.leading, .trailing])
                            Spacer()
                        }
                        
                        Text("Comedones are usually painless unless they become inflamed or infected, leading to other forms of acne like papules, pustules, or cysts.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing])
                    }
                    
                    Divider()
                        .padding([.leading, .trailing, .top])
                    
                    HStack{
                        Text("Treatment")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                withAnimation{
                                    showTreatment.toggle()
                                }
                            }
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .padding([.trailing, .leading])
                        
                    }
                    .padding([.top, .leading, .trailing])
                    
                    if showTreatment{
                        Text("Treatment for comedonal acne includes topical retinoids and salicylic acid to unclog pores and reduce inflammation. Benzoyl peroxide targets acne-causing bacteria. For severe cases, consult a dermatologist for oral medications and specialized treatments. For personalized advice, send your details to a doctor for tailored treatment recommendations.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                            .padding([.leading, .trailing, .bottom])
                    }
                    
                }

            }
        }
    }
}

struct DiseaseDescription_Previews: PreviewProvider {
    static var previews: some View {
        DiseaseDescription(predictionClass: "comedone", Confidence: 0.8)
    }
}
