//
//  ViewController.swift
//  Weather_HaNoi
//
//  Created by Nguyễn Đình Thành Long on 11/25/19.
//  Copyright © 2019 Nguyễn Đình Thành Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var tfCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "theme2")!)
    }

    @IBAction func btnSearch(_ sender: Any) {
        var city : String?
        city = self.tfCity.text
        var code : String?
        code = self.tfCode.text
        self.lblCity.text = city
        
        getWeather(city: city, countryCode: code)
    }
    
    
    @IBAction func btnSearchWeek(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "SearchAllTableViewController") as? SearchAllTableViewController {
            vc.countryCode = self.tfCode.text
            vc.city  = self.tfCity.text
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController {
    func getWeather(city: String?, countryCode: String?){
        guard let city  = city, let countryCode = countryCode else {
            return
        }
        let session = URLSession.shared
        guard let WeatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city),\(countryCode)?&units=metric&APPID=4854f13081691796862e9455fb7d3de0") else {
            //http://api.openweathermap.org/data/2.5/forecast?q=\(city),(countryCode)&units=metric&mode=json&appid=4854f13081691796862e9455fb7d3de0
            
            return
        }
        
        let dataTask = session.dataTask(with: WeatherUrl) { (data : Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error : \(error)")
            }
            else{
                if let data = data {
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    let model = try? JSONDecoder().decode(Weather.self, from: data)
                    //print(model?.weather.description)
                    print("All data is \(dataString)")
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary{
                        if let mainDictionary = jsonObj.value(forKey: "main") as? NSDictionary{
                            if let temperature = mainDictionary.value(forKey: "temp") as? Double{
                                DispatchQueue.main.async {
                                    self.lblWeather.text = "\(temperature)"
                                }
                            }
                                
                            else{
                                print("Error: unable to find temperature in dictionary")
                            }
                            
                        }
                        else{
                            print("Error: unable to convert json data")
                        }
                        if let descriptions = jsonObj.value(forKey: "weather") as? Array<Dictionary<String, Any>> {
                            if let description = descriptions[0]["description"] as? String {
                                DispatchQueue.main.async {
                                    if let desc = Description(rawValue: description)?.image{
                                        self.imgWeather.image = desc
                                        
                                    }else{
                                        print("Don't understand description")
                                    }
                                    
                                }
                            }
                        }
                    }
                    else{
                        print("Error : Not data")
                    }
                }
            }
        }
        dataTask.resume()
    }
}

