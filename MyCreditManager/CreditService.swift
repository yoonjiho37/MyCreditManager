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
        case "2":
            removeStudent()
        default: break
        }
    }
    
    static private func addStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        

        if students.filter({ $0.name == studentInput })[safe: 0] == nil {
            let student = CreditModel(name: studentInput,credit: nil)
            students.append(student)
            print("\(studentInput) 학생을 추가했습니다.")
        } else {
            print("\(studentInput)은 이미 있는 학생입니다. 추가하지 않습니다.")
        }
    }

    
    static private func removeStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        
        if students.filter({ $0.name == studentInput})[safe: 0] != nil {
            guard let removeIndex = students.firstIndex(where: {$0.name == studentInput}) else { return }
            students.remove(at: removeIndex)
            print("\(studentInput) 학생을 삭제하였습니다.")
        } else {
            print("\(studentInput) 삭제할 학생의 이름을 찾지 못했습니다.")
        }
    }
    
    
}
