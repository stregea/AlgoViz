//
//  MazeCell.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import SwiftUI

struct MazeCell: View {
    var cell: Cell
    
    var body: some View {
        let color: Color = (cell.type == .Start) ? Color.blue : (cell.type == .Goal) ? Color.green : (cell.type == .Path) ? Color.red : (cell.type == .Empty) ? Color.white : Color.black
        
        VStack{
            Rectangle()
                .fill(color)
                .frame(width: 20, height: 20)
//                .cornerRadius(15) // add corner radius to path only
        }
    }
}

struct MazeCell_Previews: PreviewProvider {
    static var previews: some View {
        let cell = Cell(type: .Start, coordinates: Coordinates(x: -1, y: -1))
        
        MazeCell(cell: cell)
    }
}
