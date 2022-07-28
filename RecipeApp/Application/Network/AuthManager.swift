//
//  AuthManager.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 24.06.2022.
//

import Foundation

struct Token {
    var value: String
    
    func isValid() -> Bool {
        return true
    }
}

actor AuthManager {
    private var currentToken: Token? = Token(value: "newToken-newToken")
    private var refreshTask: Task<Token, Error>?
    
    func validToken() async throws -> Token {
        if let handle = refreshTask {
            return try await handle.value
        }
        
        guard let token = currentToken else {
            throw AuthError.missingToken
        }
        
        if token.isValid() {
            return token
        }
        
        return try await refreshToken()
    }

    func refreshToken() async throws -> Token {
        if let refreshTask = refreshTask {
            return try await refreshTask.value
        }
        
        let task = Task { () throws -> Token in
            defer { refreshTask = nil }
            let newToken = Token(value: "new-token-new-token")
            currentToken = newToken
            return newToken
        }
        
        self.refreshTask = task
        
        return try await task.value
    }
}


enum AuthError: Error {
    case missingToken
}
