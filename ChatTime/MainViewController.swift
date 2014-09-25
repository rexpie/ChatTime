//
//  MainViewController.swift
//  ChatTime
//
//  Created by 贾翕 on 14-9-24.
//  Copyright (c) 2014年 Jesse. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myInfoButton: UIButton!
    
  
    @IBOutlet weak var tokenLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var token = defaults.valueForKey("token") as NSString
        if(token == ""){
            tokenLabel.text = "You are invalid"
        }else{
            tokenLabel.text =   "Token is: " + token as String
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testGet(sender: AnyObject) {
        var httpClient = ChatHttpClient.getInstance
        print(httpClient.get("www.baidu.com"))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
