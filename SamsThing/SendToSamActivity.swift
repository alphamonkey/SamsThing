//
//  SendToSamActivity.swift
//  SamsThing
//
//  Created by Josh Edson on 12/24/17.
//  Copyright © 2017 Josh Edson. All rights reserved.
//

import UIKit
import MessageUI

class SendToSamActivity: UIActivity {
    var items:[URL]? = []
    override class var activityCategory:UIActivityCategory {
        get {
            return .share
        }
    }
    override var activityViewController: UIViewController? {
        let msg = MFMailComposeViewController()
        msg.setToRecipients(["srking@gmail.com"])
        msg.setSubject("Message to sam")
        msg.setMessageBody(items!.first!.absoluteString, isHTML: true)
        return msg
    }
    
    override var activityTitle: String? {
        get {
            return "Send To Sam"
        }
    }
    override var activityImage: UIImage? {
        return nil
    }
    override func prepare(withActivityItems activityItems: [Any]) {
        self.items = [activityItems.first as! URL]
        
    }

    
    func validActivityItems(activityItems: [AnyObject]) -> [AnyObject] {
        return activityItems.filter {
            if let _ = $0 as? URL  {
                return true
            }
            
            return false
        }
    }

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return validActivityItems(activityItems: activityItems as [AnyObject]).count > 0
    }
    

}
