//
//  ViewController.swift
//  TeamSpaToDoList
//
//  Created by woonKim on 2023/12/13.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoListData: [String] = []
    
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
    
    @IBAction func writeToDoList(_ sender: Any) {
        let title = "해야할 일이 생기셨군요 🙏🏻"
        let message = "(띄어쓰기 포함 15자 작성)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .default)
        let ok = UIAlertAction(title: "작성하기", style: .default) { [self] _ in
            // 작성하기 누르면 실행
            if let text = alert.textFields?[0].text {
                toDoListData.append(text)
                toDoList.reloadData()
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
    
    // alert에 추가된 txField 글자 수 제한
    @objc func textCountLimit(_ sender: UITextField) {
        if sender.text!.count > 15 {
            sender.deleteBackward()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Ansungtangmyun-Bold", size: 15)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.backgroundColor = .black
        cell.selectionStyle = .none

        cell.textLabel?.text = toDoListData[indexPath.row]
        return cell
    }
}
