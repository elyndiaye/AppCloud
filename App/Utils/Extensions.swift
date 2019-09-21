//
//  Extensions.swift
//  App
//
//  Created by ely.assumpcao.ndiaye on 20/09/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Kingfisher

var cache = [String: UIImage]()

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: ImageResource(downloadURL: imageURL))
    }
}

extension UIViewController {
func EmptyTextField(text: String, message: String?) {
    let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    self.present(alert, animated: true) }
}


extension UIImage{
    /** Cria uma imagem flat num tamanho específico.*/
    static func createFlatImage(size:CGSize, corners:UIRectCorner, cornerRadius:CGSize, color:UIColor) -> UIImage{
        
        let rect:CGRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        let path:UIBezierPath = UIBezierPath.init(roundedRect: rect , byRoundingCorners: corners, cornerRadii: cornerRadius)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        path.fill()
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        //
        return image
    }
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    //#F7CE5B - Yellow
    static func mainColor() -> UIColor {
        return UIColor.rgb(red: 247, green: 206, blue: 91)
    }
    //#2D3047 - DarkBlue
    static func mainDarkBlue() -> UIColor {
        return UIColor.rgb(red: 45, green: 48, blue: 71)
    }
    //#D9971E - Orange
    static func mainOrange() -> UIColor {
        return UIColor.rgb(red: 217, green: 151, blue: 30)
    }
    //#FFFFFF - White
    static func mainWhite() -> UIColor {
        return UIColor.rgb(red: 1.0, green: 1.0, blue: 1.0)
    }
}

