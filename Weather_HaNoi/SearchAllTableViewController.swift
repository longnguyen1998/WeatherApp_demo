//
//  SearchAll.swift
//  Weather_HaNoi
//
//  Created by Nguyễn Đình Thành Long on 11/26/19.
//  Copyright © 2019 Nguyễn Đình Thành Long. All rights reserved.
//

import UIKit
import SwiftyJSON




class SearchAllTableViewController: UITableViewController {
    
    var list  = [List]()

    var city : String?
    var countryCode : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "theme3")!)
        getWeather(city: city, countryCode: countryCode)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoWeather", for: indexPath) as! WeatherCellTableViewCell
        
        let aList = list[indexPath.section]
        let weather = aList.weather[indexPath.row]
        cell.imgWeather.image = weather.weatherDescription.image
        cell.lbTemp.text = aList.main.temp.roundTo(number: 2).asString
        cell.lblDay.text = aList.main.humidity.IntasString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].dtTxt
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].weather.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension SearchAllTableViewController{
    func getWeather(city: String?, countryCode: String?){
        guard let city  = city, let countryCode = countryCode else {
            return
        }
        let session = URLSession.shared
        guard let WeatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=\(city),\(countryCode)&units=metric&mode=json&appid=4854f13081691796862e9455fb7d3de0") else {
            //http://api.openweathermap.org/data/2.5/forecast?q=\(city),(countryCode)&units=metric&mode=json&appid=4854f13081691796862e9455fb7d3de0
            
            return
        }
        
        let dataTask = session.dataTask(with: WeatherUrl) { (data : Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error : \(error)")
            }
            else{
                if let data = data {
                    print(JSON(data))
                    if let modeWeather = try? JSONDecoder().decode(ModeWeather.self, from: data) {
                        self.list = modeWeather.list
                        DispatchQueue.main.async {
                            self.title = modeWeather.city.name
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                }
            }
        }
        dataTask.resume()
    }
}

extension Double{
    var asString : String {
        return String(self)
    }
}
extension Int{
    var IntasString : String{
        return String(self)
    }
}
extension Double{
    func roundTo(number : Int) -> Double{
        let divisor = pow(10 , Double(number))
        return (self * divisor).rounded() / divisor
    }
}
