//
//  RegisterView.swift
//  ChatTime
//
//  Created by 贾翕 on 14-9-24.
//  Copyright (c) 2014年 Jesse. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var repassField: UITextField!
    
    @IBOutlet weak var nickNameField: UITextField!
    @IBOutlet weak var telField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        if(checkTel(telField.text)){
            infoLabel.text = "Tel number is invalid"
            return;
        }
        if(passField.text != repassField.text){
            infoLabel.text = "Please repeat password correctly"
            return;
        }
        if(checkNickName(nickNameField.text)){
            infoLabel.text = "Nick name is invalid"
            return;
        }
        
        var us = UserService.getInstance
        var userInfo:Dictionary<String,String> = Dictionary<String,String>()
        userInfo.updateValue(telField.text, forKey: "phoneNum")
        userInfo.updateValue(passField.text, forKey: "password")
        userInfo.updateValue(nickNameField.text, forKey: "nickname")
        
        let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as MainViewController
        self.presentViewController(mainView, animated: true, completion: nil)
    }
    
    func checkTel(tel :String) ->Bool{
        if(tel == ""){
            return false
        }else{
            return true
        }
    }

    func checkNickName(nickName :String) ->Bool{
        if(nickName == ""){
            return false
        }else{
            return true
        }
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
