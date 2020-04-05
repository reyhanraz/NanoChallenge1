//
//  HomeController.swift
//  NanoChallenge1
//
//  Created by Reyhan Rifqi on 11/03/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var easyBtn: UIButton!
    @IBOutlet weak var medBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    @IBOutlet weak var playbtn: UIButton!
    var currindex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        easyBtn.layer.cornerRadius = 10
        medBtn.layer.cornerRadius = 10
        hardBtn.layer.cornerRadius = 10
        playbtn.layer.cornerRadius = 10
        easyBtn.layer.borderWidth = 5
        medBtn.layer.borderWidth = 5
        hardBtn.layer.borderWidth = 5
        easyBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
        medBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
        hardBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectState(_ sender: UIButton) {
        switch sender {
        case easyBtn:
            self.currindex = 0
            medBtn.isSelected = false
            hardBtn.isSelected = false
            easyBtn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            medBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            hardBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            easyBtn.alpha = 1
            medBtn.alpha = 0.6
            hardBtn.alpha = 0.6
            
        case medBtn:
            self.currindex = 1
            easyBtn.isSelected = false
            hardBtn.isSelected = false
            easyBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            medBtn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            hardBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            easyBtn.alpha = 0.6
            medBtn.alpha = 1
            hardBtn.alpha = 0.6
            
        case hardBtn:
            self.currindex = 2
            medBtn.isSelected = false
            easyBtn.isSelected = false
            easyBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            medBtn.layer.borderColor = #colorLiteral(red: 0.4705882353, green: 0.2980392157, blue: 0.05490196078, alpha: 1)
            hardBtn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            easyBtn.alpha = 0.6
            medBtn.alpha = 0.6
            hardBtn.alpha = 1
            
        default:
            0
        }
    }
    
    @IBAction func playGame(_ sender: UIButton) {
//       performSegue(withIdentifier: "toGameplay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController{
            destination.level = self.currindex
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
