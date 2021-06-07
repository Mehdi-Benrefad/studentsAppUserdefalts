//
//  customCellTableViewCell.swift
//  tableViewUserDefaults
//
//  Created by Mehdi Benrefad on 07/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class customCellTableViewCell: UITableViewCell {
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var classe: UILabel!
    @IBOutlet weak var mark: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func initialise(fn:String,ln:String,cl:String,ma:Float,image:UIImage){
        
        fname.text = fn
        lname.text = ln
        classe.text = cl
        mark.text = String(format: "%.2f", ma)
        img.image = image
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
