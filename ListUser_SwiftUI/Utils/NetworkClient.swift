//
//  NetworkClient.swift
//  ListUser_SwiftUI
//
//  Created by Pipe Carrasco on 24-05-21.
//

import Foundation
import Alamofire

struct NetworkClient {
    
    func getAllUsers(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        AF.request("\(Constants.API_URL)users").validate().responseDecodable(of: [UserModel].self) { response in
        switch response.result {
        case .success(let users):
          completion(.success(users))
        case .failure(let error):
            print("error \(error)")
          completion(.failure(error))
        }
      }
    }
}
