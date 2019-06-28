//
//  FlowGridImageText.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct FlowGridImageText : View {
    var body: some View {
        FlowStack(direction: .vertical, numPerRow: 3, numOfItems: 50, alignment: .leading, showIndicator: true) { (index, width) in
            VStack {
                NetImageView(url:"https://cataas.com/cat/cute")
                    .padding(5)
                    .frame(width: width, height: width)
                    .aspectRatio(contentMode: ContentMode.fit)
                
                Text("\(index)")
            }
            .padding()
            .frame(width: width)
            .border(Color.gray, width: 1)
            .background(Color.white)
        }
    }
}

#if DEBUG
struct FlowGridImageText_Previews : PreviewProvider {
    static var previews: some View {
        FlowGridImageText()
    }
}
#endif
