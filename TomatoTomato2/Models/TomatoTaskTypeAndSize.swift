//
//  TomatoTaskTypeAndSize.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 14/02/2023.
//

import Foundation

enum TomatoSize: String, CaseIterable, Codable, Identifiable {
    case XS
    case S
    case M
    case L
    case XL

    var name: String {
        rawValue
    }
    
    var id: Self { self }
}

enum TomatoType: String, Codable, CaseIterable, Identifiable {
    case mail
    case develop
    case launch
    case meet
    case usual
    case plan
    case research
    case review
    case test
    
    var name: String {
           rawValue.capitalized
       }
    
    var id: Self { self }
}
