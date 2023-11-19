//
//  BreedViewModel.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 19.11.23.
//

import Foundation
import NetworkService

final class BreedViewModel {
    private var breeds: [BreedModel] = []
    
    var breedsCount: Int {
        breeds.count
    }
    
    func getSingleBreed(index: Int) -> BreedModel {
        breeds[index]
    }
    
    func fetchData(callback: @escaping() -> Void ) {
        Task {
            do {
                if let breedDataModel: BreedDataModel = try await NetworkService.shared.getData(fromUrl: "https://catfact.ninja/breeds") {
                    breeds = breedDataModel.data
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
