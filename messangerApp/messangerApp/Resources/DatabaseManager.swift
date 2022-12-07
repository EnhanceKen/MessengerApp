//
//  DatabaseManager.swift
//  messangerApp
//
//  Created by Consultant on 12/6/22.
//

import Foundation
import Firebase

final class DatabaseManager {
    static let shared =  DatabaseManager()
    
    private let database = Database.database().reference()
}
// MARK: - Manage Accounts:
extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping((Bool) -> Void)) {
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })
    }
    
    
}
