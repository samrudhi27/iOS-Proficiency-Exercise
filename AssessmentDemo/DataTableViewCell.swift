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
                // setting image, title and decription to UI elements
                guard let dataItem = datas else {return}
                if let imag = dataItem.imageHref {
                   // let dataUrl = URL(string: imag)!
                  // let dat = NSData(contentsOf: dataUrl as! URL)
                   // profileImageView.image = UIImage(data: dat as! Data)
                    // print(dat)
                    // nameLabel.text = imag
                        // swiftlint:disable force_cast
                        let dataUrl = URL(string: imag)!
                        let dat = NSData(contentsOf: dataUrl )
                    if dat != nil {
                        profileImageView.image = UIImage(data: dat! as Data)
                        // swiftlint:enable force_cast
                    }
                    else {
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
    // setting appearance attributes for ImageView
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
    // setting appearance attributes for titleLabel
    let nameLabel: UILabel = {
        let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    // setting appearance attributes for title
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
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingComponents()
        imageConstraints()
        titleConstraints()
        descriptionConstraints()
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    // adding image, title, description to the content
    func addingComponents() {
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(jobTitleDetailedLabel)
    }
    // applying constraints to image view
    func imageConstraints() {
        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
      profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    // applying constraints to title label
    func titleConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 1).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }
    // applying constraints to description label
    func descriptionConstraints() {
        let marginGuide = contentView.layoutMarginsGuide
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
       jobTitleDetailedLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        jobTitleDetailedLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }

}
