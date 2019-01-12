//
//  ViewController.swift
//  DataList
//
//  Created by Rishil Patel on 10/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrData : [String:[String]] = [:]
    @IBOutlet var tblData : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.loadDate()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - Load Function with UI Changes
    private func setUI(){
        self.title = Constant.TitleStings.appTitle
        self.tblData.backgroundColor = Constant.AppColor.colorTableBackG
    }
    // MARK: - Load Breed Data
    private func loadDate(){
        APIClass.apiClass.callData(requestTag : RequestTags.ListTag ,withCompletionHandler: { (result:DogBreed) in
            
            self.arrData = result.message ?? ["Test":["Data"]]
            self.setDelegate_DataSource()
        })
    }
    // MARK: - confirm tableview delegate and datasources
    private func setDelegate_DataSource(){
        self.tblData.delegate = self
        self.tblData.dataSource = self
        self.tblData.reloadData()
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedTableViewCell", for: indexPath) as! BreedTableViewCell
        if let counts = arrData[Array(arrData.keys)[indexPath.row]]?.count{
            cell.setDetails(strName: Array(arrData.keys)[indexPath.row], numbData: counts)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if let counts = arrData[Array(arrData.keys)[indexPath.row]]?.count,counts>0 {
            let dictDetailPush = [Array(arrData.keys)[indexPath.row]:arrData[Array(arrData.keys)[indexPath.row]]]
            detailView.dictDetails = dictDetailPush as? [String : [String]]
            self.navigationController?.pushViewController(detailView, animated: true)
        }
        
    }
}


