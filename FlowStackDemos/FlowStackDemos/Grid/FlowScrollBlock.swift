//
//  FlowScrollBlock.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct FlowScrollBlock : View {
    var body: some View {
        FlowStack(direction: .horizontal, numOfItems: 30, showIndicator: false) { (index, height) in
            VStack {
                FlowBlockItem()
                Text("\(index)")
            }
            .frame(width: 100, height: height - 20)
            .background(Color.green)
            .padding(.leading, 5)
            .padding(.trailing, 5)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
}

#if DEBUG
struct FlowScrollBlock_Previews : PreviewProvider {
    static var previews: some View {
        FlowScrollBlock()
            .frame(height: 140)
    }
}
#endif
