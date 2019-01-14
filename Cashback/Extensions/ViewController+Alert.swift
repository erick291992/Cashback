//
//  ViewController+Alert.swift
//  Cashback
//
//  Created by Erick Manrique on 1/13/19.
//  Copyright © 2019 homeapps. All rights reserved.
//

import Foundation
import UIKit

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

protocol SingleButtonDialogPresenter {
    func presentSingleButtonDialog(alert: SingleButtonAlert)
}

extension SingleButtonDialogPresenter where Self: UIViewController {
    func presentSingleButtonDialog(alert: SingleButtonAlert) {
        let alertController = UIAlertController(title: alert.title,
                                                message: alert.message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alert.action.buttonTitle,
                                                style: .default,
                                                handler: { _ in alert.action.handler?() }))
        self.present(alertController, animated: true, completion: nil)
    }
}

protocol AlertGenerator {
    func generataAlert(alertTitle: String, statusCodeMessage: String) -> SingleButtonAlert
}

extension AlertGenerator {
    
    func generataAlert(alertTitle: String, statusCodeMessage: String) -> SingleButtonAlert{
        let alert = SingleButtonAlert(
            title: alertTitle,
            message: statusCodeMessage,
            action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
        )
        
        return alert
    }
    
}
