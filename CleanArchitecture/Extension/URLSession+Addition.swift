
//
//  URLSession+Addition.swift
//  CleanArchitecture
//
//  Created by Navneet on 14/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation

// MARK: - URLSession response handlers
extension URLSession {
    func codableTask<T: Codable>(with url: URL,
                                 completionHandler: @escaping (T?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
    {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            let a = JSONDecoder.newJSONDecoder()
            completionHandler(try? a.decode(T.self, from: data), response, nil)
        }
    }
}

// MARK: - Helper functions for creating encoders and decoders
extension JSONDecoder {
    static func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
