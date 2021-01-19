//
//  GameHistoryVC.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit
import CoreData

class GameHistoryVC: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableViewData: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    
    //MARK:- Other Variables
    var historyData = [NSManagedObject]()
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    //MARK:- Other Helper Methods
    func configureTableView(){
        tableViewData.register(UINib.init(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCell")
        tableViewData.dataSource = self
        tableViewData.delegate = self
    }
    
    func fetchData(){
        fetchGameData { (result) in
            switch result {
            case .success(let managedObjects):
                self.historyData = managedObjects
                DispatchQueue.main.async {
                    self.tableViewData.reloadData()
                }
            case .failure(let err):
                self.showOkAlertWithHandler(err.localizedDescription) {
                }
            }
        }
    }
    
    //MARK:- UIButton Tap Action
    @IBAction func tapBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- Extension UITableViewDataSource , UITableViewDelegate
extension GameHistoryVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lblNoData.isHidden = self.historyData.count == 0 ? false : true
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameHistoryCell", for: indexPath) as! GameHistoryCell
        cell.putDataIntoCell(data: historyData[indexPath.row], index: indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK:- Extension Fetching Data
extension GameHistoryVC {
    func fetchGameData(completion: @escaping (Result<[NSManagedObject], Error>) -> ()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(.failure(failedToSaveData))
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Game")
        
        do {
           let fetchResult = try managedContext.fetch(fetchRequest)
            completion(.success(fetchResult))
        } catch {
            completion(.failure(error))
        }
    }
}
