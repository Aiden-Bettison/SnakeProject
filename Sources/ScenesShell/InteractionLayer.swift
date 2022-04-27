import Foundation
import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

   // let snake = Snake(rect: Rect(size: Size(width: 25, height: 25)))
//    let snake = Snake(rect: Rect(size: Size(width: 25, height:25)))
//    let snake2 = Snake(rect: Rect(size: Size(width: 25, height:25)))


    var snakes = [Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25)))]
    

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
      //  for snake in 0 ..< snakes.count {
           var lastKey: String
            if key == "ArrowDown" || key == "s" {
          //  snakes[0].changeVelocity(velocityX: 0, velocityY: 5)
          //  snakes[snake].changeVelocity(velocityX: 5, velocityY: 0)
            lastKey = "ArrowDown"
            if  lastKey == "ArrowDown"{
                remove(entity: snakes[snakes.count])
                snakes.remove(at: snakes.count)
                snakes.insert(Snake(rect: Rect(topLeft: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[0].rectangle.rect.topLeft.y + 25), size: Size(width: 25, height: 25))), at: 0)
                insert(entity: snakes[0], at: .front)
                //(to: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[0].rectangle.rect.topLeft.y + 25))
            }
        }
        else if key == "ArrowUp" || key == "w" {
          //  snakes[0].changeVelocity(velocityX: 0, velocityY: -5)
          //  snakes[snake].changeVelocity(velocityX: 5, velocityY: 0)
            lastKey = "ArrowUp"
            if lastKey == "ArrowUp"{
                //              snakes[snakes.count].move(to: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[0].rectangle.rect.topLeft.y - 25))
                remove(entity: snakes[snakes.count])
                snakes.remove(at: snakes.count)
                snakes.insert(Snake(rect: Rect(topLeft: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[0].rectangle.rect.topLeft.y - 25), size: Size(width: 25, height: 25))), at: 0)
                insert(entity: snakes[0], at: .front)
            }
        }
        else if key == "ArrowLeft" || key == "a" {
         //   snakes[0].changeVelocity(velocityX: -5, velocityY: 0)
         //   snakes[snake].changeVelocity(velocityX: -5, velocityY: 0)
            lastKey = "ArrowLeft"
          if lastKey == "ArrowLeft"{
              //snakes[snakes.count].move(to: Point(x: snakes[0].rectangle.rect.topLeft.x - 25, y: snakes[0].rectangle.rect.topLeft.y))
              remove(entity: snakes[snakes.count])
                snakes.remove(at: snakes.count)
                snakes.insert(Snake(rect: Rect(topLeft: Point(x: snakes[0].rectangle.rect.topLeft.x - 25, y: snakes[0].rectangle.rect.topLeft.y), size: Size(width: 25, height: 25))), at: 0)
                insert(entity: snakes[0], at: .front)
          }
        }
        else if key == "ArrowRight" || key ==  "d" {
         //   snakes[0].changeVelocity(velocityX: 5, velocityY: 0)
         //   snakes[snake].changeVelocity(velocityX: 5, velocityY: 0)
            lastKey = "ArrowRight"
            if lastKey == "ArrowRight"{
                //snakes[snakes.count].move(to: Point(x: snakes[0].rectangle.rect.topLeft.x + 25, y: snakes[0].rectangle.rect.topLeft.y))
                remove(entity: snakes[snakes.count])
                snakes.remove(at: snakes.count)
                snakes.insert(Snake(rect: Rect(topLeft: Point(x: snakes[0].rectangle.rect.topLeft.x + 25, y: snakes[0].rectangle.rect.topLeft.y), size: Size(width: 25, height: 25))), at: 0)
                insert(entity: snakes[0], at: .front)
            }
        }
            }
   

    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
//          insert(entity: snake, at: .front)
//          insert(entity: snake2, at: .front)

          for snake in 0 ..< snakes.count {
              insert(entity: snakes[snake], at: .front)
          }
      }
      override func preSetup(canvasSize: Size, canvas: Canvas) {
//          snake.move(to:Point(x: canvasSize.center.x,  y: canvasSize.center.y))
//          snake2.move(to: Point(x: canvasSize.center.x - 25, y: canvasSize.center.y))

          for snake in 0 ..< 3 {
              snakes[snake].move(to: Point(x: canvasSize.center.x - 25 * snake, y: canvasSize.center.y))
          }

          
          dispatcher.registerKeyDownHandler(handler: self)
   //       dispatcher.registerKeyUpHandler(handler: self)
      }
      
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
    //      dispatcher.unregisterKeyUpHandler(handler: self)
      }
}
