//
//  LowTierView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct LowTierView: View {
    @State private var showingDoneAlert = false
    
    var body: some View {
        VStack{
            Spacer()
            
            Button("                             DONE                               ", systemImage: "checkmark.circle"){
                showingDoneAlert = true
            }
            .buttonStyle(.borderedProminent)
            .alert("Are you sure?", isPresented: $showingDoneAlert) {
                Button("Cancel", role: .cancel) {
                    // notif disappears
                }
                Button("Submit", role: .none) {
                    // submitted to database
                }
            }
        }
    }
}

#Preview {
    LowTierView()
}
