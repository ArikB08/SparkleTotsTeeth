//
//  ContentView.swift
//  SparkleTotsTeeth
//
//  Created by Arik Bagchi on 17/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var randInt = Int.random(in: 1...3)
    var body: some View {
        if randInt > 1 {
//           l
        
        } else {
            LowTierView()
        }
    }
}

#Preview {
    ContentView()
}
