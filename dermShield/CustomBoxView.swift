//
//  CustomBoxView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 18/12/23.
//

import SwiftUI

struct CustomBoxView: View {
    var body: some View {
        ZStack{
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    Image("Face")
                        .frame(width: 120, height: 85)

                    Text("Face")
                        .padding(.bottom, 8)
                        
                }
                .background(Color("SkinColor"))
            }
            .background(Color.white)
            .cornerRadius(20.0)
            .padding([.leading, .trailing]) // Add padding to the outer frame
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
        }
    }
}

#Preview {
    CustomBoxView()
}
