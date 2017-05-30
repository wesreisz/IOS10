
//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Wesley Reisz on 5/30/17.
//  Copyright © 2017 Wesley Reisz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //{city} is a placeholder
    private let baseURL:String = "http://www.weather-forecast.com/locations/{city}/forecasts/latest"
    
    @IBOutlet weak var txtMessageDisplay: UILabel!
    @IBOutlet weak var txtCityInput: UITextField!

    @IBAction func buttonClicked(_ sender: Any) {
        guard let city = txtCityInput.text else{
            txtMessageDisplay.text = "Please Enter a City"
            return
        }
        
        loadSite(forCity: city)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func loadSite(forCity:String){
        
        if forCity==""{
            txtMessageDisplay.text = "Please enter a city"
            return
        }
        
        if let url = URL(string: baseURL.replacingOccurrences(of: "{city}", with: forCity.replacingOccurrences(of: " ", with: "-"))){
            print(url.absoluteString)
            let request = NSMutableURLRequest(url: url)
            var message:String = ""
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if error != nil {
                    print(error!)
                }else{
                    if let unwrappedData = data{
                        let dataString = NSString(data:unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        //print(dataString!)
                        
                        //update ui
                        var seperator:String = "<span class=\"phrase\">"
                        var arr = dataString?.components(separatedBy: seperator)
                        if (arr?.count)!>=2{
                            if let content:String = (arr?[1])!{
                                seperator = "</span>"
                                arr = content.components(separatedBy: seperator)
                                message = (arr?[0])!.replacingOccurrences(of: "&deg;", with: "°")
                            }else{
                                message = "The Weather there couldn't be found. Please try again."
                            }
                            
                        }
                        
                    }
                }
                
                if message==""{
                    message = "The Weather there couldn't be found. Please try again."
                }
                
                DispatchQueue.main.sync {
                    self.txtMessageDisplay.text = message
                }
            
            }
            
            task.resume()
        }
   }
}




