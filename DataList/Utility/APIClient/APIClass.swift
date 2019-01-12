//
//  APIClass.swift
//  DataList
//
//  Created by Rishil Patel on 10/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit
import Alamofire

import SystemConfiguration

// Api request tag append with baseURL
enum RequestTags {
    case ListTag
    case ListImages(strBreed:String)
}

class APIClass: NSObject {
    static let apiClass = APIClass()
    override init(){
    }
    // Generic api function 
    func callData<T:Codable>(requestTag : RequestTags, withCompletionHandler:@escaping (_ result: T) -> Void) {
        let isONN : Bool = self.isConnectedToNetwork()
        var strReqtag : String = ""
        if(isONN == true){
            switch requestTag{
            case.ListTag:
                strReqtag = "breeds/list/all"
            case.ListImages(let strImgRequestTag):
                strReqtag = "breed/\(strImgRequestTag)/images"
            }
            
            
            Alamofire.request("\(Constant.APIConstant.baseURL)\(strReqtag)", method: .post,encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"]).responseJSON {
                response in
                switch response.result {
                case .success:
                    
                    
                    
                    let decoder = JSONDecoder()
                    do{
                        let dogData = try decoder.decode(T.self, from: response.data!)
                        withCompletionHandler(dogData)
                    }catch(let error){
                        print(error.localizedDescription)
                    }
                    
                    
                    break
                case .failure(let error):
                    
                    print(error)
                    UIApplication.shared.gettopMostViewController()?.presentAlerterror(title: "Erorr", message: error.localizedDescription, okclick: nil)
                }
                
                
            }
        }else{
            
        }
    }
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
        
    }
}
