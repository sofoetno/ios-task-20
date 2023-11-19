//
//  CatFactCell.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 18.11.23.
//

import UIKit

class CatFactCell: UITableViewCell {
    private let factLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setupFactLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFactLabel() {
        factLabel.numberOfLines = 0
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(factLabel)
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            factLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            factLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(factText: String) {
        factLabel.text = factText
    }
}
