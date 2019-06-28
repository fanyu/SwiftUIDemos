//
//  GridFlowList.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct GridItem<T> where T: View {
    var title: String
    var destination: T
}

struct FlowList : View {
    
    private var itemsTitle = ["Icon Text", "Grid Image", "Grid Image Text", "Grid Block", "HScroll Block"]

    var body: some View {
        FlowStack(direction: .vertical,
                  numPerRow: 1,
                  numOfItems: itemsTitle.count,
                  alignment: .leading,
                  showIndicator: true)
        { index, width in
            PresentationButton(destination: FlowIconText()) {
                HStack {
                    Text(self.itemsTitle[index])
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding(.leading, 20)
                    Spacer()
                    }
                    .frame(height: 50)
                    .border(Color.secondary, width: 1, cornerRadius: 10)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
                )
            }
        }
        .navigationBarTitle(Text("GridFlows"))
    }
}


#if DEBUG
struct FlowList_Previews : PreviewProvider {
    static var previews: some View {
        FlowList()
    }
}
#endif
