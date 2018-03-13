//
//  ViewController.swift
//  ScrollviewParallexEffect
//
//  Created by Plutomen on 13/03/18.
//  Copyright © 2018 Plutomen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var listView1: ListViewXIB!
    @IBOutlet weak var listView2: ListViewXIB!
    @IBOutlet weak var listView3: ListViewXIB!
    
    // MARK: - Var
    
    let labelTag = 100
    
    //--------------------------------------------------------------------------------
    
    // MARK: - Memory Managment
    
    //--------------------------------------------------------------------------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //--------------------------------------------------------------------------------
    
    // MARK: - Cusotm Methods
    
    //--------------------------------------------------------------------------------
    
    private func setupView () {
        self.view.layoutIfNeeded()
        
      //  var i = 0
        
        for i in 1000..<1003 {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: self.topView.frame.height))
            
           
            
            label.text = "Section \(i + 1)"
            label.sizeToFit()
            label.tag = i + labelTag
            topView.addSubview(label)
            
            let viewContainer = scrollView.viewWithTag(i) as! ListViewXIB
            
            if i == 1000 {
                label.center.x = viewContainer.center.x
                
            } else {
                label.center.x = viewContainer.center.x - self.scrollView.frame.width / 2
            }
         
        }
        topView.backgroundColor = .gray
        
    }
    
    //--------------------------------------------------------------------------------
    
    // MARK: -  View LifeCycle Methods
    
    //--------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        listView1.tblView.dataSource = self
        listView1.tblView.delegate = self
        listView1.tblView.register(UINib.init(nibName: "TableCel", bundle: nil), forCellReuseIdentifier: "TableCel")
        
        listView2.tblView.dataSource = self
        listView2.tblView.delegate = self
        listView2.tblView.register(UINib.init(nibName: "Cell2", bundle: nil), forCellReuseIdentifier: "Cell2")

        listView3.tblView.dataSource = self
        listView3.tblView.delegate = self
        listView3.tblView.register(UINib.init(nibName: "TableCel", bundle: nil), forCellReuseIdentifier: "TableCel")

    }
    
    //--------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    //--------------------------------------------------------------------------------


}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == scrollView {
            for i in 1000..<1003 {
                
               if  let label = topView.viewWithTag(i + labelTag) as? UILabel,
                 let view = scrollView.viewWithTag(i) as? ListViewXIB {
                
                    let contentOffset = scrollView.contentOffset.x + scrollView.bounds.width
                    let viewOffset =  (view.center.x - scrollView.bounds.width / 4) - contentOffset
                    label.center.x = contentOffset -  ((scrollView.bounds.width / 4 - viewOffset) / 2)
                }
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == listView1.tblView {
            return  10

        } else  if tableView == listView2.tblView  {
             return  50
        } else if  tableView == listView3.tblView {
            return 15
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == listView1.tblView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCel", for: indexPath) as! TableCel
            
            
            return cell
        } else  if tableView == listView2.tblView  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! Cell2
            
            cell.imgView?.image = #imageLiteral(resourceName: "icon1")
            
            return cell
            
        } else if  tableView == listView3.tblView {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! Cell2
//            cell.imageView?.image = #imageLiteral(resourceName: "icon2")
//
//            return cell

            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCel", for: indexPath) as! TableCel
            
            
            return cell

        }
        return  UITableViewCell()
        

    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

