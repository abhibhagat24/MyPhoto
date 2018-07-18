//
//  ViewController.swift
//  MyPhoto
//
//  Created by Abhishek on 11/07/18.
//  Copyright © 2018 Abhishek Bhagat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblViewObj: UITableView!
    
    let URL_GetData = "https://simplifiedcoding.net/demos/marvel/"
    
    var heroes = [Hero]()
    
    @IBOutlet weak var tableViewHeroes: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let hero: Hero
        hero = heroes[indexPath.row]
        
        cell.labelName.text = hero.name
        cell.labelTeam.text = hero.team
        
        //displaying image
        Alamofire.request(hero.imageurl!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.heroImage.image = image
            }
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewHeroes.dataSource = self
        
        Alamofire.request(URL_GetData).responseJSON { response in
            
        
            if let json = response.result.value{
                
                let heroesArray :NSArray = json as! NSArray
                
                for i in 0..<heroesArray.count{
                    
                    self.heroes.append(Hero(
                        name : (heroesArray[i] as! AnyObject).value(forKey: "name")as! String,
                        team : (heroesArray[i] as! AnyObject).value(forKey: "team")as! String,
                        imageurl : (heroesArray[i] as! AnyObject).value(forKey: "imageurl")as! String
                    ))
                }
                self.tableViewHeroes.reloadData()
            }
            
        }
        self.tableViewHeroes.reloadData()
    }



}
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 1
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 105
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3//arrNames.count
//        
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell  = tblViewObj.dequeueReusableCell(withIdentifier: "cell")! as! MyTableViewCell
//        
//                cell.lblName.text = "Name: Abhishek Bhagat"//arrNames[indexPath.row]
//        // cell.lblEmail.text = "shweta.jalagi@ecbuzz.com"
//        
//        self.tblViewObj.separatorStyle = UITableViewCellSeparatorStyle.none
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        
//        
//    }


