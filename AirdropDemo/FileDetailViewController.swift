//
//  FileDetailViewController.swift
//  AirdropDemo
//
//  Created by Simon Ng on 28/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class FileDetailViewController: UIViewController {
    
    @IBOutlet weak var webView:UIWebView!

    var filename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the full path of the file
        if let fileURL = fileToURL(filename) {
            let urlRequest = NSURLRequest(URL: fileURL)
            webView.loadRequest(urlRequest)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fileToURL(file: String) -> NSURL? {
        // Get the full path of the file
        let fileComponents = file.componentsSeparatedByString(".")
        
        if let filePath = NSBundle.mainBundle().pathForResource(fileComponents[0], ofType: fileComponents[1]) {
            return NSURL(fileURLWithPath: filePath)
        }
        
        return nil
    }
    
    @IBAction func share(sender: AnyObject) {
        if let fileURL = fileToURL(filename) {
            let objectsToShare = [fileURL]
            let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            let excludedActivities = [UIActivityTypePostToFlickr, UIActivityTypePostToWeibo, UIActivityTypeMessage, UIActivityTypeMail, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo]
            
            activityController.excludedActivityTypes = excludedActivities
            presentViewController(activityController, animated: true, completion: nil)
        }
    }
    
    

}
