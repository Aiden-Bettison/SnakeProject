import Foundation
//import GCD
import Scenes
import Igis


class Snake : RenderableEntity {
    let GameOverText : Text
    var rectangle: Rectangle
    var GameOver = false

 //   var velocityX = 0
 //   var velocityY = 0
    
 
            
        let  strokeStyle = StrokeStyle(color:Color(.green))
        let fillStyle = FillStyle(color:Color(.green))
        let lineWidth = LineWidth(width:2)

/*         func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
        }
        
 */
         
/*    func boundingGrid(canvas: Canvas, rect: Rect, rows: Int, columns: Int) {
        var array = [rect]
        var Rect = rect
        for _ in 0 ..< columns {
            for _ in 0 ..< rows{
            let newRect = Rect
            array.append(newRect)
            Rect.topLeft.y += Rect.size.height
            }
            Rect.topLeft.x += Rect.size.width        
        }
        }
        
 */
                   
    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        GameOverText = Text(location: Point(x: 0, y: 0), text: "GAME OVER")
        GameOverText.font = "60pt Arial"

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Snake")
    }
//             func move(velocityX: Int, velocityY: Int) {
//                 rectangle.rect.topLeft += Point(x: velocityX, y: velocityY)
//         }

    override func calculate(canvasSize: Size) {
        
        GameOverText.location = Point(x: canvasSize.center.x - 200, y: canvasSize.center.y)
  //      move(velocityX: velocityX, velocityY: velocityY)

         
        let boundingRect = Rect(topLeft: Point(x: canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25, height: 25))
        

       /*   repeat {
        delay(bySeconds: 0.15) {        
            self.move(velocityX: self.velocityX, velocityY: self.velocityY)
        }
        }while GameOver == true
        
        */

        let canvasBoundingRect =  Rect(topLeft: Point(x: canvasSize.center.x - 625, y: canvasSize.center.y - 375), size: Size(width: 25 * 50, height: 25 * 30))

        let snakeBoundingRect = rectangle.rect

        let tooFarLeft = snakeBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = snakeBoundingRect.topLeft.x + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = snakeBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = snakeBoundingRect.topLeft.y + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height
        
        if tooFarLeft || tooFarRight {
//            move(to: canvasSize.center)
        //    velocityX = 0
        //    velocityY = 0

            
            GameOver = true

        }

        if tooFarUp || tooFarDown {
      //     move(to: canvasSize.center)
      //      velocityX = 0
      //      velocityY = 0 
        
            
            
            GameOver = true
//            GameOver.location = canvasSize.center            
//            canvas.render(GameOver)
        }
        }
    

    override func render(canvas:Canvas) {
if GameOver == true {
     canvas.render(GameOverText)
}
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    
}
