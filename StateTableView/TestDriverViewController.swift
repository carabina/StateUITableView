//
//  TestDriverViewController.swift
//  StateTableView
//
//  Created by Kevin Yu on 10/22/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

class TestDriverViewController: UIViewController, StateTableViewProtocol {

    @IBOutlet weak var stateTableView: StateTableView!
    
    var separatorStyle: UITableViewCell.SeparatorStyle = .singleLine
    
    let CELL_IDENTIFIER = "cell"
    
    let datums = ["duck", "dog", "goose"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.stateTableView.stateDelegate = self
        self.stateTableView.currentState = .empty
        
        self.stateTableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
    }

    
    // MARK: Test Driver Buttons
    // any webservices or long-running tasks should just change the stateTableView's currentState
    // at each important interval
    
    @IBAction func loadButtonAction(_ sender: Any) {
        self.stateTableView.currentState = .loading
    }
    @IBAction func errorButtonAction(_ sender: Any) {
        self.stateTableView.currentState = .error
    }
    @IBAction func emptyButtonAction(_ sender: Any) {
        self.stateTableView.currentState = .empty
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        self.stateTableView.currentState = .loaded
    }
    
}

extension TestDriverViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = datums[indexPath.row]
        return cell
    }
    
}