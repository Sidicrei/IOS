//
//  ViewController.swift
//  Calcula_Idade
//
//  Created by user151719 on 26/03/19.
//  Copyright © 2019 user151719. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var birthdateTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    
    @IBAction func btn_calculaIdade(_ sender: Any) {
        
        var anos: Int
        do {
            anos = try calculateAge(from: ageLabel.text!, dateFormat: "dd/MM/yyyy")
            birthdateTextField.text = "\(anos) Anos!"
        } catch ageError.emptyText {
            birthdateTextField.text = "Texto vazio!"
        } catch ageError.invalidDate  {
            birthdateTextField.text = "Data inválida (DD/MM/YYYY)!"
        } catch ageError.invalidFormat {
            birthdateTextField.text = "Formato inválido (DD/MM/YYYY)!"
        } catch ageError.futureBirthday {
            birthdateTextField.text = "Prevendo o futuro!"
        } catch {
            birthdateTextField.text = "Erro desconhecido!"
        }
       
    }
    private func calculateAge(from text: String, dateFormat: String) throws-> Int{
        
        
        if text.isEmpty{
            throw ageError.emptyText
        }
        
        
        let dataEntr: String = text
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        if dataEntr.count != dateFormat.count{
            throw ageError.invalidFormat
        }
        
        let datecomponents = dateFormatter.date(from: dataEntr)
        
        if (datecomponents == nil){
            throw ageError.invalidDate
        }
        
        let now = Date()
        if (datecomponents! > now) {
            throw ageError.futureBirthday
        }
        
        
       
        guard let dataat = dateFormatter.date(from: dataEntr) else {
            throw ageError.unknown
        }
        
        
        
        let age = Calendar.current.dateComponents([.year ], from: dataat, to: now).year
        
        if age == nil{
            throw ageError.unknown
        }
 
        return age!
    
 
    }
    enum ageError: Error{
        case emptyText
        case invalidFormat
        case invalidDate
        case futureBirthday
        case unknown
    }
    
}

