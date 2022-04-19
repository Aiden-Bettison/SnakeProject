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

    let snakes = [Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25)))]

    
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
  //      if snakes[0].velocityX == 0 && snakes[0].velocityY == 0 {
        for snake in 0 ..< snakes.count {
        if key == "ArrowDown" || key == "s" {
            snakes[snake].changeVelocity(velocityX: 0, velocityY: 5)
        }
        else if key == "ArrowUp" || key == "w" {
            snakes[snake].changeVelocity(velocityX: 0, velocityY: -5)
        }
        else if key == "ArrowLeft" || key == "a" {
            snakes[snake].changeVelocity(velocityX: -5, velocityY: 0)
        }
        else if key == "ArrowRight" || key ==  "d" {
            snakes[snake].changeVelocity(velocityX: 5, velocityY: 0)
        }        
        }
        }
        
        
        

//    func onKeyUp(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
//        snake.changeVelocity(velocityX: 0, velocityY: -5)
//        print("\(snake.velocityX), \(snake.velocityY)")
//    }
    
   

    
    
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


//Junk Text Code (For Now) Below:
        else {
            for snake in 1 ..< snakes.count {            
                if key == "ArrowDown" || key == "s" {
                    snakes[0].rectangle.rect.topLeft.y += 25
                    if snakes[snake].velocityX < 0 {
                        snakes[snake].rectangle.rect.topLeft.x -= 25
                    }
                    else if snakes[snake].velocityX > 0 {
                        snakes[snake].rectangle.rect.topLeft.x += 25                    
                    }
                    snakes[0].changeVelocity(velocityX: 0, velocityY: 5)
                }
                else if key == "ArrowUp" || key == "w" {
                    snakes[0].rectangle.rect.topLeft.y -= 25
                    
                    if snakes[snake].velocityX < 0 {
                        snakes[snake].rectangle.rect.topLeft.x -= 25
                    }
                    else if snakes[snake].velocityX > 0 {
                        snakes[snake].rectangle.rect.topLeft.x += 25
                    }
                    snakes[0].changeVelocity(velocityX: 0, velocityY: -5)
                }
                else if key == "ArrowLeft" || key == "a" {
                    snakes[0].rectangle.rect.topLeft.x -= 25
        
                    if snakes[snake].velocityY < 0 {
                        snakes[snake].rectangle.rect.topLeft.y -= 25
                    }
                    else if snakes[snake].velocityY > 0 {
                        snakes[snake].rectangle.rect.topLeft.y += 25
                    }
                    snakes[0].changeVelocity(velocityX: -5, velocityY: 0)
                }
                else if key == "ArrowRight" || key ==  "d" {
                    snakes[0].rectangle.rect.topLeft.x += 25
                    if snakes[snake].velocityY < 0 {
                        snakes[snake].rectangle.rect.topLeft.y -= 25
                    }
                    else if snakes[snake].velocityY > 0 {
                        snakes[snake].rectangle.rect.topLeft.y += 25
                    }
                    snakes[0].changeVelocity(velocityX: 5, velocityY: 0)
                }
            }

          for snake in 1 ..< snakes.count {
              let previousSnake = snakes[snake - 1]

              if snakes[snake].velocityX != previousSnake.velocityX {
                  if snakes[snake].rectangle.rect.topLeft.x == previousSnake.rectangle.rect.topLeft.x {
                      snakes[snake].changeVelocity(velocityX: previousSnake.velocityX, velocityY: previousSnake.velocityY)
                  }
              }
              else if snakes[snake].velocityY != previousSnake.velocityY {
                  if snakes[snake].rectangle.rect.topLeft.y == previousSnake.rectangle.rect.topLeft.y {
                      snakes[snake].changeVelocity(velocityX: previousSnake.velocityX, velocityY: previousSnake.velocityY)
                  }
              }
          }
        }
