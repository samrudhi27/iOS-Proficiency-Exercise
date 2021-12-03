//
//  DataTableViewCell.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import SnapKit

class DataTableViewCell: UITableViewCell {
    var datas: DataFile? {
        didSet {
            guard let dataItem = datas else {return}
            // getting the image from url and displaying in imageview
            if let imag = dataItem.imageHref {
                let imageHrefUrl = URL(string: imag)!
                dataImageView.loadImage(fromURL: imageHrefUrl, placeHolderImage: "af")
            }
            // setting the description label
            if let descriptionData = dataItem.description {
                descriptionLabel.text = "\(descriptionData)"
            }
            // setting the title label
            if let titleData = dataItem.title {
                dataTitle.text = "\(titleData)"
            }
        }
    }
    // description label with style attributes
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = NSTextAlignment.center
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .vertical)
    return label
    }()
    // Image View with style attributes
    var dataImageView: LazyImageView = {
        let img = LazyImageView()
        // image will never be strecthed vertially or horizontally
        img.contentMode = .scaleAspectFit
        return img
    }()
    // title label with style attributes
         var dataTitle: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.textAlignment = NSTextAlignment.center
        return label
        }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // function to add components and setup constraints
    func setUpConstraints() {
        addingComponents()
        imageConstraints()
        titleConstraints()
        descriptionConstraints()
    }
    // MARK: - Adding Components
    func addingComponents() {
        self.contentView.addSubview(dataImageView)
        self.contentView.addSubview(dataTitle)
        self.contentView.addSubview(descriptionLabel)
    }
    // MARK: - ImageView Constraints
    // applying constraints to image view
    func imageConstraints() {
        dataImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.height.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
       }
    }
    // MARK: - Title Label Constraints
    // applying constraints to title label
    func titleConstraints() {
            dataTitle.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.equalTo(dataImageView.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
            }
        }
    // MARK: - Description Label Constraints
    // applying constraints to description label
        func descriptionConstraints() {
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(dataTitle.snp.bottom)
                make.leading.equalTo(dataImageView.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.bottom.equalToSuperview().offset(-10)
            }
        }
}
