//
//  Data.swift
//  Cucushka
//
//  Created by hanton on 08/12/2019.
//  Copyright © 2019 hanton. All rights reserved.
//

import Foundation

struct DataMortality: Codable {
    let region: Int;
    let terrain: String;
    let sex: String;
    let age: Int;
    let weight: Int;
    let height: Int;
    let systPres: Int;
    let diastPres: Int;
    let pulse: Int;
    let smoking: String;
    let alcohol: String;
    let load: String;
}

struct DataOut: Codable {
    let number: Int;
    let recomendation: String;
}
