//  WorldViewController.swift
//  CVD19Tracker
//

import UIKit


class WorldViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Note: Background Color, fonts and text colors for labels, buttons and background
        view.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.2823529412, blue: 0.6196078431, alpha: 1)
        
        let url = "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true"
        getCovidData(from: url)
    }
    
    private func getCovidData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in

           guard let error = error else {
            print("ERROR: \(error)")
            return
           }
           
           guard let data = data else {
             return
           }
           
           print("RESPONSE: \(response) ")
           
           do {
             let json = try JSONDecoder().decode(JsonAPI.self, from: data)
               print(json.results)
                    
                    
           } catch {
                   print("Error \(error.localizedDescription)")
               }
               
           })
           
           task.resume()
           
       }
   }

struct JsonAPI: Decodable {
    let results: [JsonResult]
}

struct JsonResult: Decodable {
    var infected: Int
    var tested: Int?
    var recovered: Int?
    var deceased: Int
    var country: String
    var moreData: URL
    var historyData: URL
    var sourceUrl: URL
    var lastUpdatedApify: Date
}
