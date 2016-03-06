//
//  ZTBaseViewController.swift
//  ZTTaxi
//
//  Created by zt on 16/3/5.
//  Copyright © 2016年 zt. All rights reserved.
//

import UIKit

class ZTBaseViewController: UIViewController {

    var activity:ZTActivity?

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    private func showActivityInView(view:UIView) ->ZTActivity
    {
        let activity = ZTActivityIndicator(view: view)
        
        activity.frame = view.bounds
        view.addSubview(activity)
        activity.labelText = ""
        
        return activity
    }
    
    func showIndicator(tipMessage:String?,
        autoHide:Bool, afterDelay:Bool)
    {
        if activity == nil {
            activity = showActivityInView(self.view)
        }
        
        if tipMessage != nil {
            activity?.labelText = tipMessage
            activity?.show(false)
        }
        
        if autoHide && activity?.alpha>=1.0 {
            if afterDelay {
                activity?.hide(true, afterDelay: 1.0)
            }
            else {
                activity?.hide(true)
            }
        }
    }
    
    func hideIndicator()
    {
        activity?.hide(true)
    }
}
