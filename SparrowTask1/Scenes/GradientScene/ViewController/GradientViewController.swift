//
//  ViewController.swift
//  SparrowTask1
//
//  Created by Виктор Поволоцкий on 02.07.2023.
//

import UIKit

/// Контроллер с градиентом
class GradientViewController: UIViewController {
    
    private let gradientView: ShadowGradientView = {
        let gradientView = ShadowGradientView(
            startColor: UIColor.systemRed,
            endColor: UIColor.purple
        )
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension GradientViewController {
    enum Constant {
        static let leadingOffset: CGFloat = 100
        static let sideSize: CGFloat = 100
    }
    
    func setupUI() {
        view.backgroundColor = .white
        setupGradientView()
    }
    
    func setupGradientView() {
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.leadingOffset
            ),
            gradientView.heightAnchor.constraint(equalToConstant: Constant.sideSize),
            gradientView.widthAnchor.constraint(equalTo: gradientView.heightAnchor)
        ])
    }
}

