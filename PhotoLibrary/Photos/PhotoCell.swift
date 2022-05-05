//
//  PhotoCell.swift
//  PhotoLibrary
//
//  Created by Leha on 05.05.2022.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {

    static let reuseId = "PhotoCell"

    private let checkmark: UIImageView = {
        let image = UIImage(systemName: "checkmark.circle")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()

    var unsplashPhoto: UnsplashPhoto? {
        didSet {
            let photoUrl = unsplashPhoto?.urls["regular"]
            guard
                let imageUrl = photoUrl,
                let url = URL(string: imageUrl)
            else { return }
            photoImageView.sd_setImage(with: url)
        }
    }

    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }

    let photoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        return image
    }()


    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoImageView()
        setupCheckMarkView()
    }

    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkmark.alpha = isSelected ? 1 : 0
    }

    private func setupPhotoImageView(){
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }

    private func setupCheckMarkView() {
        addSubview(checkmark)
        checkmark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8).isActive = true
        checkmark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
