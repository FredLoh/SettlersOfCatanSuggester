//
//  Globals.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 29/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation
import UIKit

public enum TileType {
    case Desert
    case Sheep
    case Clay
    case Wood
    case Stone
    case Wheat
}

struct TileSquare {
    var tileType: TileType?
    var tileColor: UIColor?
    var tileProbability: Int?
}

struct Tile {
    var tileType: TileType?
    var tileProbability: Int?
}

public class Vertex {
    var tile: Tile?
    var neighbors: Array<Edge>
    init() {
        self.neighbors = Array<Edge>()
    }
}

public class Edge {
    var neighbor: Vertex
    var weight: Int
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}

public class SwiftGraph {
        //declare a default directed graph canvas
        private var canvas: Array<Vertex>
        public var isDirected: Bool
        init() {
            canvas = Array<Vertex>()
            isDirected = true
        }
        //create a new vertex
        func addVertex(tile tile: Tile) -> Vertex {
        //set the key
        let childVertex: Vertex = Vertex()
        childVertex.tile = tile
        //add the vertex to the graph canvas
        canvas.append(childVertex)
        return childVertex
        }
        func addEdge(source source: Vertex, neighbor: Vertex, weight: Int) {
            let newEdge = Edge()
            //establish the default properties
            newEdge.neighbor = neighbor
            newEdge.weight = weight
            source.neighbors.append(newEdge)
            //check condition for an undirected graph
            if isDirected == false {
                //create a new reversed edge
                let reverseEdge = Edge()
                //establish the reversed properties
                reverseEdge.neighbor = source
                reverseEdge.weight = weight
                neighbor.neighbors.append(reverseEdge)
            }
        }
}

//add edge to source vertex
var tileViewArray = [TileView]()
let defaultTile = Tile(tileType: nil, tileProbability: nil)
var tilesArray = [TileSquare]()
var pickingColors = true
var typeAndProbTileArray = [Tile]()

