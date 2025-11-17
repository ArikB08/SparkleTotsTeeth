////
////  UncertainView.swift
////  SparkleTotsTeeth
////
////  Created by Arik Bagchi on 17/11/25.
////
//
//import SwiftUI
//
//struct UncertainView: View {
//    @State private var childName = ""
//    @State private var showingDiscardAlert = false
//    @State private var showingDoneAlert = false
//    @Binding var randInt: Int
//    
//    var body: some View {
//        VStack{
//            Rectangle()
//                .frame(width: 250, height: 200)
//            Text("Tier \(randInt)B")
//            TextField("Enter Child's full name", text: $childName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            Spacer()
//            
//            Button("                            DISCARD                            ", systemImage: "trash"){
//                showingDiscardAlert = true
//            }
//            .frame(maxWidth: .infinity)
//            .buttonStyle(.borderedProminent)
//            .tint(.red)
//            .padding()
//            
//        }
//        .alert("Are you sure?", isPresented: $showingDiscardAlert) {
//            Button("Cancel", role: .cancel) {
//                // notif disappears
//            }
//            Button("Delete", role: .destructive){
//                discard()
//            }
//        }
//        Button("                             DONE                                ", systemImage: "checkmark.circle"){
//                showingDoneAlert = true
//            }
//            .buttonStyle(.borderedProminent)
//            .alert("Are you sure?", isPresented: $showingDoneAlert) {
//                Button("Cancel", role: .cancel) {
//                    // notif disappears
//                }
//                Button("Submit", role: .none) {
//                    submit()
//                    // submitted to database
//                }
//            }
//        }
//    
//    func submit() {
//        print("submitted")
//        }
//    
//    func discard() {
//        print("deleted")
//        }
//    }
//    
//
//#Preview {
//    UncertainView(randInt: .constant(1))
//}
