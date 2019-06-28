//
//  FlowGridImage.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct FlowGridImage : View {
    var body: some View {
        FlowStack(direction: .vertical, numPerRow: 4, numOfItems: 50, alignment: .leading, showIndicator: true) { (index, width) in
            NetImageView(url:"https://cataas.com/cat/cute")
                .padding(5)
                .frame(width: width, height: width)
                .aspectRatio(contentMode: ContentMode.fit)
        }
    }
}

#if DEBUG
struct FlowGridImage_Previews : PreviewProvider {
    static var previews: some View {
        FlowGridImage()
    }
}
#endif
