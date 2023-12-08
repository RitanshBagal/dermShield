//
//  UserFirstView.swift
//  dermShield
//
//  Created by Abhishek Jadaun on 10/12/23.
//

import SwiftUI

struct UserFirstView: View {
    
    var body: some View {
        TabView(){
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CaseView()
                .tabItem {
                    Image(systemName: "doc")
                    Text("Case")
                }
            ScanView()
                .tabItem {
                    Image(systemName: "camera")
                    Text("Scan")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
        }
        .accentColor(Color("PrimaryColor"))
        .navigationBarHidden(true)
    }
}

#Preview {
    UserFirstView()
}
