//
//  UserNetwork.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation
import SwiftUI

typealias onSuccess = (UserModel) -> Void
typealias onError = (String) -> Void

protocol UserNetworkProtocol {
    func getUser(with uid: String, token: String, onSuccess: @escaping onSuccess, onError: @escaping onError)
}

final class UserNetwork: UserNetworkProtocol {
    
    private let decoder = JSONDecoder()
    
    func getUser(with uid: String, token: String, onSuccess: @escaping onSuccess, onError: @escaping onError) {
        
        let sessionConfig = URLSessionConfiguration.default
        let authValue: String? = "Bearer \(token)"
        sessionConfig.httpAdditionalHeaders = ["Authorization": authValue ?? ""]
        let session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        
        guard let url = URL(string:
                                "\(URLContants.BASE_URL)\(uid)") else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                    
                if let error = error {
                    debugPrint("ERROR GET USER", error.localizedDescription)
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response")
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    
                    if response.statusCode == 403 {
                        onError("Unauthorized")
                        return
                    }
                    
                    if response.statusCode == 200 {
                        let user = try self.decoder.decode(UserModel.self, from: data)
                        
                        onSuccess(user)
                        return
                    }
                    
                } catch {
                    onError(error.localizedDescription)
                    return
                }
            }
        }
        
        task.resume()
    }
    
}
