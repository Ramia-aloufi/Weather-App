//
//  ViewController.swift
//  Weather Application
//
//  Created by R on 17/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var weatherName: UILabel!
    
    @IBOutlet weak var today: UILabel!
    
    @IBOutlet weak var weatherTemp: UILabel!
    
    @IBOutlet weak var weatherMinTemp: UILabel!
    
    @IBOutlet weak var WheatherMaxTemp: UILabel!
    
    @IBOutlet weak var weatherCard: UIView!
    
    @IBOutlet weak var weatherDesription: UILabel!
    
    @IBOutlet weak var transparent2: UIView!
    @IBOutlet weak var transparent: UIView!
    
    @IBOutlet weak var weatherTopCard: UIView!
    var hour = [Current]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        getwheatherData()
         getDate()
        if let flowLayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 100, height: 150)
        }


    }
    

    func getDateFromTimeStamp(timeStamp : Double) -> String {

            let newTime = Date(timeIntervalSince1970: TimeInterval(timeStamp))
            let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "hh:mm a"
            let dateString = dayTimePeriodFormatter.string(from: newTime as Date)
            return dateString
        }
    func getDate() {
                let date = Date()
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        let dateString = df.string(from: date)
        today.text = dateString
    }
    
    func getwheatherData(){
        transparent2.layer.cornerRadius = 45
        transparent.layer.cornerRadius = 45
        weatherCard.layer.cornerRadius = 15
        weatherTopCard.layer.cornerRadius = 15


        getApi().ApiData{ (data) in
            let url = URL(string: "http://openweathermap.org/img/w/\(data.hourly[0].weather[0].icon).png")
            let data1 = try? Data(contentsOf: url!)

                
            DispatchQueue.main.async {
                for i in data.hourly{
                    self.hour.append(i)
                }
                print(self.hour.count)
                self.weatherName.text = data.timezone
                self.weatherTemp.text = "\(Int(data.current.temp))º"
                self.weatherMinTemp.text = "\(Int(data.current.humidity))"
                self.WheatherMaxTemp.text = "\(Int(data.current.pressure))"
                self.weatherDesription.text = "\(data.hourly[0].weather[0].weatherDescription)"
                self.weatherImg.image = UIImage(data: data1!)
                self.collectionview.reloadData()

                }
            }
        }
}
    

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(hour.count)
       return hour.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        let url = URL(string: "http://openweathermap.org/img/w/\(hour[indexPath.item].weather[0].icon).png")
        let data = try? Data(contentsOf: url!)
        
                cell.hour.text = String(getDateFromTimeStamp(timeStamp : Double(hour[indexPath.item].dt)))
                cell.temp.text = String(hour[indexPath.item].temp) + "º"
                cell.cellCared.layer.cornerRadius = 10
                cell.icon.image = UIImage(data: data!)
                cell.cardTransparent.layer.cornerRadius = 50
        
                return cell
    }
    






}

