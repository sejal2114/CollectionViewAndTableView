//
//  ListViewController.swift
//  DestekTask
//
//  Created by Sejal on 12/04/23.
//

import UIKit
class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    
    private let data = ["Apps","Bell","Chat","Home","Instagram","Pin","Setting","User"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "List Of Titles"
        setdelegates()
        registerXib()
    }
    
    func setdelegates(){
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    func registerXib() {
        let nib = UINib(nibName: "TitleTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: "TitleTableViewCell")
    }
}
extension ListViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = listTableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for:indexPath) as! TitleTableViewCell
         cell.titleLabel.text = data[indexPath.row]
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = data[indexPath.row]
        let alert = UIAlertController(title: title, message: "You tapped on \(title)" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
