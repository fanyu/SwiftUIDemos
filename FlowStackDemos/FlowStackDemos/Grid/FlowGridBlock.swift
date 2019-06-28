//
//  FlowGridBlock.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct FlowGridBlock : View {
    var body: some View {
        FlowStack(direction: .vertical, numPerRow: 2, numOfItems: 59, alignment: .leading, showIndicator: false) { (index, width) in
            FlowBlockItem()
                .padding()
                .frame(width: width, height: width)
        }
    }
}

struct FlowBlockItem : View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 50)
                .foregroundColor(.blue)
            
            VStack {
                Rectangle()
                    .foregroundColor(Color.pink)
                
                Rectangle()
                    .foregroundColor(Color.orange)
            }
        }
    }
}

#if DEBUG
struct FlowGridBlock_Previews : PreviewProvider {
    static var previews: some View {
        FlowGridBlock()
    }
}
#endif
