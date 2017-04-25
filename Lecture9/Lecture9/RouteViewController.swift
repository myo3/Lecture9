//
//  RouteViewController.swift
//  Lecture9
//
//  Created by Monica Ong on 4/24/17.
//  Copyright © 2017 Monica Ong. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var routes: [Route] = []
    var tableView: UITableView!
    let reuseIdentifier: String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Routes"
        tableView = UITableView(frame: view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        
        let route1 = Route(departureTime: "3:45 PM", arrivalTime: "3:52 PM", stops: ["Baker Flagpole", "Commons"], busNums: [90])
        let route2 = Route(departureTime: "12:12 PM", arrivalTime: "12:47 PM", stops: ["Annabel Hall", "Commons"], busNums: [90])
        let route3 = Route(departureTime: "1:12 PM", arrivalTime: "1:38 PM", stops: ["Baker Flagpole", "Schwartz Center"], busNums: [90,32])
        
        routes = [route1, route2, route3]
        
        view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        cell.textLabel?.text = "\(routes[indexPath.row].departureTime) - \(routes[indexPath.row].arrivalTime)"
        cell.textLabel?.sizeToFit()
        cell.detailTextLabel?.text = "Take bus(es): \(routes[indexPath.row].busNums)"
        
        return cell
    }
    
    
    
}
