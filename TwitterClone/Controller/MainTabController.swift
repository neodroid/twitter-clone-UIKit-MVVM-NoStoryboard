//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Kevin ahmad on 21/05/22.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        
        button.addTarget(MainTabController.self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()
        
        
    }
    // MARK: - API
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            print("NO USER")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle  = .fullScreen
                self.present(nav, animated: true,completion: nil)
            }
        }else {
            print("USER")
            configureViewControllers()
            configureUI()
        }
    }
    
    func logUserOut(){
        do{
            try Auth.auth().signOut()
        }catch let error {
            print(error)
        }
    }
    
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
    //MARK: - Helpers
    func configureUI(){
        view.addSubview(actionButton)
        
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }
    
    
    func configureViewControllers() {
        
        let feed = FeedController()
        let nav1 = tempalteNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)

        let explore = ExploreController()
        let nav2 = tempalteNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)

        let notifications = NotificationsController()
        let nav3 = tempalteNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)

        let conversations = ConversationsController()
        let nav4 = tempalteNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        


        viewControllers = [nav1,nav2,nav3,nav4]
    }
    
    func tempalteNavigationController(image: UIImage?, rootViewController: UIViewController) ->
        UINavigationController{
        
            let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = image
            nav.navigationBar.barTintColor = .white
            return nav
    }
 
}
