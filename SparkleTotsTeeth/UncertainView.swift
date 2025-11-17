//
//  UncertainView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct UncertainView: View {
    @State private var childName = ""
    @State private var showingDiscardAlert = false
    @State private var showingDoneAlert = false
    
    var body: some View {
        VStack{
            TextField("Enter Child's full name", text: $childName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
            
            Button("Discard", systemImage: "trash"){
                showingDiscardAlert = true
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .alert("Are you sure?", isPresented: $showingDiscardAlert) {
            Button("Cancel", role: .cancel) {
                // notif disappears
            }
            Button("Delete", role: .destructive){
                print("discarded")
                // discard logic
            }
        }
            Button("Done", systemImage: "checkmark.circle"){
                showingDoneAlert = true
            }
            .buttonStyle(.bordered)
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
    

#Preview {
    UncertainView()
}
