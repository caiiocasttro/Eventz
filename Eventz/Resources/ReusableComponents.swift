//
//  ReusableComponents.swift
//  Eventz
//
//  Created by Caio Chaves on 16.06.23.
//

import UIKit


//MARK: Shared Instance
class SharedInstance {
    var buttonSelected: Bool = false
}

//MARK: Reusable functions
public class ReusableFunctions {
    
    public func settingShadow(object: AnyObject) {
        
        object.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        object.layer.shadowRadius = 4
        object.layer.shadowOpacity = 0.5
        object.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}

//MARK: Custom view rounded corner
class CustomView: UIView {
    
    override func layoutSubviews() {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: .init(width: 15, height: 15))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class CustomImage: UIImageView {
    
    override func layoutSubviews() {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: .init(width: 15, height: 15))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class CustomNavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize :CGSize = CGSize(width: self.frame.size.width,height: 54)
        return newSize
    }
}
