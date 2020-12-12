//
//  AppData.swift
//  clicker
//
//  Created by eti on 12/12/20.
//

import Foundation
import Firebase

class AppData: ObservableObject {
    
    @Published var persons: [Target] = []
    
    let db = Firestore.firestore()
    
    init() {
        readCounterData()
    }
    
    func increaseCounter(target: Target) {
        var ref: DocumentReference? = nil
        ref = db.collection("counter").addDocument(data: [
            "id": target.id,
            "macAddress": target.macAddress ?? "",
            "startDate": target.startDate.description,
            "endDate": target.endDate?.description ?? "",
            "status": target.status.rawValue,
            "trackingType": target.trackingType.rawValue
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func readCounterData() {
        db.collection("counter").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}

