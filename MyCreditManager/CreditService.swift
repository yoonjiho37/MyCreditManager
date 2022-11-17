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
        case "3":
            insertGrade()
        default: break
        }
    }
    
    static private func addStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        

        if students.filter({ $0.name == studentInput })[safe: 0] == nil {
            let student = CreditModel(name: studentInput, credit: [])
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
    
    static private func insertGrade() {
        let input = readLine()?.components(separatedBy: " ")
        
        let input1Name = String(input?[safe:0] ?? "1x")
        let input2Subject = String(input?[safe:1] ?? "2x")
        let input3Grade = String(input?[safe:2] ?? "3x")
        
        
        guard input1Name != "1x" && input2Subject != "2x" && input3Grade != "3x" else {
            print("입력이 잘못되었습니다. 다시확인해주세요")
            return
        }
        
        let grade = CreditModel.Credit(subject: input2Subject, score: input3Grade)
        
        if students.map({$0.name == input1Name})[safe:0] != nil {
            guard let findIndex = students.firstIndex(where: {$0.name == input1Name}) else {
                return  }
            
            let student = students[findIndex]
            
            
            if student.credit.filter({$0?.subject == input2Subject})[safe: 0] != nil {
                let findIndex2 = student.credit.firstIndex(where: {$0?.subject == input2Subject})
                
                students[findIndex].credit[findIndex2 ?? 0] = grade
            } else {
                students[findIndex].credit.append(grade)
            }
            print("\(input1Name) 학생의 \(input2Subject) 과목성적이 \(input3Grade) 로 추가(변경) 되었습니다.")
            
        }else {
            print("해당학생은 존재하지 않습니다.")
        }
    }
    
    
}
