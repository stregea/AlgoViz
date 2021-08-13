//
//  Maze.swift
//  AlgoViz
//
//  Created by Samuel Tregea on 8/13/21.
//

import Foundation

/// Enum to represent the type of the cell that exists in a given location within the Maze.
enum CellType: Character {
    /// Case for when there is an empty cell (opening) within the maze.
    case Empty = "O"
    
    /// Case for when there is a wall within the maze.
    case Wall = "W"
    
    /// Case for the starting point within the maze.
    case Start = "S"
    
    /// Case for the end goal within the maze.
    case Goal = "G"
    
    /// Case for determining the best path within the maze.
    case Path = "P"
}

/// Struct to contain the information about where the cell will exist on the plane.
struct Coordinates: Hashable, Equatable {
    /// The 'x' position within the 2D plane.
    var x: Int
    
    /// The 'y' position within the 2D plane.
    var y: Int

    /// Determine if two Coordinates are equal.
    /// - Parameter lhs: The first Coordinate used for comparison.
    /// - Parameter rhs: The second Coordinate used for comparison.
    /// - Returns: True if the lhs parameter is the same coordinate as the rhs parameter.
    static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    /// The Coordinate's hash.
    /// - Parameter hasher: Object used to hash the Coordinate.
    func hash(into hasher: inout Hasher) {
        hasher.combine(x.hashValue ^ y.hashValue)
    }
}

/// Struct to contain information about a cell that will exist within a Maze.
struct Cell {
    /// The cell's type.
    var type: CellType
    
    /// The position where the cell exists.
    var coordinates: Coordinates
}

/// 2D array to represent a collection of Cell's.
//typealias Maze = [[Cell]]

struct Maze: CustomStringConvertible {
    var maze: [ [Cell] ]
    var start: Cell
    var goal: Cell
    
    var description: String { return mazeToString(maze: self.maze)}
}

/// Generate a random maze.
/// - Parameter rows: The number of rows to determine the height of the  maze.
/// - Parameter columns: The number of coumns to determine the width of the maze.
/// - Parameter sparcityOfWalls: Number used to determine the sparcity of the walls to be generated.
/// - Returns: A randomly generated maze instance.
func generateMaze(rows: Int, columns: Int, sparcityOfWalls: Double) -> Maze {
    // Set a random seed
    srand48(time(nil))
    
    // Variable to be used to create an empty cell within the maze.
    let cell: Cell = Cell(type: .Empty, coordinates: Coordinates(x: -1, y: -1))
    
    // Initialize an array of empty cells.
    let empyCells: [Cell] = [Cell](repeating: cell, count: columns)
    
    // Initialize a maze full of empty cell's.
    var maze: [ [Cell] ] = [ [Cell] ](repeating: empyCells, count: rows)
    
    // place walls within the maze.
    for row in 0..<rows {
        
        for column in 0..<columns {
            
            // determine if current point on plane is an edge.
            let isEdgePoint = ( row == 0 )
                           || ( row == rows - 1 )
                           || ( column == 0 )
                           || ( column == columns - 1 )

            // if an edge, automatically set to a wall.
            if isEdgePoint {
                maze[row][column] = Cell(
                                        type: .Wall,
                                        coordinates: Coordinates(
                                            x: row,
                                            y: column
                                        )
                                    )
            }
            else {
                if drand48() < sparcityOfWalls {
                    maze[row][column] = Cell(
                                            type: .Wall,
                                            coordinates: Coordinates(
                                                x: row,
                                                y: column
                                            )
                                        )
                }
            }
            
        } // inner-for
        
    } // outer-for
    
    // Determine start and end coordinates.
    let startPoint: Coordinates = Coordinates(x: Int.random(in: 0..<rows), y: Int.random(in: 0..<columns))
    let endGoal: Coordinates = Coordinates(x: Int.random(in: 0..<rows), y: Int.random(in: 0..<columns))

    // Create the cells.
    let startCell: Cell = Cell(type: .Start, coordinates: startPoint)
    let goalCell: Cell = Cell(type: .Goal, coordinates: endGoal)
    
    // Place the start and end cells within the maze.
    maze[startPoint.x][startPoint.y] = startCell
    maze[endGoal.x][endGoal.y] = goalCell

    return Maze(maze: maze, start: startCell, goal: goalCell)
}

/// Convert a 2D array of Cells into a string.
/// - Parameter maze: The array of cells to convert to a string.
/// - Returns: A string representation of a 2D array of cells.
func mazeToString(maze: [[Cell]]) -> String {
    var mazeString: String = ""
    
    for row in maze {
        
        for cell in row {
            mazeString += "\(cell.type.rawValue)"
        }
        
        mazeString += "\n"
    }

    return mazeString
}
