//
//  CategoryResponseModel.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 03/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation


struct CategoryResponseModel: Codable {
    let id: Int64?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int64.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
