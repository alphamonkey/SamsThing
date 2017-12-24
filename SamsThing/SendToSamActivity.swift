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
    
    // This is force-unwrapped on purpose, because we can count on Safari to pass a valid URL.
    var url:URL?
    
    override class var activityCategory:UIActivityCategory {
        // Determines whether the icon appears in top or bottom row.  Valid choices are .share and .action
        return .share
    }
    
    override var activityViewController: UIViewController? {
        // Create and populate mail compose view controller.
        let msg = MFMailComposeViewController()
        msg.setToRecipients(["srking@gmail.com"])
        msg.setSubject("Message to sam")
        
        if let url = url {
            msg.setMessageBody(url.absoluteString, isHTML: true)
        }
        
        return msg
    }
    
    override var activityTitle: String? {
        // This is the label for the activity
        return "Send To Sam"
    }
    
    override var activityImage: UIImage? {
        // Put an image here
        return nil
    }
    


    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {

        // Make sure that the item we've received is actually a URL, if so, save it.
        
        if let url = activityItems.first as? URL {
            self.url = url
            return true
        }
            
        else {
            return false
        }
        
    }
    

}
