/*
An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

At the end, return the modified image.

Input: 
image = [[1,1,1],[1,1,0],[1,0,1]]
sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
*/


//BFS Implementation
func bfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ newColor: Int) {

  typealias pixelPos = (row: Int, column: Int)
  var queue = [pixelPos]()
  queue.append((sr, sc))
  
  while !queue.isEmpty {
    let currentPixelPos = queue.removeFirst()
    
    image[currentPixelPos.row][currentPixelPos.column] = newColor

    //Find Neighboring Pixels of Same Value/Checking If Index Exists

     //Left 
     if currentPixelPos.column - 1 >= 0 {
      let leftPixelPos: (pixelPos) = (currentPixelPos.row, currentPixelPos.column - 1)
      if image[leftPixelPos.row][leftPixelPos.column] == oldColor {
        queue.append(leftPixelPos)
      }
    }
    
    //Right
    if currentPixelPos.column + 1 < image[currentPixelPos.row].count {
      let rightPixelPos: (pixelPos) = (currentPixelPos.row, currentPixelPos.column + 1)
      if image[rightPixelPos.row][rightPixelPos.column] == oldColor {
        queue.append(rightPixelPos)
      }
    }

     //Top 
    if currentPixelPos.row - 1 >= 0 {
      let topPixelPos: (pixelPos) = (currentPixelPos.row - 1, currentPixelPos.column)
      if image[topPixelPos.row][topPixelPos.column] == oldColor {
        queue.append(topPixelPos)
      }
    }

    //Bottom
    if currentPixelPos.row + 1 < image.count {
      let bottomPixelPos: (pixelPos) = (currentPixelPos.row + 1, currentPixelPos.column)
      if image[bottomPixelPos.row][bottomPixelPos.column] == oldColor {
        queue.append(bottomPixelPos)
      }
    }
  }
}


func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {

  let oldColor = image[sr][sc]
  
   //Exit early if the color to replace is same as the new color
  guard oldColor != newColor else {
    return image
  }

  var filledImage = image
  bfs(&filledImage, sr, sc, oldColor, newColor)
  return filledImage
}
