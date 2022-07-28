//
//  NetworkService.swift
//  RecipeApp
//
//  Created by Ozan Gülhan on 21.06.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder) async throws -> T
}

class NetworkService: NSObject, NetworkServiceProtocol {

    var urlSession: NetworkLoader

    public init(urlSession: NetworkLoader = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func request<T: Decodable>(with requestObject: RequestObject,
                                      decoder: JSONDecoder) async throws -> T {
        do {
            let urlRequest = try requestObject.getUrlRequest()
            let (data, response) = try await urlSession.dataTask(for: urlRequest, delegate: self)
            return try handle(response, with: decoder, with: data)
        } catch {
            return try handle(error: error)
        }
    }
    
    private func handle<T: Decodable>(_ response: URLResponse?,
                                      with decoder: JSONDecoder,
                                      with data: Data?) throws -> T {
        guard let httpData = data else {
            return try handle(response, data: data)
        }

        do {
            return try decoder.decode(T.self, from: httpData)
        } catch {
            return try handle(response, data: data, error: error)
        }
    }

    private func handle<T: Decodable>(_ response: URLResponse? = nil,
                                      data: Data? = nil,
                                      error: Error? = nil) throws -> T {
        if let response = response as? HTTPURLResponse,
            let httpStatus = response.httpStatus, httpStatus.httpStatusType != .success {
            throw AppError.httpError(status: httpStatus)
        }

        if let err = error {
            throw AppError.unknown(error: err as NSError)
        }

        throw AppError.badResponse
    }
}

extension NetworkService: URLSessionTaskDelegate { }
