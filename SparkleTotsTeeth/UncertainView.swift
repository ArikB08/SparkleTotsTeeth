//
//  UncertainView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct UncertainView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Button("Discard"){
                showingAlert = true
            }
        }
        .buttonStyle(.bordered)
        .alert("Are you sure?", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {
                // i think the notif shld disappear
            }
            Button("Proceed", role: .destructive){
                print("discarded")
            }
        }
    }
}

#Preview {
    UncertainView()
}
