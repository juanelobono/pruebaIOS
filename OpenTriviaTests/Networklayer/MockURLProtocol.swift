//
//  MockURLProtocol.swift
//  OpenTriviaTests
//
//  Created by Nexo Soluciones on 05/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import XCTest

final class MockURLProtocol: URLProtocol {

    enum ResponseType {
        case error(Error)
        case success(HTTPURLResponse, Data? = nil)
    }

    static var responseType: ResponseType!

    static var headerFields: [String : String]?

    private lazy var session: URLSession = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()

    private(set) var activeTask: URLSessionTask?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }

    override func startLoading() {
        activeTask = session.dataTask(with: request.urlRequest!)
        activeTask?.cancel()
    }

    override func stopLoading() {
        activeTask?.cancel()
    }
}

// MARK: - URLSessionDataDelegate
extension MockURLProtocol: URLSessionDataDelegate {

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        client?.urlProtocol(self, didLoad: data)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        switch MockURLProtocol.responseType {
        case .error(let error)?:
            client?.urlProtocol(self, didFailWithError: error)
        case .success(let response, let data)?:
            //client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }

        default:
            break
        }

        client?.urlProtocolDidFinishLoading(self)
    }
}

extension MockURLProtocol {

    enum MockError: Error {
        case none
    }

    static func responseWithFailure() {
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.error(MockError.none)
    }

    static func responseWithStatus(code: Int, data: Data? = nil) {
        let httpUrlResponse = HTTPURLResponse(url: URL(string: "http://test.opentdb.com")!, statusCode: code, httpVersion: nil, headerFields: self.headerFields)!
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.success(httpUrlResponse, data)
    }
}

extension Dictionary {

    func toJSONData() -> Data? {

        let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return data
    }
}

extension String {

    func toJSONData() -> Data? {
        return self.data(using: .utf8)
    }

}

