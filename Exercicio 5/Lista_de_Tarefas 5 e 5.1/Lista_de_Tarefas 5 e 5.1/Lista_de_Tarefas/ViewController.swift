//
//  ViewController.swift
//  Lista_de_Tarefas
//
//  Created by user151719 on 02/04/19.
//  Copyright © 2019 user151719. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // let items = ["item1","Item2"]
    var items: [Todo] = [
        Todo(task: "Terminar exercícios de IOS"),
        Todo(task: "Trocar android por iPhone"),
        Todo(task: "Comprar um Macbook")
    ]
    
    @IBOutlet weak var tableView_View: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView_View.dataSource = self
        tableView_View.delegate = self
        tableView_View.register(TodoItemCell.self,
                           forCellReuseIdentifier: "todoItem")
        
    }
    @IBAction func AddIem(_ sender: Any) {
       let alert = UIAlertController(title: "Nova Tarefa", message: "Digite a nova tarefa", preferredStyle: .alert)
        alert.addTextField{(textField) in textField.placeholder = "Tarefa"}

        var item2  = self.items
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(_) in
            guard let task = alert.textFields?.first?.text else {return}
            
            item2.insert(Todo(task: task),at: 0)
            self.items = item2
            self.tableView_View.reloadData()
            
            
            // Criar um novo objeto Todo e atualizar o array de items
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let tarefaRealizada = self.items[indexPath.row].isCompleted
        var msg = "Realizada"
        if (tarefaRealizada){
            msg = "Desmarcar"
        }
        let RealizarTarefaAction = UIContextualAction(
            style: .normal, title: msg, handler: {
                (action, view, completionHandler) in
                if (tarefaRealizada){
                    self.items[indexPath.row].isCompleted = false
                }
                else{
                    self.items[indexPath.row].isCompleted.toggle()
                }
                
                // self.items[indexPath.row].isCompleted.toggle()
                // tableView.reloadData()
                // animacao
                tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.middle)
               self.tableView_View.reloadData()
                completionHandler(true)
        })
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [RealizarTarefaAction])
        return swipeConfiguration
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeAction = UIContextualAction(
            style: .destructive, title: "Remover", handler: {
                (action, view, completionHandler) in
                // Remover item da lista
                self.items.remove(at: indexPath.row)
                 self.tableView_View.reloadData()
                completionHandler(true)
        })
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [removeAction])
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView_View.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //cell.textLabel?.text = items[indexPath.row].task
        //return cell
        
       //  items.app( Todo(task: "Terminar exercícios de IOS s"))
        
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoItem") as? TodoItemCell else{ fatalError()}
        
        //cell.textLabel?.text = items[indexPath.row].task
        
        
        
        let todo = items[indexPath.row]
        cell.textLabel?.text = todo.task
        cell.isCompleted = todo.isCompleted
        
        
        
        
        return cell
       // tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isCompleted.toggle()
        // tableView.reloadData()
        // animacao
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.middle)
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        return indexPath
    }
    
    


}

