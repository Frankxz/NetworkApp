//
//  Character.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

struct BBCharacter: Decodable {
    let name: String?
    let birthday: String?
    let img: String?
    let status: String?
    let nickname: String?
    
    init (data: [String: Any]) {
        name = data["name"] as? String ?? "?"
        birthday = data["birthday"] as? String ?? "?"
        img = data["img"] as? String ?? "?"
        status = data["status"] as? String ?? "?"
        nickname = data["nickname"] as? String ?? "?"
        
    }
    
    static func getCharacters(from value: Any) -> [BBCharacter] {
        guard let charactersData = value as? [[String: Any]] else { return [] }
        return charactersData.compactMap { BBCharacter(data: $0) }
    }
}
