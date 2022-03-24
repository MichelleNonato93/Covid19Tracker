//
//  VariantViewController.swift
//  CVD19Tracker
//
//  Created by michelle nonato on 2/24/22.
//

import UIKit

class VariantViewController: UIViewController {

    @IBOutlet var rootButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Do any additional setup after loading the view.
        
        //Note: Background Color, fonts and text colors for labels, buttons and background
        view.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.2823529412, blue: 0.6196078431, alpha: 1)
        mainTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainTitle.font = UIFont(name: "Orbitron-Bold", size: 20)
        
        //Note: When exit button is tapped it goes back to the root controller
        let tapRootButton = UITapGestureRecognizer(target: self, action: #selector(self.rootButtonTap))
        rootButton.addGestureRecognizer(tapRootButton)
        rootButton.isUserInteractionEnabled = true
        
        //Note: When home button is tapped it goes back to the home controller
        let tapHomeButton = UITapGestureRecognizer(target: self, action: #selector(self.homeButtonTap))
        homeButton.addGestureRecognizer(tapHomeButton)
        homeButton.isUserInteractionEnabled = true
        
    }

    //Note: Tap Function that will go back to the root controller
    @IBAction func rootButtonTap(_ gesture: UITapGestureRecognizer) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //Note: Tap Function that will call the amber view controller
    @IBAction func homeButtonTap(_ sender: Any) {
        homeVC()
    }
    
    //Note: A Function that will call the home view controller
    func homeVC() {
        guard let hvc = storyboard?.instantiateViewController(identifier: "home_vc") as? HomeViewController else {
            return
        }
        present(hvc, animated: true)
    }
}
