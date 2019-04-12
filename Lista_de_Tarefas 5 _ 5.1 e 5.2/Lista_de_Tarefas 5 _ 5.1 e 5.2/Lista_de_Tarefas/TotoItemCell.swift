//
//  TotoItemCell.swift
//  Lista_de_Tarefas
//
//  Created by user151719 on 02/04/19.
//  Copyright © 2019 user151719. All rights reserved.
//

import UIKit

class TodoItemCell: UITableViewCell {
    var isCompleted: Bool  = false{
        didSet{
            guard let currentText = textLabel?.text else{return}
         let strikeStiyle = isCompleted
            ? NSNumber(value: NSUnderlineStyle.single.rawValue)
            : NSNumber(value: 0)
            let strokeEffect:[NSAttributedString.Key : Any] = [.strikethroughStyle: strikeStiyle, .strikethroughColor: UIColor.black]
            textLabel?.attributedText = NSAttributedString(string: currentText, attributes: strokeEffect)
        }
    }
}
