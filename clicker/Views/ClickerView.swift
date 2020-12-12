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
                Text("Conteo: \(appData.persons.count)")
                Button(action: onAdd) {
                    Text("Click me!")
                }
            }
            List {
                ForEach(appData.persons) { person in
                    switch person.trackingType {
                    case .clicker, .cameraOnAccessPoint:
                        Text(person.id)
                    case .wifi:
                        Text(person.macAddress ?? "N/A")
                    default:
                        Text("Unknown")
                    }
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
