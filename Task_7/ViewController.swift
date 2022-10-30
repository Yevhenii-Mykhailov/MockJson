//
//  ViewController.swift
//  Task_7
//
//  Created by Yevhenii M on 27.10.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainTableView: UITableView!
    var responseResult: [TestDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        self.registerTableViewCells()
    }
    
    private func registerTableViewCells() {
        let authorNameLable = UINib(nibName: "TestDataTVCell",bundle: nil)
        self.mainTableView.register(authorNameLable, forCellReuseIdentifier: "TestDataTVCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        responseResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(withIdentifier: "TestDataTVCell") as? TestDataTVCell {
            let currentCount = responseResult[indexPath.row]
            cell.userName = currentCount.id
            cell.email = currentCount.email
            cell.dateTime = currentCount.lastLogin.dateTime
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    @IBAction func getData(_ sender: Any) {
        let testData = getDataFromFile()
        
        AF.request("https://app.fakejson.com/q",
                   method: .post,
                   parameters: testData).responseDecodable(of: [TestDataModel].self) { response in
            debugPrint(response)
            guard let responseBody = response.value else { return }
            self.responseResult = responseBody
            self.mainTableView.reloadData()
        }
    }
    
    func getDataFromFile() -> TestData {
        let filePath = Bundle.main.url(forResource: "testDataJson",
                                       withExtension: "json")!
        
        var result = TestData(token: "",
                              data: DataClass(id: "",
                                              email: "",
                                              gender: "",
                                              lastLogin: TestLastLogin(dateTime: "",
                                                                       ip4: ""),
                                              dataRepeat: 0))
        
        do {
            let data = try Data(contentsOf: filePath)
            let jsonDecoder = JSONDecoder()
            let testData = try jsonDecoder.decode(TestData.self, from: data)
            result = testData
        } catch {
            print(error)
        }
        
        return result
    }
}

