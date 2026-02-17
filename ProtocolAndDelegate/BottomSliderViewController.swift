//
//  BottomSliderViewController.swift
//  ProtocolAndDelegate
//
//  Created by nuclei on 14/10/25.
//

import UIKit

protocol ProductChangeDelegate {
    func changeProductInfo(name: String, image: String)
}
/* Protocol delegate:
   1. in observer/sender/waiter controller - define protocol.
   2. in observer/sender/waiter controller - define a var that confirms to type protocol (The Contact Person). *Make optional to avoid crash.
   3. Call the Delegate (Tell the Cook): delegate?.changeProductInfo(name: "mac", image: "mac").
   4. Move to Receiver/cook controller.
   --- STEPS ON ViewController ---

 */

/* Notication centre:
    1. In sender controller, create the notification name.
    2. Inside the action function in sender controller, 'post' the notification.
    3. Move to Receiver/cook controller.
    --- STEPS ON ViewController ---
 
 */

extension Notification.Name {
    static let productChange = Notification.Name("productChange")
}

class BottomSliderViewController: UIViewController {

    let iphoneButton = UIButton()
    let macButton = UIButton()
    
    var delegate: ProductChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        configure()
    }
    
    @objc private func iphoneButtonClicked() {
//        delegate?.changeProductInfo(name: "iphone", image: "iphone")
        NotificationCenter.default.post(name: .productChange, object: nil, userInfo: ["name":"iphone", "photo":"iphone"])
    }
    
    @objc private func macButtonClicked() {
        delegate?.changeProductInfo(name: "mac", image: "mac")
    }
    
    private func configure() {
        view.addSubview(iphoneButton)
        view.addSubview(macButton)
        
        iphoneButton.translatesAutoresizingMaskIntoConstraints = false
        macButton.translatesAutoresizingMaskIntoConstraints = false
        
        iphoneButton.configuration = .tinted()
        iphoneButton.configuration?.title = "iphone"
        iphoneButton.addTarget(self, action: #selector(iphoneButtonClicked), for: .touchUpInside)
        
        macButton.configuration = .tinted()
        macButton.configuration?.title = "mac"
        macButton.addTarget(self, action: #selector(macButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            iphoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iphoneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iphoneButton.heightAnchor.constraint(equalToConstant: 30),
            iphoneButton.widthAnchor.constraint(equalToConstant: 300),
            
            macButton.topAnchor.constraint(equalTo: iphoneButton.bottomAnchor, constant: 20),
            macButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macButton.heightAnchor.constraint(equalToConstant: 30),
            macButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}
