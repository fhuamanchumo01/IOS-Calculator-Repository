//
//  UIBottonExtension.swift
//  IOS-Calculator
//
//  Created by Fernando Huamanchumo on 22/9/21.
//

import UIKit

extension UIButton {
    
    //borde redondo
    func round(){
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    //brillo
    func shine(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) {
            (completion)in UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    
    func selectOperation(_ selected: Bool){
        backgroundColor = selected ? .blue : .red
        
    }
}
