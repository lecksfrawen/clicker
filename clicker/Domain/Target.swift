//
//  Person.swift
//  clicker-ios
//
//  Created by eti on 12/12/20.
//

import Foundation


struct Target: Identifiable {
    
    enum State: String {
        case entered
        case gone
    }
    
    enum TrackingType: String {
        case clicker
        case cameraOnAccessPoint
        case wifi
        case unkwown
    }
    
    var id: String = UUID().uuidString
    var macAddress: String?
    var startDate: Date = Date()
    var endDate: Date? = Date()
    var status: State = .entered
    var trackingType: TrackingType
}
