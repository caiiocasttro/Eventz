//
//  NotificationCell.swift
//  Eventz
//
//  Created by Caio Chaves on 05.07.23.
//

import UIKit

//MARK: Initializer

//MARK: Proprieties
private var shadow: UIView = {
    let shadow = UIView()
    shadow.backgroundColor = UIColor(named: "")
    shadow.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
    shadow.layer.shadowRadius = 4
    shadow.layer.shadowOpacity = 0.5
    shadow.layer.shadowOffset = CGSize(width: 0, height: 0)
    shadow.layer.cornerRadius = 15
    return shadow
}()

private var eventName: UILabel = {
    let label = UILabel()
    label.text = "Paléo Festival"
    label.font = .systemFont(ofSize: 16, weight: .heavy)
    label.textColor = UIColor(named: "Aux9")
    return label
}()

private var dateLabel: UILabel = {
    let label = UILabel()
    label.text = "1 day ago"
    label.font = .systemFont(ofSize: 10, weight: .bold)
    label.textColor = UIColor(named: "Aux5")
    return label
}()

private var notificationBody: UILabel = {
    let label = UILabel()
    label.text = "Lorem ipsum dolor sit amet consectetur. Sollicitudin scelerisque risus augue sollicitudin eget faucibus odio sit egestas. Turpis ornare sit euismod tempus faucibus sodales. "
    label.font = .systemFont(ofSize: 12, weight: .regular)
    label.textColor = UIColor(named: "Aux7")
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
}()

private var eventImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "concert")
    image.frame = CGRect(x: 0, y: 0, width: 50, height: 70)
    image.layer.cornerRadius = 15
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
}()

class NotificationCell: UICollectionViewCell {
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        
        // Adding subview
        addSubview(shadow)
    }
}
