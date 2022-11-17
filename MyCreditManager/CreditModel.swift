//
//  StudentModel.swift
//  MyCreditManager
//
//  Created by 윤지호 on 2022/11/16.
//

import Foundation

struct CreditModel {
    let name: String
    var credit : [Credit?]
    
    struct Credit {
        var subject : String
        var grade : Double
    }
}
