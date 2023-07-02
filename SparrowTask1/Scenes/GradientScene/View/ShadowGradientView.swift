//
//  ShadowGradientView.swift
//  SparrowTask1
//
//  Created by Виктор Поволоцкий on 02.07.2023.
//

import Foundation
import UIKit

/// Вью с градиентом
final class ShadowGradientView: UIView {
    
    private var startColor: UIColor?
    private var endColor: UIColor?
    
    private let gradientLayer = CAGradientLayer()
    private let shadowLayer = CAShapeLayer()
    
    /// Инициализатор вью с двумя цветами
    init(startColor: UIColor, endColor: UIColor) {
        self.startColor = startColor
        self.endColor = endColor
        super.init(frame: CGRect.zero)
        setupShadow()
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

private extension ShadowGradientView {
    enum Constants {
        static let cornerRadius: CGFloat = 12
        static let shadowOpacity: Float  = 0.75
        static let shadowRadius: CGFloat = 10
    }
    
    func setupShadow() {
        /// Тень
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = Constants.shadowOpacity
        layer.shadowOffset = .zero
        layer.shadowRadius = Constants.shadowRadius
    }
    
    func setupGradient() {
        guard
            let startColor = startColor,
            let endColor = endColor
        else { return }
        layer.addSublayer(gradientLayer)
        gradientLayer.cornerRadius = Constants.cornerRadius
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
    }
}
