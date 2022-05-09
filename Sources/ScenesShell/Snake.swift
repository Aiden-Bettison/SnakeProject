import Foundation
import Scenes
import Igis


        class Snake : RenderableEntity{
    let GameOverText : Text
    var rectangle: Rectangle
    var GameOver = false


    var strokeStyle : StrokeStyle
    var fillStyle : FillStyle
    var lineWidth = LineWidth(width:2)
 

        
    init(rect: Rect) {
 //           let rect = Rect(topLeft: head, size: Size(width: 25, height: 25))
                rectangle = Rectangle(rect: rect, fillMode: .fillAndStroke)
            GameOverText = Text(location: Point(x: 0, y: 0), text: "GAME OVER")
            GameOverText.font = "60pt Arial"
            strokeStyle = StrokeStyle(color: Color(.black))
            fillStyle = FillStyle(color: Color(.green))

            }

            
//             func move(velocityX: Int, velocityY: Int) {
//                 rectangle.rect.topLeft += Point(x: velocityX, y: velocityY)
//         }



    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    


    override func calculate(canvasSize: Size) {
        
/*        GameOverText.location = Point(x: canvasSize.center.x - 200, y: canvasSize.center.y)
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
            
 */
        }
    

    
    override func render(canvas:Canvas) {
/*if GameOver == true {
     canvas.render(GameOverText)
     }
     
 */
canvas.render(strokeStyle, fillStyle,  lineWidth, rectangle)
    }        
        }

                   


            
                      




