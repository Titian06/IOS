//
//  ViewController.swift
//  AppEventCount act9
//
//  Created by Alumno on 13/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DidenterBackroundLabel1: UILabel!
    @IBOutlet weak var WillenterForegroundLabel1: UILabel!
    @IBOutlet weak var WillresignActiveLabel: UILabel!
    @IBOutlet weak var DidBecomeActiveLabel: UILabel!
    @IBOutlet weak var willConnectToLabel: UILabel!
    @IBOutlet weak var configurationForConnectiongLabel: UILabel!
    @IBOutlet weak var didfinishLaunchingLabel: UILabel!
    
    var DidenterBackroundCount = 0
    var WillenterForegroundCount = 0
    var WillresignActiveCount = 0
    var DidBecomeActiveCount = 0
    var willConnectToCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    func updateView( ){
        didfinishLaunchingLabel.text = "The app has launched\(appDelegate.launchCount) times"
        configurationForConnectiongLabel.text = "The app has conected\(appDelegate) times"
        willConnectToLabel.text = "The scene will connect\(willConnectToCount) times"
        DidBecomeActiveLabel.text = "The scene did become active\(DidBecomeActiveCount) times"
        WillresignActiveLabel.text = "the scene will resign active\(WillresignActiveCount) times"
        WillenterForegroundLabel1.text = "The scene will enter foreground\(WillenterForegroundCount) times"
        DidenterBackroundLabel1.text = "the scene did enter Background\(DidenterBackroundCount) times"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

