//
//  CharacterCell.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: CharacterImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var character: BBCharacter!
    
    func configure(with character: BBCharacter)  {
        self.character = character
        nameLabel.text = character.name
        
//        guard let url = URL(string: character.img ?? "") else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "Can not fetch image")
//                return
//            }
//
//            guard let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                self.characterImage.image = image
//            }
//        }.resume()
        characterImage.fetchImage(from: character.img ?? "")
    }
}
