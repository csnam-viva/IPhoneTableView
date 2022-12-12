//
//  ViewController.swift
//  Table
//
//  Created by 비바 on 2022/12/09.
//

import UIKit
let name = ["aaa","bbb","ccc","ddd","eee"]
/*
 https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f44873fef3b8f0b4e6cd8119dea8bad7&targetDt=20221210
 */
struct MovieData :Codable{
    let boxOfficeResult : BoxOfficeResult
}
struct BoxOfficeResult: Codable{
    let dailyBoxOfficeList :[ DailyBoxOfficeList]
}
struct DailyBoxOfficeList : Codable{
    let movieNm: String
    let audiCnt: String
}
class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var myCount: UILabel!
    @IBOutlet weak var table: UITableView!
    let movieURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f44873fef3b8f0b4e6cd8119dea8bad7&targetDt=20221210"
    var movieData: MovieData?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return UITableViewCell()
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "myCell")
        //        let cell = UITableViewCell(style: .value1, reuseIdentifier: "myCell")
        //        cell.textLabel?.text = "\(indexPath.row)"
        //        cell.detailTextLabel?.text = indexPath.description
        //        cell.imageView?.image = UIImage(named: "smile.png")!
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        //cell.myLabel.text = indexPath.description
        //cell.myLabel.text = name[indexPath.row]
        //print(indexPath.description,separator: " ",terminator: " ")
        cell.myLabel.text =
        movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        
        cell.myCount.text =         movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiCnt
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }
    func getData(){
        if let url = URL(string:movieURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response,error ) in
                if error != nil{
                    print(error!)
                    return
                }
                if let JSONData = data{
                    //print(JSONData,response!)
                    //let dataString = String(data: JSONData, encoding: .utf8)
                    //print(dataString!)
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(MovieData.self, from: JSONData)
//                        print(decodeData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
// A print(decodeData.boxOfficeResult.dailyBoxOfficeList[0].audiCnt)
                        self.movieData = decodeData
                        //self.table.reloadData()
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    }
                    catch {
                            print(error)
                    }
                    
                }
                
            }
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        getData();
    }
    
    
}

