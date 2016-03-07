//
//  ZTCreateAccountPage.swift
//  ZTTaxi
//
//  Created by zt on 16/3/7.
//  Copyright © 2016年 zt. All rights reserved.
//

import UIKit

class ZTCreateAccountPage: ZTBasePage {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建账户"
        
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
    }
    
    override func doRight()
    {
        let page = ZTUserInfoPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    
}
