//
//  ContentView.swift
//  UsingAPIs
//
//  Created by florian schweizer on 03.04.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        Text(model.value)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
