//
//  InfoViewController.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var imageView: CharacterImageView!
    
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    var img: UIImage!
    
    var character: BBCharacter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = character.name
        imageView.image = img
        birthDateLabel.text = "Birth date: \(character.birthday ?? "Unknown")"
        statusLabel.text = "Status: \(character.status ?? "Unknown")"
        nicknameLabel.text = "Nickname: \(character.nickname ?? "Unknown")"
    }
    func fetchImage() {
        guard let imageURL = URL(string: character.img ?? "") else { return }
        let data = try? Data(contentsOf: imageURL)
        img = UIImage(data: data!)
    }
}

