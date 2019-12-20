//
//  UIView.swift
//  Story
//
//  Created by Apps on 05/08/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit
@IBDesignable class GradientView: UIView {
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
extension UIView {
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowColor:UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    
    func round() {
        layoutIfNeeded()
        clipsToBounds = true
        layer.cornerRadius = bounds.width/2
    }
}

extension UIView{
    func image(iv:UIImageView,cache:NSCache<NSString,UIImage>?,urlString:String?,placeHolder:UIImage){
        iv.image = placeHolder
        DispatchQueue.global(qos: .userInteractive).async {
            
            guard let urlString = urlString else{
                self.setImage(iv:iv,image: placeHolder)
                return
            }
            
            if let img = cache?.object(forKey: NSString(string:urlString)) {
                self.setImage(iv:iv,image: img)
                return
            }
            
            guard let url = URL.init(string:  urlString) else{
                self.setImage(iv:iv,image: placeHolder)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                self.setImage(iv:iv,image: placeHolder)
                return
            }
            
            guard let image = UIImage(data: data) else{
                self.setImage(iv:iv,image: placeHolder)
                return
            }
            cache?.setObject(image, forKey: NSString(string: urlString))
            self.setImage(iv:iv,image: image)
        }
    }
    
    func setImage(iv:UIImageView,data:Data?,placeholder:UIImage?){
        guard let data = data else {
            setImage(iv: iv, image: placeholder)
            return
        }
        let image = UIImage(data: data)
        iv.image = image
    }
    
    
    func setImage(iv:UIImageView,image:UIImage?) {
        DispatchQueue.main.async {
            iv.image = image
        }
    }
    
}


    

