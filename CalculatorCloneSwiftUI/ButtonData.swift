//
//  Data.swift
//  CalculatorCloneSwiftUI
//
//  Created by 심현석 on 2023/04/25.
//

import SwiftUI

enum ButtonType: String {
    case zero, first, second, third, forth, fifth, sixth, seventh, eighth, nineth
    case dot, equal, plus, minus, multiple, devide
    case percent, plusMinus, clear
    
    var displayName: String {
        switch self {
        case .zero: return "0"
        case .first: return "1"
        case .second: return "2"
        case .third: return "3"
        case .forth: return "4"
        case .fifth: return "5"
        case .sixth: return "6"
        case .seventh: return "7"
        case .eighth: return "8"
        case .nineth: return "9"
        case .dot: return ","
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiple: return "X"
        case .devide: return "÷"
        case .percent: return "%"
        case .plusMinus: return "+/-"
        case .clear: return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .first, .second, .third, .forth, .fifth, .sixth, .seventh, .eighth, .nineth, .dot:
            return Color("numberColor")
        case .equal, .plus, .minus, .multiple, .devide:
            return Color.orange
        case .percent, .plusMinus, .clear:
            return Color.gray
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .zero, .first, .second, .third, .forth, .fifth, .sixth, .seventh, .eighth, .nineth, .dot, .equal, .plus, .minus, .multiple, .devide:
            return Color.white
        case .percent, .plusMinus, .clear:
            return Color.black
        }
    }
}

struct Data {
    
}
