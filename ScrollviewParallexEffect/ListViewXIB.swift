//
//  ListViewXIB.swift
//  ScrollviewParallexEffect
//
//  Created by Plutomen on 13/03/18.
//  Copyright © 2018 Plutomen. All rights reserved.
//

import UIKit

@IBDesignable class ListViewXIB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var contenetView : UIView?
    @IBInspectable var nibName:String?
    @IBOutlet weak var tblView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        self.tblView.tableFooterView = UIView()
       // self.contentMode = .scaleAspectFit
       // self.contenetView?.contentMode = .scaleAspectFit
        
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupXIB()
        contenetView?.prepareForInterfaceBuilder()
    }
    
    //--------------------------------------------------------------------------------

    func setupXIB () {
        guard let nibView = loadXIB() else {return }
        nibView.bounds = bounds
        nibView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        addSubview(nibView)
        self.layoutIfNeeded()
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        nibView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nibView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        contenetView = nibView
        
        
        
    }
    
    //--------------------------------------------------------------------------------

    func loadXIB () -> UIView? {
        guard let nibName = nibName else { return nil}
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
    
}
