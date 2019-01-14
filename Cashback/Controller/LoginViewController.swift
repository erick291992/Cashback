//
//  LoginViewController.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SingleButtonDialogPresenter {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    let viewModel:LoginViewControllerViewModel

    required init?(coder aDecoder: NSCoder) {
        self.viewModel = LoginViewControllerViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindViewModel()
        viewModel.checkAndRedirect()
    }
    
    @IBAction func loginUser(_ sender: UIButton) {
        
        //only implemented create user not login
        //to use app one must always create user at the start
        self.viewModel.createUser(with: nameTextField.text!, and: emailTextField.text!)
        
    }
    
    func bindViewModel() {
        viewModel.onSuccessFullLogin = { [unowned self] in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExploreViewController") as? ExploreViewController {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
        viewModel.onShowError = { [unowned self] alert in
            self.presentSingleButtonDialog(alert: alert)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
