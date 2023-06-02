//
//  CWButton.swift
//  CardWorkout-ProgrammaticUI
//
//  Created by Bruno Albino on 01/06/23.
//

import UIKit

class CWButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, title: String) {
        super.init(frame: .zero)
        
        configuration = .tinted()
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.title = title
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setColor(color: UIColor) {
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
    }
    
    func setTitle(title: String) {
        configuration?.title = title
    }
    
    func setImage(image: UIImage) {
        configuration?.image = image
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .trailing
    }
}
