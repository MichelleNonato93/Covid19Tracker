//
//  ViewController.swift
//  CVD19Tracker
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var mainSubTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    
   
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var bgButton: UIButton!
    @IBOutlet var virusLogo: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Note: Background Color, fonts and text colors for labels, buttons and background
        view.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.2823529412, blue: 0.6196078431, alpha: 1)
        mainTitle.textColor = #colorLiteral(red: 0.1333333333, green: 0.09803921569, blue: 0.2823529412, alpha: 1)
        mainTitle.font = UIFont(name: "Orbitron-ExtraBold", size: 65)
        mainSubTitle.textColor = #colorLiteral(red: 0.1333333333, green: 0.09803921569, blue: 0.2823529412, alpha: 1)
        mainSubTitle.font = UIFont(name: "Orbitron-Bold", size: 35)
        mainSubTitle.attributedText = NSAttributedString(string: "TRACKER", attributes: [.kern: 3.12])
        subTitle.textColor = #colorLiteral(red: 0.1333333333, green: 0.09803921569, blue: 0.2823529412, alpha: 1)
        subTitle.font = UIFont(name: "Raleway-Medium", size: 20)
        mainButton.layer.cornerRadius = 8
        

        //Note: Swipe up Gesture for going to next page
        let gestureSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureSwipe(_:)))
        gestureSwipeRecognizer.direction = .up
        gestureSwipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(gestureSwipeRecognizer)
        view.isUserInteractionEnabled = true
        
    }
    
    //Note: Animation Rotation for the image logo of virus
    @IBAction func bgBtnMain(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.virusLogo.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
         })
    }

    //Note: Will call the HomeViewController
    func homeVC() {
        guard let hvc = storyboard?.instantiateViewController(identifier: "home_vc") as? HomeViewController else {
            return
        }
        present(hvc, animated: true)
    }
    
    //Note: Action Swipe for calling the home controller
    @objc func gestureSwipe(_ gesture: UISwipeGestureRecognizer) {
        homeVC()
    }
    
    
}

