//
//  PageControl.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import SwiftUI

struct PageControl: View {
    @Binding var currentPage: Int
    let numberOfPages: Int
    let shouldHaveBigCurrentPageIndicator: Bool
    let unselectedColor: Color
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? Color.primary : unselectedColor)
                    .frame(width: (index == currentPage && shouldHaveBigCurrentPageIndicator) ? 60 : 8, height: 8)
                    .animation(.default, value: currentPage)
            }
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(currentPage: .constant(0),
                    numberOfPages: 3,
                    shouldHaveBigCurrentPageIndicator: true,
                    unselectedColor: Color.gray)
    }
}
