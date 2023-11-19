//
//  BreedsViewController.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 19.11.23.
//

import UIKit

class BreedsViewController: UIViewController {
    
    private let breedViewModel = BreedViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        breedViewModel.fetchData(callback: tableView.reloadData)
        
        setupTableList()
        setupConstrains()
       
    }
    
    private func setupTableList() {
        tableView.register(BreedsCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func setupConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension BreedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breedViewModel.breedsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BreedsCell
        let breedInfo = breedViewModel.getSingleBreed(index: indexPath.row)
        cell?.configure(breedText: breedInfo.breed, countryText: breedInfo.country)
        return cell ?? UITableViewCell()
    }
}
