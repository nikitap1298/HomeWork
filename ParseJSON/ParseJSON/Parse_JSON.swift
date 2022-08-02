//
//  Parse_JSON.swift
//  ParseJSON
//
//  Created by Nikita Pishchugin on 02.08.2022.
//

import UIKit

struct Q: Decodable {
    let quiz: [Quiz]
}

struct Quiz: Decodable {
    let sport: Sport
    let maths: Maths
}

struct Sport: Decodable {
    let qS1: QS1
}

struct QS1: Decodable {
    let question: String
    let options: [String]
    let answer: String
}

struct Maths: Decodable {
    let qM1: QM1
    let qM2: QM2
}

struct QM1: Decodable {
    let question: String
    let options: [Int]
    let answer: Int
}

struct QM2: Decodable {
    let question: String
    let options: [Int]
    let answer: Int
}
