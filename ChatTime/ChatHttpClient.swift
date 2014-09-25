//
//  ChatHttpClient.swift
//  ChatTime
//
//  Created by 贾翕 on 14-9-25.
//  Copyright (c) 2014年 Jesse. All rights reserved.
//

import UIKit

class ChatHttpClient: NSObject {
    class var getInstance :ChatHttpClient{
        struct Static {
            static var token: dispatch_once_t = 0
            static var instance : ChatHttpClient?
            }
            
            dispatch_once(&Static.token){
                Static.instance = ChatHttpClient()
            }
        return Static.instance!
    }
    
    func get(urlPath:String) ->(Int,NSError?,NSData?){
        let url:NSURL = NSURL(string: urlPath)
        let request = NSURLRequest(URL: url)
        var response: NSURLResponse?
        var error: NSError?
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        var httpResponse = response as NSHTTPURLResponse
        return (httpResponse.statusCode,error,data)
    }
    
    func post(urlPath:String, params:Dictionary<String,NSObject> ) ->(Int,NSError?,NSData?){
        var request = NSMutableURLRequest(URL: NSURL(string: urlPath));
        request.HTTPMethod = "POST"
        
        var paramError:NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &paramError)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var response: NSURLResponse?
        var error: NSError?
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        var httpResponse = response as NSHTTPURLResponse
        return (httpResponse.statusCode,error,data)
    }
}
