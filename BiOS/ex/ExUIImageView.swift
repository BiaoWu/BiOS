//
//  ExUIImageView.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func circle() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
