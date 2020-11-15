//
//  ViewController.swift
//  Rotating With Transforms
//
//  Created by Akshansh Thakur on 15/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var globeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rotateImage(_:)))
        
        globeImage.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func rotateImage(_ sender: UITapGestureRecognizer) {
        
        let rotationTransform = CGAffineTransform(rotationAngle: 0.99 * CGFloat.pi)
        let leftOverTransform = CGAffineTransform(rotationAngle: 0.01 * CGFloat.pi)
        
        UIView.animate(withDuration: 0.25) {
            self.globeImage.transform =  self.globeImage.transform.concatenating(rotationTransform)
        } completion: { (value) in
            UIView.animate(withDuration: 0) {
                self.globeImage.transform = self.globeImage.transform.concatenating(leftOverTransform)
            }
        }

        
    }


}

