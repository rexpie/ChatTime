//
//  UserService.swift
//  ChatTime
//
//  Created by 贾翕 on 14-9-25.
//  Copyright (c) 2014年 Jesse. All rights reserved.
//

import UIKit

class UserService: NSObject {
    class var getInstance:UserService{
        struct Static{
            static var token:dispatch_once_t = 0
            static var instance:UserService?
            }
            dispatch_once(&Static.token){
                Static.instance = UserService()
            }
            return Static.instance!
    }
    func login(username:String, password:String) ->Bool{
        var httpClient = ChatHttpClient.getInstance;
        var url:String = ChatTimeConstants.pathHead + ChatTimeConstants.userLoginPath
        
        var userInput:Dictionary<String,String>=Dictionary<String,String>();
        userInput.updateValue(username, forKey: "username")
        userInput.updateValue(password, forKey: "password")
        var(num,error,result) = httpClient.post(url, params: userInput);
        if(error != nil){
            println(error)
        }
        
        if(num != 0){
            return false
        }else{
            //Todo parse token
            var token:String = ""
            var defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            return true
        }
    }
    
    func register(userInfo: Dictionary<String,String>) ->Bool{
        var httpClient = ChatHttpClient.getInstance;
        var url:String = ChatTimeConstants.pathHead + ChatTimeConstants.userRegisterPath
        
        var(num,error,result) = httpClient.post(url, params: userInfo);
        if(error != nil){
            println(error)
        }
        
        if(num != 0){
            return false
        }else{
            //Todo parse token
            var token:String = ""
            var defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            
            //Todo sth else
            return true
        }
    }
}
