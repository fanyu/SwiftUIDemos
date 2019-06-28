//
//  GridView.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/27.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

enum FlowStackScrollDirection {
    case vertical
    case horizontal
}

struct FlowStack<Content> : View where Content: View {
    /// 滚动方向
    var direction: FlowStackScrollDirection = .vertical
    /// 每行显示 item 数量
    var numPerRow: Int = 0
    /// item 总数
    var numOfItems: Int = 0
    /// 垂直滚动时候，水平布局方式
    var alignment: HorizontalAlignment = .leading
    /// 是否显示指示器
    var showIndicator: Bool = true
    /// 是否bounce
    var alwaysBounce: Bool = true
    /// 是否滚动
    var isScrollEnabled: Bool = true
    /// 返回 item index 和 width(垂直滚动) or height(水平滚动)
    let content: (_ index: Int, _ itemSize: CGFloat) -> Content
    

    private var alwaysBounceHorizontal: Bool {
        return direction == .vertical ? false : alwaysBounce
    }
    private var alwaysBounceVertical: Bool {
        return direction == .vertical ? alwaysBounce : false
    }
    private var showsHorizontalIndicator: Bool {
        return direction == .vertical ? false : showIndicator
    }
    private var showsVerticalIndicator: Bool {
        return direction == .vertical ? showIndicator : false
    }
    
    var body: some View {
        // 通过 GeometryReader 读取当前 size
        GeometryReader { geometry in
            ScrollView(isScrollEnabled: self.isScrollEnabled,
                       alwaysBounceHorizontal: self.alwaysBounceHorizontal,
                       alwaysBounceVertical: self.alwaysBounceVertical,
                       showsHorizontalIndicator: self.showsHorizontalIndicator,
                       showsVerticalIndicator: self.showsVerticalIndicator) {
                        
                if self.direction == .horizontal {
                    HStack(spacing: 0) {
                        ForEach(0 ..< self.numOfItems) { index in
                            self.content(index, geometry.size.height)
                                .frame(height: geometry.size.height)
                        }
                    }
                } else {
                    VStack(alignment: self.alignment, spacing: 0) {
                        // 每行item
                        ForEach(0 ..< (self.numOfItems / self.numPerRow)) { row in
                            HStack(spacing: 0) {
                                ForEach(0 ..< self.numPerRow) { column in
                                    self.content(
                                        (row * self.numPerRow) + column,
                                        (geometry.size.width / CGFloat(self.numPerRow))
                                    )
                                    .frame(width: geometry.size.width / CGFloat(self.numPerRow))
                                }
                            }
                        }
                        // 最后一行
                        HStack(spacing: 0) {
                            ForEach(0 ..< (self.numOfItems % self.numPerRow)) { column in
                                self.content(
                                    ((self.numOfItems / self.numPerRow) * self.numPerRow) + column,
                                    (geometry.size.width / CGFloat(self.numPerRow))
                                )
                                .frame(width: geometry.size.width / CGFloat(self.numPerRow))
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct GridView_Previews : PreviewProvider {
    static var previews: some View {
        
        Group {
            FlowStack(direction: .vertical,
                      numPerRow: 3,
                      numOfItems: 85,
                      showIndicator: false)
            { index, width in
                Text(" \(index) ")
                    .frame(width: width, height: 50)
            }
            
            
            FlowStack(direction: .horizontal,
                      numPerRow: 1,
                      numOfItems: 30,
                      showIndicator: true)
            { index, height in
                Text(" \(index) ")
                    .frame(width: 50, height: height - 10)
                    .background(Color.green)
                    .padding(.leading, 4)
                    .padding(.trailing, 4)
            }
            .frame(height: 100)
            .background(Color.red)
        }
    }
}
#endif
