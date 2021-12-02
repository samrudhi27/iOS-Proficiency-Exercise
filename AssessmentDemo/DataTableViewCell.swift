//
//  DataTableViewCell.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
import SnapKit

class DataTableViewCell: UITableViewCell {
    var sam = "Samrudhi"
    var datas: DataFile? {
        didSet{
            guard let dataItem = datas else {return}
            if let imag = dataItem.imageHref{
                //print(imag)
               // print(sam)
                /* do{  artistImgView.image = try UIImage(data: Data(contentsOf: URL(string: imag)!))
                }
                catch{
                    
                }*/
               
                    let urll = URL(string: imag)
                    if let data = try? Data(contentsOf: urll!){
                       //print(data)
                        dataImgView.image = UIImage(data: data)
                    }
            }
            if let track = dataItem.description{
             //   print("track \(track)")
                descriptionLabel.text = "\(track)"
            }
            if let artis = dataItem.title{
                dataTitle.text = "\(artis)"
            }
        }
    }
    

    var descriptionLabel: UILabel = {
        let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = NSTextAlignment.center
    return label
    }()
    var dataImgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .center
        // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false
        // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
          
         var dataTitle: UILabel = {
            let label = UILabel()
                label.font = UIFont.boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.textAlignment = NSTextAlignment.center
        return label
        }()
    
        var artistCountry: UILabel = {
            let label = UILabel()
                label.font = UIFont.boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.textAlignment = NSTextAlignment.center
        return label
        }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingComponents()
        imageConstraints()
        titleConstraints()
        descriptionConstraints()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addingComponents(){
        self.contentView.addSubview(dataImgView)
        self.contentView.addSubview(dataTitle)
       // self.contentView.addSubview(artistCountry)
        self.contentView.addSubview(descriptionLabel)
    }
    func imageConstraints() {
        dataImgView.snp.makeConstraints{
            make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            //make.height.equalTo(100)
            make.height.lessThanOrEqualToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }
        // applying constraints to title label
        func titleConstraints() {
            dataTitle.snp.makeConstraints{
                make in
                make.top.equalToSuperview().offset(10)
                make.leading.equalTo(dataImgView.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
            }
        }
        // applying constraints to description label
        func descriptionConstraints() {
            descriptionLabel.snp.makeConstraints{
                make in
                make.top.equalTo(dataTitle.snp.bottom)
                make.leading.equalTo(dataImgView.snp.trailing).offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.bottom.equalToSuperview().offset(-10)
            }
        }

}


