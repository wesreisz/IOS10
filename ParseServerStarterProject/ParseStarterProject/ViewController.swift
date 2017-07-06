/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let name = "Wesley Reisz"
        
        //saving object
        /*
        let testObject = PFObject(className: "Users")
        testObject["name"] = name
        testObject.saveInBackground { (success, error) -> Void in
            // added test for success 11th July 2016
            if success {
                print("Object \(name) has been saved.")
            } else {
                if error != nil {
                    print (error)
                } else {
                    print ("Error")
                }
            }
        }
        */
        
        //retrieving object
        let query = PFQuery(className: "Users")
        query.getObjectInBackground(withId: "VxP8nGB7Vs"){
            (object,error) in
            if error != nil{
                print(error)
            }else{
                if let user = object{
                    print(user)
                    print(user["name"])
                    
                    user["name"]="kim"
                    user.saveInBackground(){
                     (success,error) in
                        if success{
                            print("saved")
                        }else{
                            print("error")
                        }}
                    }
                }
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
