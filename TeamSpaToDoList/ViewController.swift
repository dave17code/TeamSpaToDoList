//
//  ViewController.swift
//  TeamSpaToDoList
//
//  Created by woonKim on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {
    
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
    @IBOutlet weak var toDoList: UITableView!
    
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
        
        toDoList.delegate = self
        toDoList.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = toDoList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}
