//
//  AppColors.swift
//  Registration
//
//  Created by Merna Islam on 28/08/2024.
//

import Foundation
import UIKit

struct AppColors {
    static let primaryColor = UIColor(red: 82/255, green: 18/255, blue: 32/255, alpha: 1.0)
    static let white = UIColor(white: 1, alpha: 1)
    static let lightRed = UIColor(red: 1, green: 234/255, blue: 238/255, alpha: 1)
    static var gradientLayer: CAGradientLayer {
       let gl = CAGradientLayer()
       gl.colors = [white.cgColor, lightRed.cgColor]
        gl.locations = [0.0, 0.75]
       return gl
    }
}




