//
//  ContentView.swift
//  CalculatorCloneSwiftUI
//
//  Created by 심현석 on 2023/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var displayNumber: Int = 0
    @State var tempNumber: Int = 0
    @State var operatorType: ButtonType = .clear
    @State var isEditing: Bool = false
    
    var buttonData: [[ButtonType]] = [
        [.clear, .plusMinus, .percent, .devide],
        [.seventh, .eighth, .nineth, .multiple],
        [.forth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(String(displayNumber))
                    .padding()
                    .font(.system(size: 73))
                    .foregroundColor(.white)
            }
            ForEach(buttonData, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button {
                            handleButton(item: item)
                        } label: {
                            Text(item.displayName)
                                .frame(width: calculateButtonWidth(button: item), height: calculateButtonHeight(button: item))
                                .background(item.backgroundColor)
                                .foregroundColor(item.foregroundColor)
                                .cornerRadius(40)
                                .font(.system(size: 33))
                        }
                    }
                }
            }
        }
        .background(.black)
    }
    
    func handleButton(item: ButtonType) {
        if isEditing == false {
            if item == .clear {
                displayNumber = 0
                tempNumber = 0
            } else {
                displayNumber = Int(item.displayName) ?? 0
                isEditing = true
            }
        } else {
            if item == .clear {
                displayNumber = 0
                tempNumber = 0
                isEditing = false
            } else if item == .plusMinus {
                displayNumber *= -1
            } else if item == .percent {
                displayNumber /= 100
            } else if item == .plus {
                operatorType = .plus
                tempNumber = displayNumber
                isEditing = false
            } else if item == .minus {
                operatorType = .minus
                tempNumber = displayNumber
                isEditing = false
            } else if item == .multiple {
                operatorType = .multiple
                tempNumber = displayNumber
                isEditing = false
            } else if item == .devide {
                operatorType = .devide
                tempNumber = displayNumber
                isEditing = false
            } else if item == .equal {
                if operatorType == .plus {
                    displayNumber = (tempNumber + displayNumber)
                } else if operatorType == .minus {
                    displayNumber = (tempNumber - displayNumber)
                } else if operatorType == .multiple {
                    displayNumber = (tempNumber * displayNumber)
                } else if operatorType == .devide {
                    if displayNumber == 0 {
                        // 에러 방지
                        displayNumber = 0
                    } else {
                        displayNumber = tempNumber / displayNumber
                    }
                }
            } else {
                displayNumber += Int(item.displayName) ?? 0
            }
        }
    }
    
    func calculateButtonWidth(button: ButtonType) -> CGFloat {
        switch button {
        case .zero:
            return ((UIScreen.main.bounds.width - 5 * 10) / 4) * 2
        default:
            return (UIScreen.main.bounds.width - 5 * 10) / 4
        }
    }
    
    func calculateButtonHeight(button: ButtonType) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 10) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
