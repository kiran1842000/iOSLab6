
//  ViewController.swift
//  lab6
//  Created by 8940891 on 10/20/23.

import UIKit
struct toDo
{
    let text: String
    var complete: Bool
}
class ViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [toDo]()
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func AddButton(_ sender: Any) 
    {
        let alert = UIAlertController(title: "Add Item", message: "Add Item", preferredStyle: .alert)
        
        alert.addTextField 
        { (textField)in
            textField.placeholder = "Write an Item"
            
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { (_) in
            guard let toDotext = alert.textFields?.first?.text   else{
                return
            }
            
            self.toDoList.append(toDo(text: toDotext,complete: false))
            self.tableView.reloadData()}))
        present(alert,animated:  true)
        
        
    }
    
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = toDo.text
        
        if toDo.complete 
        {
            cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.5
        }
        else 
        {
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) 
    {
        if editingStyle == .delete 
        {
            toDoList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        toDoList[indexPath.row].complete.toggle()
        tableView.reloadData()
  }
}
