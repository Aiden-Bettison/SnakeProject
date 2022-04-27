import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    
          func renderRectangle(canvas: Canvas, rect: Rect) {
        let rectangle = Rectangle(rect: rect, fillMode: .stroke)
        canvas.render(rectangle)
          }



    func renderRectangleRow(canvas: Canvas, rect:Rect, columns: Int) {
        var currentRect = rect
        for _ in 0 ..< columns {
            
            renderRectangle(canvas: canvas, rect: currentRect)
            currentRect.topLeft.x += currentRect.size.width
        }
    }
    func renderRectangleGrid(canvas: Canvas, rect: Rect, columns: Int, rows: Int) {
        var currentRect = rect
        for _ in 0 ..< rows {

            renderRectangleRow(canvas: canvas, rect: currentRect, columns: columns)
            currentRect.topLeft.y += currentRect.size.height
        }
    }

    func boundingRect(canvas: Canvas, columns: Int, rows: Int){
        if let canvasSize = canvas.canvasSize {
         let BoundingRect = Rect(topLeft: Point(x: canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25 * columns, height: 25 * rows))
        }
    }

    init() {
         // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      
      func clearCanvas(canvas:Canvas) {
          if let canvasSize = canvas.canvasSize {
              let canvasRect = Rect(topLeft:Point(), size:canvasSize)
              let canvasClearRectangle = Rectangle(rect:canvasRect, fillMode:.clear)
              canvas.render(canvasClearRectangle)
          }
      }      




    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize {
            clearCanvas(canvas:canvas)

            let strokeStyle = StrokeStyle(color: Color(.black))
            canvas.render(strokeStyle)

           let rect = Rect(topLeft: Point(x:canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25, height: 25))
          let columns = 50
          let rows = 30
          renderRectangleGrid(canvas: canvas, rect: rect, columns: columns,  rows: rows)
          boundingRect(canvas: canvas, columns: columns, rows: rows)
          renderRectangle(canvas: canvas, rect: boundingRect())
 
          
      }
}
}
