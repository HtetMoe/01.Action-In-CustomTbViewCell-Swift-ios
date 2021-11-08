//
//  ViewController.swift
//  ActionInTableViewCell
//  Link >> https://www.youtube.com/watch?v=ChjXkkqog5k
//  Created by Htet Moe Phyu on 08/11/2021.


import UIKit

class ViewController: UIViewController {

    //data
    let data = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    //outlets
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register cell
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }

    
}

extension ViewController :UITableViewDataSource, MyTableViewCellDeligate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: data[indexPath.row])
        
        cell.deligate = self
        
        return cell
    }
    
    //MyTableViewCell Deligate

    func didTapButton(with title: String) {
        print("You presssed \(title) button!")
    }
}

