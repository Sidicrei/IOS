//
//  Struct.swift
//  Lista_de_Tarefas
//
//  Created by user151719 on 02/04/19.
//  Copyright © 2019 user151719. All rights reserved.
//

import Foundation


struct Todo: Codable, CustomDebugStringConvertible{
    var id: Int?
    var task: String
    var isCompleted: Bool
    init(task: String) {
        self.task = task
        self.isCompleted = false
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case task
        case isCompleted = "isCompleted"
    }
    
    var debugDescription: String {
        return "\n(\(task) - \(String(describing: id)))"
    }
}

