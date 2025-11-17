//
//  UncertainView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct UncertainView: View {
    @State private var showingDiscardAlert = false
    @State private var showingDoneAlert = false
    @State private var text: String = ""
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 6)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .opacity(0.4)
                    .overlay(
                        VStack{
                            Spacer()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.red, lineWidth: 6)
                                    .fill(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                HStack{
                                    Text("Tier 3B")
                                        .padding(35)
                                        .bold()
                                        .font(.title)
                                    Spacer()
                                    Text("⚠️")
                                        .font(.title)
                                        .padding(35)
                                }
                                
                            }
                        }
                    )

                TextField("Full Name", text: $text)
                    .padding()
                    .frame(maxWidth: 370)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(Color.black, lineWidth: 3)
                    )
                
                Spacer()
                
                Button("                            DISCARD                            ", systemImage: "trash") {
                    showingDiscardAlert = true
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding()
                
                
                .alert("Are you sure?", isPresented: $showingDiscardAlert) {
                    Button("Cancel", role: .cancel) {
                        // notif disappears
                    }
                    Button("Delete", role: .destructive){
                        discard()
                    }
                }
                Button("                             DONE                                ", systemImage: "checkmark.circle") {
                    showingDoneAlert = true
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .padding()
                .alert("Are you sure?", isPresented: $showingDoneAlert) {
                    Button("Cancel", role: .cancel) {
                        // notif disappears
                    }
                    Button("Submit", role: .none) {
                        submit()
                        // submitted to database
                    }
                }
            }
            }
        }
    func discard() {
        print("deleted")
    }
    func submit() {
        print("submitted")
    }
    }

#Preview {
    UncertainView()
}
