//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Reyhan Rifqi on 03/03/20.
//  Copyright © 2020 Reyhan Rifqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highestskor: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var footerImage: UIImageView!
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var resumeBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var pauselbl: UILabel!
    
    
    
    var images:[UIImage] = []
    var img: UIImage?
    var skor = 0
    var timer:Timer?
    var timeLeft = 0
    var level = 0
    var seconds = 0
    var kiriman = 0
    let defauls = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
   
    
//    override func viewDidAppear(_ animated: Bool) {
//        //showAlert(tit: "Welcome", msg: "Ayo Mulai!", but: "ayuu")
//    }
    
    func change(){
        img = images[Int.random(in: 0 ... 1)]
        foodImage.image = img
        
    }
    func showAlert(tit: String, msg: String, but: String) {
        let alert = UIAlertController(title: tit, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: but, style: .cancel){
            (action) in
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.onTimerFires), userInfo: nil, repeats: true)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        calculateSkor(high: defauls.integer(forKey: "skor"), curr: skor)
        scoreLbl.text = "0"
        skor = 0
        timer?.invalidate()
        timer = nil
        self.seconds = timeLeft

    
    }
    
    func setupUI(){
        switch level {
        case 0:
            levelLbl.text = "Easy"
            images.append(#imageLiteral(resourceName: "Resep-Ketoprak"))
            images.append(#imageLiteral(resourceName: "resep-mie-bakso-780x440"))
            btn2.setImage(#imageLiteral(resourceName: "Untitled 3"), for: .normal)
            btn1.setImage(#imageLiteral(resourceName: "mangkok"), for: .normal)
            self.timeLeft = 31
            headerImage.image = #imageLiteral(resourceName: "header1")
            footerImage.image = #imageLiteral(resourceName: "footer1")
            
           
        case 1:
            levelLbl.text = "Medium"
            images.append(#imageLiteral(resourceName: "semur-daging"))
            images.append(#imageLiteral(resourceName: "Resep-Ayam-Kecap"))
            btn2.setImage(#imageLiteral(resourceName: "btnSapi"), for: .normal)
            btn1.setImage(#imageLiteral(resourceName: "btnAyam"), for: .normal)
            self.timeLeft = 26
            headerImage.image = #imageLiteral(resourceName: "header2")
            footerImage.image = #imageLiteral(resourceName: "footer2")
            
        case 2:
            levelLbl.text = "Hard"
            images.append(#imageLiteral(resourceName: "tumis-bayam-terasi-pedas-foto-resep-utama"))
            images.append(#imageLiteral(resourceName: "KangkungTumis"))
            btn2.setImage(#imageLiteral(resourceName: "btnBayam"), for: .normal)
            btn1.setImage(#imageLiteral(resourceName: "btnKangkung"), for: .normal)
            self.timeLeft = 21
            headerImage.image = #imageLiteral(resourceName: "header3")
            footerImage.image = #imageLiteral(resourceName: "footer3")
        default:
            images.append(#imageLiteral(resourceName: "Resep-Ketoprak"))
            images.append(#imageLiteral(resourceName: "resep-mie-bakso-780x440"))
            btn2.setImage(#imageLiteral(resourceName: "Untitled 3"), for: .normal)
            btn1.setImage(#imageLiteral(resourceName: "mangkok"), for: .normal)
            self.timeLeft = 31
            headerImage.image = #imageLiteral(resourceName: "header1")
            footerImage.image = #imageLiteral(resourceName: "footer1")
        }
        change()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.onTimerFires), userInfo: nil, repeats: true)
        self.seconds = timeLeft

        highestskor.text = "Highest: \(defauls.integer(forKey: "skor"))"
        popFunc(flag: true)
        popup.layer.cornerRadius = 10
        popup.layer.borderWidth = 5
        popup.layer.borderColor = #colorLiteral(red: 0.7090470195, green: 0.4129139185, blue: 0, alpha: 1)
    }

    

    func calculateSkor(high: Int, curr: Int){
        let highSkor = high > curr ? high : curr
        highestskor.text = "Highest : \(highSkor)"
        defauls.set(highSkor, forKey: "skor")
    }
    
    @objc func onTimerFires(){
        
        seconds -= 1
        if seconds >= 10 {
        lblTimer.text = "00:\(seconds)"
        }else{
        lblTimer.text = "00:0\(seconds)"
        }

        if seconds == 0 {
            showAlert(tit: "STOOP!!", msg: "Skor Kamu \(skor)", but: "Lagii")
        }
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        if sender == btn1{
            if img == images[1]{
                skor += 1
            }else{
                showAlert(tit: "SALAHH!",msg:"Skor Kamu \(skor)", but: "Lagii")
            }
        }else if sender == btn2{
            if img == images[0]{
                skor += 1
            }else{
                showAlert(tit: "SALAHH!",msg: "Skor Kamu \(skor)", but: "Lagii")
            }
            
        }
        scoreLbl.isHidden = false
        scoreLbl.text = "\(skor)"
        change()
    }
    
    func popFunc(flag: Bool){
        self.popup.isHidden = flag
        self.resumeBtn.isHidden = flag
        self.resumeBtn.isHidden = flag
        self.exitBtn.isHidden = flag
        self.pauselbl.isHidden = flag
    }
   
    @IBAction func back(_ sender: Any) {
        popFunc(flag: false)
        timer?.invalidate()
        
    }
    @IBAction func resume(_ sender: Any) {
        popFunc(flag: true)
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.onTimerFires), userInfo: nil, repeats: true)
    }
    
  
    @IBAction func restart(_ sender: Any) {
        setupUI()
    }
    
    @IBAction func exit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
}

