//
//  CatFactViewModel.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 18.11.23.
//

import Foundation
import NetworkService

final class CatFactViewModel {
    private var catFacts: [CatFactModel] = []
    
    var catFactCount: Int {
        catFacts.count
    }
    

    func getSingleCatFact(index: Int) -> CatFactModel {
        catFacts[index]
    }
    
    func fetchData(callback: @escaping () -> Void) {
        Task {
            do {
                if let catFactDataModel: CatFactDataModel = try await NetworkService.shared.getData(fromUrl:  "https://catfact.ninja/facts") {
                    catFacts = catFactDataModel.data
                    DispatchQueue.main.async {
                        callback()
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}
