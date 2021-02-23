//
//  ViewController.swift
//  Spotify
//
//  Created by Blythe Waltman on 2/21/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapSettings))
    }
        
        @objc func didTapSettings(){
            let vc = ProfileViewController()
            vc.title = "Profile"
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        }
 
}


