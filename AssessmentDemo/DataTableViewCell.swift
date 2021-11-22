//
//  DataTableViewCell.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    var datas:Data? {
            didSet {
                guard let dataItem = datas else {return}
                if let name = dataItem.name {
                    profileImageView.image = UIImage(named: name)
                    nameLabel.text = name
                }
                if let jobTitle = dataItem.jobTitle {
                   jobTitleDetailedLabel.text = " \(jobTitle) "
                }
               
                if let country = dataItem.country {
                    countryImageView.image = UIImage(named: country)
                }
            }
        }
    let profileImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 35
             img.clipsToBounds = true
            return img
         }()
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
           // label.textColor =  colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    let jobTitleDetailedLabel:UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      //label.textColor =  colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     // label.backgroundColor =  colorLiteral(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    let countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        
        
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
