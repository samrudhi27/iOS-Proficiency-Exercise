
import UIKit

class DataTableViewCell: UITableViewCell {
    var datas: DataFile? {
        didSet {
                // setting image, title and decription to UI elements
                guard let dataItem = datas else {return}
                if let imag = dataItem.imageHref {
                    let imgURl = URL(string: imag)!
                    profileImageView.loadImage(fromURL: imgURl, placeHolderImage: "ar")
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
        img.contentMode = .center
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
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = NSTextAlignment.center
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
    // adding image, title, description to the content
    func addingComponents() {
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(jobTitleDetailedLabel)
    }
    // applying constraints to image view
    func imageConstraints() {
            let marginGuide = contentView.layoutMarginsGuide
            profileImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
          profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10).isActive = true
           profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            profileImageView.heightAnchor.constraint(lessThanOrEqualTo:  contentView.heightAnchor).isActive = true
           profileImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        }
        // applying constraints to title label
        func titleConstraints() {
            let marginGuide = contentView.layoutMarginsGuide
            nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
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
