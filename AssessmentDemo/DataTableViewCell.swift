//
//  DataTableViewCell.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    var datas: DataFile? {
        didSet {
                guard let dataItem = datas else {return}
                if let imag = dataItem.imageHref {
                    // let dataImageUrl = URL(string: imag)!
                    // var dat = NSData(contentsOf: dataImageUrl)
                   /// let dataUrl = URL(string: imag)!
                    // swiftlint:disable force_cast
                  ///  let dat = NSData(contentsOf: dataUrl as! URL)
                   /// profileImageView.image = UIImage(data: dat as! Data)
                    // swiftlint:enable force_cast
                    ///print(dat)
                    //nameLabel.text = imag
                    
                        // swiftlint:enable force_cast
                        let dataUrl = URL(string: imag)!
                        let dat = NSData(contentsOf: dataUrl )
                    if (dat != nil){
                        profileImageView.image = UIImage(data: dat! as Data)
                        // swiftlint:enable force_cast
                    }
                    
                    else{
                        print("No Image")
                    }
                }
                if let name = dataItem.title {
            
                   nameLabel.text = " \(name) "
                }
            if  let des = dataItem.description {
                jobTitleDetailedLabel.text = " \(des) "
            }
        }
        }
    var profileImageView: LazyImageView = {
                    let img = LazyImageView()
             img.contentMode = .scaleAspectFill
        // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false
        // enable autolayout
             img.layer.cornerRadius = 35
           img.clipsToBounds = true
            return img
     }()
    let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
           // label.textColor =  colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
            return label
    }()
    let jobTitleDetailedLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 10)
        // label.layer.cornerRadius = 5
      // label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier:  reuseIdentifier)
        let marginGuide = contentView.layoutMarginsGuide
       // let marginGuide = containerView.layoutMarginsGuide
        self.contentView.addSubview(profileImageView)
        //containerView.addSubview(nameLabel)
        //containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(jobTitleDetailedLabel)
        //self.contentView.addSubview(containerView)
       // self.contentView.addSubview(countryImageView)
        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
      profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        //containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        //containerView.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant:10).isActive = true
      //containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:-10).isActive = true
        //containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 1).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
       jobTitleDetailedLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        jobTitleDetailedLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
