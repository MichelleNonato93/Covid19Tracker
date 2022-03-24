//
//  HomeViewController.swift
//  CVD19Tracker
//
//  Created by michelle nonato on 2/24/22.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet var welcomeTitle: UILabel!
    @IBOutlet var greetings: UILabel!
    @IBOutlet var secondTitle: UILabel!
    @IBOutlet var thirdTitle: UILabel!
    @IBOutlet var lastTitle: UILabel!
    
    @IBOutlet var infoButton: UIButton!
    @IBOutlet var moreInfoButton: UIButton!
    @IBOutlet var searchCountry: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Note: Background Color, fonts and text colors for labels, buttons and background
        view.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.2823529412, blue: 0.6196078431, alpha: 1)
        welcomeTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        welcomeTitle.font = UIFont(name: "Orbitron-ExtraBold", size: 25)
        greetings.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        greetings.font = UIFont(name: "Orbitron-Bold", size: 15)
        secondTitle.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        secondTitle.font = UIFont(name: "Raleway-Medium", size: 22)
        thirdTitle.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        thirdTitle.font  = UIFont(name: "Raleway-Medium", size: 22)
        lastTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lastTitle.font = UIFont(name: "Raleway-Medium", size: 22)
        searchCountry.layer.cornerRadius = 8
        
        
        
    }
    
    //Note: Will call the InfoController
    func infoVC() {
        guard let ivc = storyboard?.instantiateViewController(identifier: "info_vc") as? InfoController else {
            return
        }
        present(ivc, animated: true)
    }
    
    //Note: Will call the VariantController
    func variantVC() {
        guard let cvvc = storyboard?.instantiateViewController(identifier: "variant_vc") as? VariantViewController else {
            return
        }
        present(cvvc, animated: true)
    }
    
    //Note: Button action that will redirect to info controller page
    @IBAction func moreInfoBtnAction(_ sender: Any) {
        infoVC()
    }
    
    //Note: Button action that will redirect to variant controller page
    @IBAction func variantBtnAction(_ sender: Any) {
        variantVC()
    }
}
