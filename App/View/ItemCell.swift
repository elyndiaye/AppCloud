//
//  ItemCell.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class ItemCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Init
    func configureCell(item: Item){
        self.titleLbl.text = item.title
        self.descriptionLbl.text = item.itemDescription
        
        guard let pathImage = (item.imageURL) else {return}
        let Image = pathImage
        imageItem.download(image: Image)
       
    }
    
}
