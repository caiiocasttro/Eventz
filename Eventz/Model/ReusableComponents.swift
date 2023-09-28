//
//  ReusableComponents.swift
//  Eventz
//
//  Created by Caio Chaves on 16.06.23.
//

import UIKit

//MARK: Reusable functions
public class ReusableFunctions {
    
    public func settingBakcground(image: String, view: UIView) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: image)
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    public func settingShadow(object: AnyObject) {
        
        object.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        object.layer.shadowRadius = 4
        object.layer.shadowOpacity = 0.5
        object.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}

//MARK: Generic custom button class
class customGenericButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        layer.cornerRadius = 25
        clipsToBounds = false
        layer.masksToBounds = false

    }
}

// isSecurityText button
class securityTextFieldButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
        frame = CGRect(x: 0, y: 0, width: 24, height: 24)
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
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: .init(width: 30, height: 30))
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
