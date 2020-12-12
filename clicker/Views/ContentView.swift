//
//  ContentView.swift
//  clicker-ios
//
//  Created by eti on 12/12/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appData = AppData()
    var body: some View {
        ClickerView(appData: appData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
