//
//  FlowIconText.swift
//  SwiftUIHub
//
//  Created by Yu Fan on 2019/6/28.
//  Copyright © 2019 Yu Fan. All rights reserved.
//

import SwiftUI

struct FlowIconText : View {
    
    private let items: [(title: String, icon: String)] = [
        (title: "Circle", icon: "circle.fill"),
        (title: "Sun", icon: "sun.haze.fill"),
        (title: "Moon", icon: "moon.fill"),
        (title: "Star", icon: "sparkles"),
        (title: "Cloud", icon: "cloud.fill"),
        (title: "Rain", icon: "cloud.sun.rain.fill"),
        (title: "Circle", icon: "circle.fill"),
        (title: "Sun", icon: "sun.haze.fill"),
        (title: "Moon", icon: "moon.fill"),
        (title: "Star", icon: "sparkles"),
        (title: "Cloud", icon: "cloud.fill"),
        (title: "Rain", icon: "cloud.sun.rain.fill"),
        (title: "Circle", icon: "circle.fill"),
        (title: "Sun", icon: "sun.haze.fill"),
        (title: "Moon", icon: "moon.fill"),
        (title: "Star", icon: "sparkles"),
        (title: "Cloud", icon: "cloud.fill"),
        (title: "Rain", icon: "cloud.sun.rain.fill"),
        (title: "Circle", icon: "circle.fill"),
        (title: "Sun", icon: "sun.haze.fill"),
        (title: "Moon", icon: "moon.fill"),
        (title: "Star", icon: "sparkles"),
        (title: "Cloud", icon: "cloud.fill"),
        (title: "Rain", icon: "cloud.sun.rain.fill"),
        (title: "Rain", icon: "cloud.sun.rain.fill")
    ]
    
    var body: some View {
        FlowStack(direction: .vertical, numPerRow: 4, numOfItems: items.count, alignment: .leading, showIndicator: false) { (index, width) in
            VStack {
                Image(systemName: self.items[index].icon)
                Text(self.items[index].title)
            }
            .frame(height: 80)
        }
    }
}

#if DEBUG
struct FlowIconText_Previews : PreviewProvider {
    static var previews: some View {
        FlowIconText()
    }
}
#endif
