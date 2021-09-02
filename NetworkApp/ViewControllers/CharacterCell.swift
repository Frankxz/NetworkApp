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
        characterImage.fetchImage(from: character.img ?? "")
    }
}
