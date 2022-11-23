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
        case "4":
            removeCredit()
        case "5":
            showAverageGrade()
        default: break
        }
    }
    
    //학생추가
    static private func addStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        guard filterText(text: studentInput, filter: "KR/space") else {
            print("입력이 잘못되였습니다. 확인해주세요.")
            return
        }

        if students.filter({ $0.name == studentInput })[safe: 0] == nil {
            let student = CreditModel(name: studentInput, credit: [])
            students.append(student)
            print("\(studentInput) 학생을 추가했습니다.")
        } else {
            print("\(studentInput)은 이미 있는 학생입니다. 추가하지 않습니다.")
        }
    }

    //학생삭제
    static private func removeStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        print("filter => \(filterText(text: studentInput, filter: "KR/space"))")
        guard filterText(text: studentInput, filter: "KR/space") else {
            print("입력이 잘못되였습니다. 확인해주세요.")
            return
        }
        
        if students.filter({ $0.name == studentInput})[safe: 0] != nil {
            guard let removeIndex = students.firstIndex(where: {$0.name == studentInput}) else { return }
            students.remove(at: removeIndex)
            print("\(studentInput) 학생을 삭제하였습니다.")
        } else {
            print("\(studentInput) 삭제할 학생의 이름을 찾지 못했습니다.")
        }
    }
    
    //성적추가(변경)
    static private func insertGrade() {
        let input = readLine()
        let inputString = String(input ?? "")
        guard filterText(text: input, filter: "KR") else {
            print("입력이 잘못되였습니다. 확인해주세요.")
            return
        }
        let componetInput = input?.components(separatedBy: " ")
        let input1Name = String(componetInput?[safe:0] ?? "1x")
        let input2Subject = String(componetInput?[safe:1] ?? "2x")
        let input3Grade = String(componetInput?[safe:2] ?? "3x")
        
        
        
        guard input1Name != "1x" && input2Subject != "2x" && input3Grade != "3x" else {
            print("입력이 잘못되었습니다. 다시확인해주세요")
            return
        }
        
        let input3ToDouble = changeGradeToInt(input3Grade)
        guard input3ToDouble != -100 else {
            print("입력이 잘못되었습니다. 다시확인해주세요")
            return
        }
        
        let grade = CreditModel.Credit(subject: input2Subject, grade: input3ToDouble)
        
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
    
    
    //성적삭제
    static private func removeCredit() {
        let input = readLine()
        
        guard filterText(text: input, filter: "KR") else {
            print("입력이 잘못되였습니다. 확인해주세요.")
            return
        }
        let componetInput = input?.components(separatedBy: " ")
        let input1Name = String(componetInput?[safe:0] ?? "1x")
        let input2Subject = String(componetInput?[safe:1] ?? "2x")
        
        print("111 => \(input1Name)")
        print("222 => \(input2Subject)")
        
        guard input1Name != "1x" && input2Subject != "2x" else {
            print("입력이 잘못되었습니다. 다시확인해주세요")
            return
        }
        
        
        if students.filter({$0.name == input1Name})[safe: 0] != nil {
            guard let studentIndex = students.firstIndex(where: {$0.name == input1Name}) else { return }
            
            if students[studentIndex].credit.map({$0?.subject == input2Subject})[safe: 0] != nil {
                
                guard let creditIndex = students[studentIndex].credit.firstIndex(where: {$0?.subject == input2Subject}) else {
                    return
                }
                
                students[studentIndex].credit.remove(at: creditIndex)
                
                print("\(input1Name) 학생의 \(input2Subject) 성적을 삭제했습니다.")
                
            } else {
                print("\(input2Subject) 과목이 존재하지 않습니다. ")
            }
        }else {
            print("\(input1Name) 학생을 찾지 못했습니다.")

        }
    }
    
    //평점보기
    static private func showAverageGrade() {
        let input = readLine()
        let studentInput = String(input ?? "")
        guard filterText(text: studentInput, filter: "KR/space") else {
            print("입력이 잘못되였습니다. 확인해주세요.")
            return
        }
        

        if students.filter({ $0.name == studentInput })[safe: 0] != nil {
            guard let findIndex = students.firstIndex(where: {$0.name == studentInput}) else { return }
            
            if students[findIndex].credit.isEmpty {
                print("성적이 존재하지않습니다.")
            }else {
                let studentCredit = students[findIndex].credit
                var allGrade : Double = 0
                for i in studentCredit {
                    
                    
                    if let ii = i {
                        print("\(ii.subject): \(ii.grade)")
                        allGrade += ii.grade
                    }
                    
                    
                }
                print("평점: \(allGrade / Double(studentCredit.count))")
            }
        } else {
            print("\(studentInput) 학생을 찾지못했습니다.")
        }
    }
    
    
    
    static private func changeGradeToInt(_ grade:String) -> Double {
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4
        case "B+":
            return 3.5
        case "B":
            return 3
        case "C+":
            return 2.5
        case "C":
            return 2
        case "D+":
            return 1.5
        case "D":
            return 1
        case "F":
            return 0
        default:
            return -100
        }
    }
    
}
