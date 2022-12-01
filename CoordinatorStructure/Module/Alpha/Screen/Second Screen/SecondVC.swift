//
//  SecondVC.swift
//  CoordinatorStructure
//
//  Created by Ivan Martin on 01/12/2022.
//

import UIKit

class SecondVC: UIViewController, SecondView {
    var onButtonTapped: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = #fileID
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Run Beta Coordinator", for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        onButtonTapped?()
    }

}
