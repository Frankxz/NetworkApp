//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Robert Miller on 11.08.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacters (with url: String, with complition: @escaping ([BBCharacter]) -> Void) {
        AF.request(url, method: .get)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let characters = BBCharacter.getCharacters(from: value)
                    DispatchQueue.main.async {
                        complition(characters)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    func fetchImage (with url: String?) -> Data? {
        guard let imageURL = URL(string: url ?? "") else { return nil}
        return try? Data(contentsOf: imageURL)
    }
}
