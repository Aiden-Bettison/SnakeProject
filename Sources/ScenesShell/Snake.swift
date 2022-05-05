import Foundation
import Scenes
import Igis

/* struct Snake {

 //   var velocityX = 0
 //   var velocityY = 0
    
   

                   
 
            
        init(head: Coordinate) {
        self.init(head, [], .north)
        /*rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        GameOverText = Text(location: Point(x: 0, y: 0), text: "GAME OVER")
        GameOverText.font = "60pt Arial"
        
         */

        // Using a meaningful name can be helpful for debugging
//        super.init(name: "Snake")
    }

        enum Facing { case north, east, south, west }
        enum Move {case forward, right, left }
        enum Change { case move(Move), grow  }

        let head  : Coordinate

        let tail  : [Coordinate]
        
        var body  : [Coordinate] { [head] + tail }

        let facing : Facing


        func alter(_ change: Change) -> Self {
            func growBody() -> [Coordinate] {
                tail.last != nil ? tail + [tail.last!] : [head + tail]
            }

            switch change {
            case let .move(direction):
                return move (direction)

            case .grow:
                return .init(head, growBody(), facing)

            }
        }

        private init(_h: Coordinate, _ t: [Coordinate], _ f : Facing) {
            head = h; tail = t; facing = f
        }
        private func move(_ m: Move) -> Self {
            func newSnakeBody() -> [Coordinate] {
                Array(([head] + tail).prefix(max(tail.count, 0)))
            }

            switch (m, facing) {
            case (.forward, .north): return .init((x: head.x,   y: head.y - 1), newSnakeBody(), .north)
            case (.forward, .east ): return .init((x:head.x + 1, y:head.y    ), newSnakeBody(), .east )
            case (.forward, .south): return .init((x:head.x,     y:head.y + 1), newSnakeBody(), .south)
            case (.forward, .west ): return .init((x:head.x - 1, y:head.y    ), newSnakeBody(), .west )
            case (   .left, .north): return .init((x:head.x - 1, y:head.y    ), newSnakeBody(), .west )
            case (   .left, .east ): return .init((x:head.x,     y:head.y - 1), newSnakeBody(), .north)
            case (   .left, .south): return .init((x:head.x + 1, y:head.y    ), newSnakeBody(), .east )
            case (   .left, .west ): return .init((x:head.x,     y:head.y + 1), newSnakeBody(), .south)
            case (  .right, .north): return .init((x:head.x + 1, y:head.y    ), newSnakeBody(), .east )
            case (  .right, .east ): return .init((x:head.x,     y:head.y + 1), newSnakeBody(), .south)
            case (  .right, .south): return .init((x:head.x - 1, y:head.y    ), newSnakeBody(), .west )
            case (  .right, .west ): return .init((x:head.x,     y:head.y - 1), newSnakeBody(), .north)
            }
        }

        
 */
        class Snake : RenderableEntity{
    let GameOverText : Text
    var rectangle: Rectangle
    var GameOver = false


    let  strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.green))
        let lineWidth = LineWidth(width:2)

        
            init(rect: Rect) {
 //           let rect = Rect(topLeft: head, size: Size(width: 25, height: 25))
                rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
            GameOverText = Text(location: Point(x: 0, y: 0), text: "GAME OVER")
            GameOverText.font = "60pt Arial"            
            }

            
//             func move(velocityX: Int, velocityY: Int) {
//                 rectangle.rect.topLeft += Point(x: velocityX, y: velocityY)
//         }



    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    


    override func calculate(canvasSize: Size) {
        
        GameOverText.location = Point(x: canvasSize.center.x - 200, y: canvasSize.center.y)
  //      move(velocityX: velocityX, velocityY: velocityY)

         
        let boundingRect = Rect(topLeft: Point(x: canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25, height: 25))
        

        let canvasBoundingRect =  Rect(topLeft: Point(x: canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25 * 50, height: 25 * 30))

        let snakeBoundingRect = rectangle.rect

        let tooFarLeft = snakeBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = snakeBoundingRect.topLeft.x + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = snakeBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = snakeBoundingRect.topLeft.y + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height
        
        if tooFarLeft || tooFarRight {
            GameOver = true

        }

        if tooFarUp || tooFarDown {
            GameOver = true
        }
        }
    

    override func render(canvas:Canvas) {
if GameOver == true {
     canvas.render(GameOverText)
}
canvas.render(strokeStyle, fillStyle,  lineWidth, rectangle)
    }        
        }

                   


            
                      




