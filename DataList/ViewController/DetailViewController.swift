//
//  DetailViewController.swift
//  DataList
//
//  Created by Rishil Patel on 12/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var dictDetails : [String:[String]]!
    var strImgUrls : String = ""
    var arrData : [String] = []
    @IBOutlet var imgView : UIImageView!
    @IBOutlet var tblData : UITableView!
    @IBOutlet var lblTitle : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.loadImage()
        // Do any additional setup after loading the view.
    }
    // MARK: - Load Function with UI Changes
    private func setUI(){
        self.view.backgroundColor = Constant.AppColor.colorTableBackG
        lblTitle.text = Constant.TitleStings.titleSubBreed
        lblTitle.font = Constant.FontNames.TitleFont
        self.title = Array(dictDetails.keys)[0]
        arrData = dictDetails[Array(dictDetails.keys)[0]]!
        self.setDelegate_DataSource()
    }
    // MARK: - Load Image from API
    private func loadImage(){
        APIClass.apiClass.callData(requestTag: RequestTags.ListImages(strBreed: Array(dictDetails.keys)[0]), withCompletionHandler: { (result:DogBreedImages) in
            if let strUrls = (result.message?[0]){
                self.strImgUrls = strUrls
                self.imgView.dowloadFromServer(link: self.strImgUrls, contentMode: UIView.ContentMode.scaleAspectFit)
            }
        })
    }
    // MARK: - confirm tableview delegate and datasource
    private func setDelegate_DataSource(){
        self.tblData.delegate = self
        self.tblData.dataSource = self
        self.tblData.reloadData()
        self.setAnimation()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubBreedTableViewCell", for: indexPath) as! SubBreedTableViewCell
        cell.setDetails(strName: arrData[indexPath.row])
        return cell
        
    }
    
    
}
// MARK: - Extendsion of Animation while loading time
extension DetailViewController{
    func setAnimation(){
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.imgView.alpha = 0.0
            self.tblData.alpha = 0.0
            self.lblTitle.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.imgView.alpha = 1.0
                self.tblData.alpha = 1.0
                self.lblTitle.alpha = 1.0
            }, completion: nil)
        })
        
    }
}
