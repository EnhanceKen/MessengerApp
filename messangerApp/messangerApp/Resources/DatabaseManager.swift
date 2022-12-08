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
    
    public func getAllUsers(completion: @escaping(Result<[[String: String]], Error>) -> Void){
        database.child("users").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [[String: String]] else {
                completion(.failure(DatabaseError.failedToFetch))
                return
            }
            completion(.success(value))
        })
    }
    
    public enum DatabaseError: Error {
        case failedToFetch
    }
}
