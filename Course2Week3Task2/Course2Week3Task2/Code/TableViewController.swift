//
//  TableViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        photos = PhotoProvider().photos()
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") else {
            return UITableViewCell()
        }
        cell.imageView?.image = photos[indexPath.row].image
        cell.textLabel?.text = photos[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory selected")
    }
}
