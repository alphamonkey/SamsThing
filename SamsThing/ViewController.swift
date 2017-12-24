//
//  ViewController.swift
//  SamsThing
//
//  Created by Josh Edson on 12/19/17.
//  Copyright © 2017 Josh Edson. All rights reserved.
//

import UIKit
import SafariServices
class ViewController: UIViewController {
    var safari:SFSafariViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let url = URL(string: "http://www.amazon.com") {
    
            safari = SFSafariViewController(url: url)
            safari.delegate = self
            present(safari, animated:false)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:SFSafariViewControllerDelegate {
    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {


        return [SendToSamActivity()]
    }

}
