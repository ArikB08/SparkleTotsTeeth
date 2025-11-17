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
            Spacer()
            
            Button("Discard"){
                showingAlert = true
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .alert("Are you sure?", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {
                // notif disappears
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
