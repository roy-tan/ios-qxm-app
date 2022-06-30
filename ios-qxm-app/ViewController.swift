//
//  ViewController.swift
//  ios-qxm-app
//
//  Created by Roy Tan on 15/06/2022.
//

import StoreKit
import Qualtrics
import OSLog
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [[.alert, .sound, .badge]], completionHandler: { (granted, error) in
            // Handle Error
        })
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let _ = Qualtrics.shared.handleLocalNotification(response: response, displayOn: self)
        completionHandler()
    }
    
    @IBAction func buttonEmbedFeedback(_ sender:UIButton)
    {
        let interceptID = "SI_2lAUQ2hOB30opaS";
        Qualtrics.shared.evaluateIntercept(for: interceptID, completion: { (targetingResult) in
                if targetingResult.passed() {
                    let displayed = Qualtrics.shared.displayIntercept(for: interceptID, viewController: self)
                }
        })
        
    }
    
    @IBAction func buttonPromptFeedback(_ sender:UIButton)
    {
        let interceptID = "SI_eFeJWgP0xaS5SNU";
        Qualtrics.shared.properties.setString(string: "1", for: "action");
        Qualtrics.shared.evaluateIntercept(for: interceptID, completion: { (targetingResult) in
                if targetingResult.passed() {
                    let displayed = Qualtrics.shared.displayIntercept(for: interceptID, viewController: self)
                }
        })
        
    }

    @IBAction func buttonNotifyFeedback(_ sender:UIButton)
    {
        let interceptID = "SI_eFeJWgP0xaS5SNU";
        Qualtrics.shared.properties.setString(string: "2", for: "action");        
        Qualtrics.shared.evaluateIntercept(for: interceptID, completion: { (targetingResult) in
                if targetingResult.passed() {
                    let displayed = Qualtrics.shared.displayIntercept(for: interceptID, viewController: self)
                }
        })
    }

}
