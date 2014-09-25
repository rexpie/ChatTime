//
//  ViewController.swift
//  ChatTime
//
//  Created by 贾翕 on 14-9-23.
//  Copyright (c) 2014年 Jesse. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Register(sender: AnyObject) {
        let regView  = self.storyboard?.instantiateViewControllerWithIdentifier("regView") as RegisterViewController
        self.presentViewController(regView, animated: true, completion: nil)
    }

    @IBAction func changePassword(sender: AnyObject) {
        errorLabel.hidden = true
    }
    
    @IBAction func changeUsername(sender: AnyObject) {
        errorLabel.hidden = true
    }
    
    
    @IBAction func login(sender: AnyObject) {
        
        var us:UserService = UserService.getInstance;
        let verified:Bool = us.login(userNameField.text, password: passwordField.text)
        //let verified:Bool = !false
        if(verified){
            let mainView = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as MainViewController
            self.presentViewController(mainView, animated: true, completion: nil)
        }else{
            //do sth
            errorLabel.hidden = false;
        }
    }
}

