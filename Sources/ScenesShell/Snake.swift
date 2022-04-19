import Foundation
import Scenes
import Igis


class Snake : RenderableEntity {
    let GameOver : Text
    var rectangle: Rectangle

    var velocityX = 0
    var velocityY = 0
    
    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

        let  strokeStyle = StrokeStyle(color:Color(.green))
        let fillStyle = FillStyle(color:Color(.green))
        let lineWidth = LineWidth(width:2)
        
    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        GameOver = Text(location: Point(x: 0, y: 0), text: "GAME OVER")
        GameOver.font = "60pt Arial"

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Snake")
    }

    override func calculate(canvasSize: Size) {
        rectangle.rect.topLeft += Point(x: velocityX, y: velocityY)

        let canvasBoundingRect = Rect(size: canvasSize)

        let snakeBoundingRect = rectangle.rect

        let tooFarLeft = snakeBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = snakeBoundingRect.topLeft.x + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = snakeBoundingRect.topLeft.y < canvasBoundingRect.topLeft.x
        let tooFarDown = snakeBoundingRect.topLeft.y + snakeBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.height
        
        if tooFarLeft || tooFarRight {
            move(to: canvasSize.center)
            velocityX = 0
            velocityY = 0
//            GameOver.location = canvasSize.center
//            canvas.render(GameOver)
        }

        if tooFarUp || tooFarDown {
            move(to: canvasSize.center)
            velocityX = 0
            velocityY = 0
//            GameOver.location = canvasSize.center            
//            canvas.render(GameOver)
        }
    }

    override func render(canvas:Canvas) {

        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }
    }

