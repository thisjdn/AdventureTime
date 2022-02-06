//
//  ViewController.swift
//  AdventureTime
//
//  Created by Jaden Hong on 2022-02-01.
//

import UIKit

class ViewController: UIViewController, AdventureManagerDelegate {
    
    var textView = UITextView()
    var button = UIButton()
    
    var adventureManager = AdventureManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adventureManager.delegate = self
        
        setView()
    }
    
    func didUpdateDisplay(_ activity: String) {
        DispatchQueue.main.async {
            self.textView.text =  activity

        }
    }
    
    func setView() {
        setTitle()
        setConstraints()
        
        view.backgroundColor = .systemMint
    }
            
    func setConstraints() {
        setTextViewConstraints()
        setButtonConstraints()
    }
    
    func setTitle() {
        let image = UIImage(imageLiteralResourceName: "adventureTimeLogo")
        let width = navigationController!.navigationBar.frame.size.width
        let height = navigationController!.navigationBar.frame.size.height
        let x = width/2 - (image.size.width)/2
        let y = height/2 - (image.size.height)/2
        
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }

    func setTextViewConstraints() {
        let margin = view.layoutMarginsGuide
        textView.backgroundColor = .lightText
        textView.layer.cornerRadius = CGFloat(10)
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: textView.widthAnchor, multiplier: 1).isActive = true
        textView.centerYAnchor.constraint(equalTo: margin.centerYAnchor, constant: -100).isActive = true
        textView.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        textView.isEditable = false
        
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 30)
    }
    
    func setButtonConstraints() {
        let margin = view.layoutMarginsGuide
        button.setTitle("GO!", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = CGFloat(10)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false

        button.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.3).isActive = true
        button.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        adventureManager.performRequest()
    }
    
     
    

}

