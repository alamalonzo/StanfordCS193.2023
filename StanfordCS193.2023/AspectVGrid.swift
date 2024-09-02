//
//  AspectVGrid.swift
//  StanfordCS193.2023
//
//  Created by Alam Alonzo on 31/8/24.
//How to create with @ViewBuilder

import SwiftUI

struct AspectVGrid<Item, ItemView: View>: View where Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    @ViewBuilder var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View{
        GeometryReader { geometry in
        let gritItemSize = gridItemWidthThatFits(
            count: items.count,
            size: geometry.size,
            atAspectRatio: aspectRatio)
        //With Adaptative Minimum a set the width to be fix
        let grid = [GridItem(.adaptive(minimum: 95), spacing: 0)]
        
        LazyVGrid(columns: grid, spacing: 0){
            ForEach(items)  { item in
                content(item)
                    .aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
}
//calculate the size of the card
func gridItemWidthThatFits(
    count: Int,
    size: CGSize,
    atAspectRatio aspectRatio: CGFloat
) -> CGFloat {
    let count = CGFloat(count)
    var columnCount = 1.0
    repeat {
        let width = size.width / columnCount
        let height = width / aspectRatio
        
        let rowCount = (count / columnCount).rounded(.up)
        if rowCount * height < size.height {
            return (size.width / columnCount).rounded(.down)
        }
        columnCount += 1
    } while columnCount < count
    return min(size.width / count, size.height * aspectRatio).rounded(.down)
}
}

//#Preview {
//    AspectVGrid()
//}
