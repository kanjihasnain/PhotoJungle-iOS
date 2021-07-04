//
//  ApiCall.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation

/*========================================================================*/
// MARK: /* Can Be Used To Get Sucess (200) From Server With Empty Body */
struct EmptyModel: Codable {
}

/*========================================================================*/

public class ApiManager<T> where T: Codable {
    
    private let successHandler: (T) -> Void
    
    // MARK: /* Sometimes Server Only Return 200 Success Result Without Any JSON So API Manager Return with this handler */
    private let nullDataSuccessHandler: ((HttpStatusCode) -> Void)?
    
    private let errorHandler: (_ statusCode: HttpStatusCode?,
                               _ message: String?,
                               _ dataDictionary: [String: Any]?) -> Void
    
    let apiClient = APIClient()
    
    var task: URLSessionDataTask!
    
    init(successHandler: @escaping (T) -> Void,
         nullDataSuccessHandler: ((HttpStatusCode) -> Void)? = nil,
         errorHandler: @escaping (_ statusCode: HttpStatusCode?,
                                  _ message: String?,
                                  _ dataDictionary: [String: Any]?) -> Void) {
        
        self.successHandler = successHandler
        self.nullDataSuccessHandler = nullDataSuccessHandler
        self.errorHandler = errorHandler
    }
}

/*========================================================================*/
extension ApiManager {
    
    @discardableResult func makeNetworkCall(endPointUrl: String,
                                            with parameter: [String: Any]? = nil,
                                            requestType: URLRequest.HTTPMethod) -> URLSessionDataTask? {
        
        let urlRequest = URLRequest(url: endPointUrl,
                                    method: requestType,
                                    header: nil,
                                    body: parameter)
        
        return (self.makeNetworkCall(with: urlRequest))
    }
}

/*========================================================================*/
extension ApiManager {
    
    private func makeNetworkCall(with urlRequest: URLRequest) -> URLSessionDataTask {
        
        task?.cancel()
        
        task = self.apiClient.dataTask(urlRequest) { response in
            //Response
            switch response {
            case .success(let serverResponse):
                
                // MARK: Code Sinppet Helps to Print Raw JSON Before We try to decode it
                if let jsonString = String(data: serverResponse.data, encoding: .utf8) {
                    print("FOR DEBUGGING RAW JSON REPONSE")
                    print("Status Code:", serverResponse.response.statusCode)
                    print(jsonString)
                }
                
                let statusCode = serverResponse.response.statusCode.status
                
                do {
                    let decoder = JSONDecoder()
                    let apiResponse = try decoder.decode(ApiResponse<T>.self, from: serverResponse.data)
                    switch statusCode {
                    case .success:
                        self.handleSucessResponse(data: apiResponse.results)
                    case .validation:
                        // MARK: Server Validation Errors Can Be Returned Here
                        self.errorHandler(nil, nil, nil)
                    case .unauthorized:
                        // MARK: Unauthorized Users Can Be Logout here directly
                        self.errorHandler(nil, nil, nil)
                        self.logoutUser()
                    case .failure, .serverError, .unknown:
                        // MARK: Unknown Error Handler
                        self.errorHandler(nil, nil, nil)
                    case .forbidden:
                        // MARK: /* We Can Return Server Messages And Dictionary For Better Error Handling And Interactor Can Have More Idea What To Do Next. */
                        if let dataDictionary = serverResponse.data.getJSONFromData() {
                            self.errorHandler(.forbidden, apiResponse.message, dataDictionary)
                        } else {
                            self.errorHandler(nil, nil, nil)
                        }
                    }
                } catch let error {
                    // MARK: JSON Parsing Error
                    print(error.localizedDescription)
                    self.errorHandler(nil, nil, nil)
                }
            case .failure(let error):
                // MARK: Unknown Error Handler
                print(error)
                self.errorHandler(nil, nil, nil)
            }
        }
        return task
    }
}

/*========================================================================*/
extension ApiManager {
    
    private func handleSucessResponse(data: T?) {
        guard let data = data else {
            guard let handler = self.nullDataSuccessHandler else {
                // MARK: Unknown Error Handler
                self.errorHandler(nil, nil, nil)
                return
            }
            handler(HttpStatusCode.success)
            return
        }
        
        // MARK: Success From Server
        self.successHandler(data)
    }
}
/*========================================================================*/

extension ApiManager {
    
    // MARK: Unauthorized User
    func logoutUser() {
        
    }
}
/*========================================================================*/
