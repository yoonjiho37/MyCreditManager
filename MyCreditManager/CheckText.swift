//
//  Error.swift
//  MyCreditManager
//
//  Created by 윤지호 on 2022/11/21.
//

import Foundation

//enum InputError : Error {
//    case inputedCurrentKROrSpace(KR:String)
//}
//
//
//
//func testError(_ text: String, checkFor:String) throws {
//    do {
//        try checkInputError(text: text, checkFor: checkFor)
//    }catch InputError.inputedCurrentKROrSpace(KR: text) {
//        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
//    }
//}
//
//func checkInputError(text : String, checkFor:String) throws {
//    guard checkText(text: text, checkFor: checkFor) else {
//        throw InputError.inputedCurrentKROrSpace(KR: text)
//    }
//}

func filterText(text: String?, filter: String) -> Bool {
    guard let text = text else {
        return false
    }
    let arr = Array(text)
    
    var parrern = "^[0-9]$"
    
    switch filter {
    case "KR":
        parrern = "^[a-zA-Z0-9\\s]$"
    case "KR/space":
        parrern = "^[a-zA-Z0-9]$"
    default:
        parrern = "^[a-zA-Z0-9]$"
    }


    if let regex = try? NSRegularExpression(pattern: parrern, options: .caseInsensitive) {
        var index = 0
        while index < arr.count {
            let results = regex.matches(in: String(arr[index]), options: [], range: NSRange(location: 0, length: 1))
            if results.count == 0 {
                return false
            }else {
                index += 1
            }
        }
    }
    return true               
}
