//
//  LowTierView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//
//
//import SwiftUI
//
//struct LowTierView: View {
//    @State private var showingDoneAlert = false
//    
//    var body: some View {
//        VStack{
//            Spacer()
//            
//            Button("                             DONE                               ", systemImage: "checkmark.circle"){
//                showingDoneAlert = true
//            }
//            .buttonStyle(.borderedProminent)
//            .alert("Are you sure?", isPresented: $showingDoneAlert) {
//                Button("Cancel", role: .cancel) {
//                    // notif disappears
//                }
//                Button("Submit", role: .none) {
//                    // submitted to database
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    LowTierView()
//}


//
//  UncertainView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct LowTierView: View {
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
                                    .stroke(Color.green, lineWidth: 6)
                                    .fill(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                HStack{
                                    Text("Tier 1A")
                                        .padding(35)
                                        .bold()
                                        .font(.title)
                                }
                                
                            }
                        }
                    )
                
                Spacer()
                
                Button {
                    showingDoneAlert = true
                } label: {
                    HStack{
                        Image(systemName: "checkmark.circle")
                        Text("DONE                                                          ")
                            .bold()
                            .font(.system(size: 20))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .opacity(0.9)
                .alert("Are you sure?", isPresented: $showingDoneAlert) {
                    Button("Cancel", role: .cancel) {
                        // notif disappears
                    }
                    Button("Submit", role: .none) {
                        submit()
                        }
                }
            }
            }
        }
    func submit() {
        print("submitted")
    }
}

#Preview {
    LowTierView()
}
