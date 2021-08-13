//
//  MazeCell.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import SwiftUI

struct MazeCell: View {
    var color: Color
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(color)
                .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct MazeCell_Previews: PreviewProvider {
    static var previews: some View {
        let cell = Cell(type: .Start, coordinates: Coordinates(x: -1, y: -1))
        
        let color: Color = (cell.type == .Start) ? Color.blue : (cell.type == .Goal) ? Color.green : (cell.type == .Path) ? Color.red : Color.black
        MazeCell(color: color)
    }
}
