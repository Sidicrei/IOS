//
//  Struct.swift
//  Lista_de_Tarefas
//
//  Created by user151719 on 02/04/19.
//  Copyright © 2019 user151719. All rights reserved.
//

import Foundation
struct Todo {
    var task: String
    var isCompleted: Bool
    init(task: String) {
        self.task = task
        self.isCompleted = false
    }
}
