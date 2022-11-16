//
//  CerditService.swift
//  MyCreditManager
//
//  Created by 윤지호 on 2022/11/16.
//

import Foundation

class CreditService {
    static var students : [CreditModel] = []
    
    
    static func readLineService(selected:String) {
        switch selected {
        case "1":
            addStudent()
        default: break
        }
    }
    
    static private func addStudent() {
        let input = readLine()
        let studentinput = String(input ?? "")
        

        if students.filter({ $0.name == studentinput })[safe: 0] == nil {
            let student = CreditModel(name: studentinput,credit: nil)
            students.append(student)
            print("\(studentinput) 학생을 추가했습니다.")
        } else {
            print("\(studentinput)은 이미 있는 학생입니다. 추가하지 않습니다.")
        }
        
        
    }
    
    
}
