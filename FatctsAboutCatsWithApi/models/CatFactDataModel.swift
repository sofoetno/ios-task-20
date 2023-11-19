//
//  CatFactDataModel.swift
//  FatctsAboutCatsWithApi
//
//  Created by Sofo Machurishvili on 18.11.23.
//

import Foundation

struct CatFactDataModel: Decodable {
    let data: [CatFactModel]
}
