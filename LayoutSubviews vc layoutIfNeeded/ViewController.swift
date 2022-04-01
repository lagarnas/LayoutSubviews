//
//  ViewController.swift
//  LayoutSubviews vc layoutIfNeeded
//
//  Created by Анастасия Леонтьева on 20.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = RedView()
    
    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(redView)
        
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //неявная анимация
        let newPosition = CGPoint(x: self.animateButton.center.x,
                                  y: self.animateButton.center.y - 100)
        self.animateButton.center = newPosition
    }
    
    @IBAction func animateButton(_ sender: UIButton) {
        //Apple советует вызываеть layoutIfNeeded() метод перед блоком анимации
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2) {
            self.heightConstraint.constant = 250
            
            // и в блоке анимации
            self.view.layoutIfNeeded()
            
            //анимируется нормально так как мы не меняли констреинты а только изменили положение frame
            self.redView.center = CGPoint(x: 0, y: 0)
        }
        
    }
    
}

