//
//  ViewController.swift
//  TeamSpaToDoList
//
//  Created by woonKim on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoListData: [String] = []
        
    let jjangCenterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jjangGuCenter")
        return imageView
    }()
    
    @IBOutlet weak var topSafeAreaFill: UIImageView!
    @IBOutlet weak var jjangGuTopHStackView: UIStackView!
    @IBOutlet weak var jjangGuTop1: UIImageView!
    @IBOutlet weak var jjangGuTop2: UIImageView!
    @IBOutlet weak var jjangGuTop3: UIImageView!
    @IBOutlet weak var jjangGuBottomHStackView: UIStackView!
    @IBOutlet weak var jjangGuBottom1: UIImageView!
    @IBOutlet weak var jjangGuBottom2: UIImageView!
    @IBOutlet weak var jjangGuBottom3: UIImageView!
    @IBOutlet weak var titleWithDate: UILabel!
    @IBOutlet weak var toDoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSafeAreaFill.image = UIImage(named: "topSafeAreaFill")
        jjangGuTopHStackView.distribution = .fillEqually
        jjangGuTop1.image = UIImage(named: "jjangGuTop")
        jjangGuTop2.image = UIImage(named: "jjangGuTop")
        jjangGuTop3.image = UIImage(named: "jjangGuTop")

        jjangGuBottomHStackView.distribution = .fillEqually
        jjangGuBottom1.image = UIImage(named: "jjangGuBottom")
        jjangGuBottom2.image = UIImage(named: "jjangGuBottom")
        jjangGuBottom3.image = UIImage(named: "jjangGuBottom")

        let fomatter = DateFormatter()
        fomatter.dateFormat = "yyyy-MM-dd"
        titleWithDate.text = "\(fomatter.string(from: Date()))" + " 🙏🏻 일 목록"
        
        if let data = UserDefaults.standard.stringArray(forKey: "toDoListData") {
            toDoListData = data
        }
        
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
        toDoListTableView.showsVerticalScrollIndicator = false

        if toDoListData.isEmpty {
            toDoListTableView.backgroundView = jjangCenterImageView
        }
    }
    
    @IBAction func writeToDoList(_ sender: Any) {
        let title = "해야할 일이 생기셨군요 🙏🏻"
        let message = "(띄어쓰기 포함 20자 작성)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .default)
        let ok = UIAlertAction(title: "작성하기", style: .default) { [self] _ in
            
            if let text = alert.textFields?[0].text {
                toDoListData.append(text)
                UserDefaults.standard.setValue(toDoListData, forKey: "toDoListData")
                toDoListTableView.backgroundView = .none
                toDoListTableView.reloadData()
            } else {}
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField() { (txField) in
            txField.placeholder = "해야할 일 작성"
            txField.addTarget(self, action: #selector(self.textCountLimit(_:)), for: .editingChanged)
        }
        self.present(alert, animated: true)
    }
    
    @objc func textCountLimit(_ sender: UITextField) {
        if sender.text!.count > 20 {
            sender.deleteBackward()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let completion = UIContextualAction(style: .normal, title: "완료") { [self] (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            
            toDoListData.remove(at: indexPath.row)
            UserDefaults.standard.setValue(toDoListData, forKey: "toDoListData")
            
            if toDoListData.isEmpty {
                toDoListTableView.backgroundView = jjangCenterImageView
            }
            toDoListTableView.reloadData()
        }
        
        completion.backgroundColor = .systemGreen
        
        let config = UISwipeActionsConfiguration(actions:[completion])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = toDoListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Ansungtangmyun-Bold", size: 15)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        cell.textLabel?.text = toDoListData[indexPath.row]
        
        return cell
    }
}
