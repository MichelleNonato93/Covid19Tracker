import UIKit

var greeting = "Hello, playground"


struct JsonAPI: Decodable {
    let results: [JsonResult]
}

struct JsonResult: Decodable {
    var infected: Int
    var recovered: Int?
    var deceased: Int
    var country: String
    var moreData: URL
    var historyData: URL
    var sourceUrl: URL
    var lastUpdatedApify: Date
}

let url = "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true"
getCovidData(from: url)

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
           print(json)
       } catch {
               print("Error \(error.localizedDescription)")
           }
           
    }).resume()
}
