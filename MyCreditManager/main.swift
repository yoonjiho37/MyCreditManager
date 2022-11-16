//
//  main.swift
//  MyCreditManager
//
//  Created by 윤지호 on 2022/11/15.
//

import Foundation



main()
func main() {
    
    var endBoolean : Bool = true
    
    while endBoolean {
        
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성정추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        let input = readLine()
        let selectedNum : String = String(input!)
        
        switch selectedNum {
        case "1":
            print("추가할 학생의 이름을 입력해주세요.")
        case "2":
            print("삭제할 학생의 이름을 입력해주세요.")
        case "3":
            print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요 \n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 생신됩니다.")
        case "4":
            print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예 Mickey Swift")
        case "5":
            print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        case "X":
            print("프로그램을 종료합니다.")
            endBoolean = false
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
        CreditService.readLineService(selected: selectedNum)
    }
}
