//
//  APICallSwift.swift

class APICallSwift: NSObject {
    
    func post(apiUrl : String, requestPARAMS: [String: AnyObject], completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        requestMethod(apiUrl: apiUrl, params: requestPARAMS as [String : AnyObject], method: "POST", completion: completion)
    }
    
    func put(apiUrl : String, requestPARAMS: [String: AnyObject], completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        requestMethod(apiUrl:apiUrl, params: requestPARAMS, method: "PUT", completion: completion)
    }
    
    func get(apiUrl : String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        requestGetMethod(apiUrl: apiUrl, method: "GET", completion: completion)
    }
    
    func requestMethod(apiUrl : String, params: [String: AnyObject], method: NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        var request = URLRequest(url: URL(string: apiUrl)!)
        request.httpMethod = method as String
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let jsonTodo: NSData
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: params, options: []) as NSData
            request.httpBody = jsonTodo as Data
        } catch {
            print("Error: cannot create JSON from todo")
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task: URLSessionDataTask = session.dataTask(with : request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                // check for fundamental networking error
                print("error=\(error)")
                return
            }
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    completion(true, convertedJsonIntoDict)
                }
                else{
                    completion(false, nil)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(false, nil)
            }
        })
        task.resume()
    }
    
    func requestGetMethod(apiUrl : String, method: NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        var request = URLRequest(url: URL(string: apiUrl)!)
        
        // Set request HTTP method to GET. It could be POST as well
        request.httpMethod = "GET"//method as String
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task: URLSessionDataTask = session.dataTask(with : request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    completion(true, convertedJsonIntoDict)
                  }
                else{
                    completion(false, nil)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        })
        
        task.resume()
    }
    
    
}
