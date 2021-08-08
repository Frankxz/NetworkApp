//
//  HomeViewController.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "logo")
        descriptionLabel.text = "Breaking Bad is an American television crime drama that premiered from January 20, 2008 to September 29, 2013 on the AMC cable channel. Over five seasons of 62 episodes, the story of Walter White, a schoolteacher, was diagnosed with inoperable lung cancer. Together with his former student Jesse Pinkman, he begins to manufacture and sell methamphetamine to secure the financial future of his family."
    }
}
