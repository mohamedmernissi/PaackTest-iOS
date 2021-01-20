//
//  Alamofire + Extensions.swift
//  Extension
//
//  Created by mohamedmernissi on 27/05/2020.
//  Copyright © 2020 mohamedmernissi. All rights reserved.
//

import Alamofire
import PromiseKit

extension Alamofire.DataRequest {
    
    public func debugLog() -> Self {
        #if DEBUG
        cURLDescription { (task) in
            print("debuglog: ",task)
        }
        #endif
        
        return self
    }
    
    // Return a Promise for a Codable
    public func responseCodable<T: Decodable>() -> Promise<T> {
        return Promise { seal in
            responseData(queue: DispatchQueue.main) { response in
                if Reachability.isConnectedToNetwork(){
                    debugPrint("response.result: ",response.result)
                    switch response.result {
                    case .success(let value):
                        if let httpStatusCode = response.response?.statusCode {
                            print("httpStatusCodeSuccess:",httpStatusCode)
                        }
                        if let httpResponsedata = response.response {
                            print("httpResponsedata:",httpResponsedata)
                        }
                        debugPrint(value)
                        
                        let decoder = JSONDecoder()
                        do {
                            seal.fulfill(try decoder.decode(T.self, from: value))
                        } catch let error {
                            var e = error as NSError
                            print("Error.parse: ",e.localizedDescription)
                            e = NSError(domain: StringsConstants.ErrorMessageWs, code: -1, userInfo:nil)
                            seal.reject(e)
                        }
                    case .failure(let error):
                        var e = error as NSError
                        if let httpStatusCode = response.response?.statusCode {
                            print("httpStatusCodeError:",httpStatusCode)
                            do {
                                let decoder = JSONDecoder()
                                let errorResponse = try decoder.decode(ApiResponse.self, from: response.data! )
                                print("errorResponse:",errorResponse)
                                
                                e = NSError(domain: errorResponse.message ?? StringsConstants.ErrorMessageWs, code: httpStatusCode, userInfo:nil)
                                seal.reject(e)
                            } catch let e {
                                seal.reject(e)
                            }
                        }
                    }
                }
                else {
                    let e = NSError(domain: StringsConstants.InternetError, code: -12, userInfo: nil)
                    seal.reject(e)
                }
            }
        }
    }
}
// MARK: - ErrorResponse
struct ApiResponse: Codable {
    let message: String?
    let body: ApiBody?
}

// MARK: - Body
struct ApiBody: Codable {
    
}
