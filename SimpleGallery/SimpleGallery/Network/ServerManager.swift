//
//  ServerManager.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/29/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import Alamofire

enum ErrorCode:Int
{
    case Caneled = -999
    case NoInternet = -1009
    case UnKnown = 000
}

struct Resource<A>
{
    var url: String
    let httpmethod: Alamofire.HTTPMethod
    let parse: (Any) -> A?
}

class ServerManager: NSObject
{
    var request:DataRequest?
    //Authentication
    private var headers = ["Content-Type": "application/json", "Accept": "application/json"]
    typealias DidFinishDelegate = (AnyObject?) -> ()
    var didFinish: DidFinishDelegate?
    typealias DidFinishWithErrorDelegate = (ErrorCode, Any?) -> ()
    var didFinishWithError: DidFinishWithErrorDelegate?
    
    //MARK: - HTTPHandling -
    func httpConnect<A>(resource:Resource<A>, paramters:[String:Any]?, complation: @escaping (A?, Any?) -> (), errorHandler: @escaping (ErrorCode, Any?) -> ())
    {
        
        let url = resource.url
        headers[AUTHENTICATION_HEADER_NAME] = AUTHENTICATION_HEADER_VALUE
        request = Alamofire.request(url, method: resource.httpmethod, parameters: paramters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<500).responseJSON
            { response in
                switch response.result
                {
                case .success:
                    let value = response.result.value
                    let parse = resource.parse
                    let result = value.flatMap(parse)
                    DispatchQueue.main.async
                        {
                            complation(result, value)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async
                        {
                            if let errorEnum = ErrorCode(rawValue: error._code)
                            {
                                errorHandler(errorEnum, error)
                            }
                            else
                            {
                                errorHandler(ErrorCode(rawValue: 000)!, error)
                            }
                    }
                }
        }
    }
    
    func cancelRequest()
    {
        if let cancellingReq = request
        {
            cancellingReq.cancel()
        }
    }
}

