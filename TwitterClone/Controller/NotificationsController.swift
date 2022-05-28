//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by Kevin ahmad on 21/05/22.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray

        configureUI()

    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
        
    }
    
}
