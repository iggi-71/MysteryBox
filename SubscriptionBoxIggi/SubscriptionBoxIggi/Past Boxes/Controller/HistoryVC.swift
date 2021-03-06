//
//  HistoryVC.swift
//  SubscriptionBoxIggi
//
//  Created by apple on 2/28/21.
//

import UIKit

class HistoryVC: UIViewController {
    
    var arrayBoxes: [Box]! = []
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.register(BoxCell.self, forCellReuseIdentifier: "BoxCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "white")
        self.title = "History"
        createData()
        setTable()
    }
    
    func setTable(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func createData(){
        let item = BoxItem(name: "Treat", categories: [.food], description: "Dry treats for training", isFavorite: false)
        let item2 = BoxItem(name: "Ball", categories: [.toys], description: "Ball to play fetch", isFavorite: false)
        let item3 = BoxItem(name: "Kibble", categories: [.food], description: "Chicken and pea", isFavorite: false)
        let item4 = BoxItem(name: "Leash", categories: [.accessories], description: "Training leash", isFavorite: false)
        
        for _ in 0...5{
            let box = Box(date: Date(), items: [item, item2, item3, item4], imageStr: "shippingbox")
            arrayBoxes.append(box)
        }
    }
    
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBoxes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath) as! BoxCell
        let box = arrayBoxes[indexPath.row]
        cell.dateLabel.text = box.dateString
        cell.boxImage.image = UIImage(systemName: box.imageStr)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let boxDetail = BoxDetail()
        boxDetail.box = arrayBoxes[indexPath.row]
        self.navigationController?.pushViewController(boxDetail, animated: true)
    }
}
