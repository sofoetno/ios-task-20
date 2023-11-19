//
//  ViewController.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 18.11.23.
//

import UIKit

class FactListViewController: UIViewController {
    private let catFactViewModel = CatFactViewModel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        catFactViewModel.fetchData(callback: tableView.reloadData)
        
        setupTableList()
        setupConstrains()
    }

    private func setupTableList() {
        tableView.register(CatFactCell.self, forCellReuseIdentifier: "Cell")
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

extension FactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catFactViewModel.catFactCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CatFactCell
        let catFact = catFactViewModel.getSingleCatFact(index: indexPath.row)
        cell?.configure(factText: catFact.fact)
        return cell ?? UITableViewCell()
    }
}
