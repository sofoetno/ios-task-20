//
//  BreedsCell.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 19.11.23.
//

import UIKit

class BreedsCell: UITableViewCell {
    private let breedLabel = UILabel()
    private let countryLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(breedLabel)
        contentView.addSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            breedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            breedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            breedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            countryLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 10),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(breedText: String, countryText: String) {
        breedLabel.text = breedText
        countryLabel.text = countryText
    }
    
}
