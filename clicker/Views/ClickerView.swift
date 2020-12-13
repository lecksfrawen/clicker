//
//  ClickerView.swift
//  clicker-ios
//
//  Created by eti on 12/12/20.
//

import SwiftUI

struct ClickerView: View {
    @ObservedObject var appData = AppData()
    var body: some View {
        VStack {
            HStack {
                Button(action: onAdd) {
                    Text("Simulate new person")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func onAdd() {
        let newTarget = Target(
            macAddress: "aa:bb:cc:dd:ee:ff",
            trackingType: .wifi
        )
        appData.increaseCounter(target: newTarget)
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
