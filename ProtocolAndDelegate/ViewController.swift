//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by nuclei on 14/10/25.
//

import UIKit

class ViewController: UIViewController, ProductChangeDelegate {
    /* Protocol delegate:
     5. Confirm the reviecer to the protocol.
     6. Implement the function and its defination.
     7. Connect delegate -> let bottomSheet = BottomSliderViewController() - bottomSheet.delegate = self (Meaning: Waiter, I (Cook) am your delegate).
     */
    
    /* Notication centre:
     4. Add the observer.
     5. Create the handler function - @objc func: because NotificationCenter uses the Objective-C runtime selector system.
     6. *Remove the observer on deinit.
     */
    private let imageView = UIImageView()
    private let imageTitle = UILabel()
    private let ctaButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti(_:)), name: .productChange, object: nil)
    }
    
    @objc func handleNoti(_ notification: Notification) {
        if let info = notification.userInfo,
           let name = info["name"] as? String,
           let image = info["photo"] as? String {
            imageView.image = UIImage(named: image)
            imageTitle.text = name
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func changeProductInfo(name: String, image: String) {
        imageView.image = UIImage(named: image)
        imageTitle.text = name
    }
    
    @objc private func pushBottomSheet() {
        let bottomSheet = BottomSliderViewController()
        bottomSheet.delegate = self
        bottomSheet.modalPresentationStyle = .pageSheet
        bottomSheet.sheetPresentationController?.detents = [.medium()]
        bottomSheet.sheetPresentationController?.prefersGrabberVisible = true
        present(bottomSheet, animated: true)
    }
    
    private func configure() {
        view.addSubview(imageView)
        view.addSubview(imageTitle)
        view.addSubview(ctaButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "all")
        imageTitle.text = "All products"
        imageTitle.textColor = .white
        ctaButton.configuration = .tinted()
        ctaButton.configuration?.title = "Choose product"
        ctaButton.addTarget(self, action: #selector(pushBottomSheet), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            
            imageTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            imageTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            imageTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            
            ctaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            ctaButton.heightAnchor.constraint(equalToConstant: 60),
            ctaButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }

}

