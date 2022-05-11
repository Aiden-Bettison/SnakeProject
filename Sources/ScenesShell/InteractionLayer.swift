import Foundation
import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {


    var snakes = [Snake(rect: Rect(size: Size(width: 25, height:25)))]
    var n = 1
    var head = 0
    var tails = [0]
    var tail = 0
    var size = 0
    var isFacing = "right"
    var isGameOver = false
    var apple = 0
    var score = 0
    
   
   



    

    func gridArray() {
        snakes[0].move(to: Point(x: 324, y: 102))
          //   print(snakes[0].rectangle.rect.topLeft)

        for _ in 0 ..< 30 {
              for _ in 1 ..< 50 {
                  snakes.append(Snake(rect: Rect(size: Size(width: 25, height:25))))
                  snakes[n].move(to: Point(x: snakes[n - 1].rectangle.rect.topLeft.x + 25, y: snakes[n - 1].rectangle.rect.topLeft.y))
//                print(snakes[n].rectangle.rect.topLeft)
                n += 1                  
              }
              if n != 50 * 30 {
              snakes.append(Snake(rect: Rect(size: Size(width: 25, height:25))))
              snakes[n].move(to: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[n - 1].rectangle.rect.topLeft.y + 25))
              //              print(snakes[n].rectangle.rect.topLeft)
              
                  n += 1
              }
        }
        tails.remove(at: 0)
        
          for grid in 0 ..< n {
              snakes[grid].fillStyle = FillStyle(color: Color(.white))  
          }
          for snake in 717 ..< 720 {
              head = 719
              if snake != head {
                  tails.insert(snake, at: 0)
                  size += 1
              }
//              print(tails)
              snakes[snake].fillStyle = FillStyle(color: Color(.green))
              
          }
    }

    func generateApple() {
        apple = Int.random(in: 0 ..< 1500)
        if apple != head && apple != tails[0] && apple != tails[1] {
            snakes[apple].fillStyle = FillStyle(color: Color(.red))
            }
        else {
            apple = Int.random(in: 0 ..< 1500)
            snakes[apple].fillStyle = FillStyle(color: Color(.red))
        }
    }
    
func  onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

       switch key {
       case "ArrowUp":
           if isFacing != "down" {
               isFacing = "up"
           }
           
       case "w":
           if isFacing != "down" {
               isFacing = "up"
           }

       case "ArrowLeft":
           if isFacing != "right" {
               isFacing = "left"
           }

       case "a":
           if isFacing != "right" {
               isFacing = "left"
           }
           
       case "ArrowDown":
           if isFacing != "up" {
               isFacing = "down"
           }

       case "s":
           if isFacing != "up" {
               isFacing = "down"
           }

       case "ArrowRight":
           if isFacing != "left" {
               isFacing = "right"
           }

       case "d":
           if isFacing != "left" {
               isFacing = "right"
           }
    
       default:
           print("Fatal Error: not a direction key.")
       }

       //       return isFacing

       if isGameOver == false {
                           switch isFacing {
       case "up":
               tail = tails.last!
               //snakes[head - 50].rectangle.fillMode = .fillAndStroke
               if head / 50 != 0 {
                   snakes[head - 50].fillStyle = FillStyle(color: Color(.green))
                   head -= 50

               tails.insert((head + 50), at: 0)
               if head != apple {
               snakes[tail].fillStyle = FillStyle(color: Color(.white))
               tails.remove(at: size)
               }
               else{
                   generateApple()
                   size += 1
                   score += 1000
               }
               }
               else {
                   isGameOver = true
               }
                   for tail in 0 ..< tails.count {
                   if head == tails[tail] {
                       isGameOver = true
                   }
               }
          
       case "down":
               tail = tails.last!
               //snakes[head - 50].rectangle.fillMode = .fillAndStroke
               if head / 50 != 29 {
                   snakes[head + 50].fillStyle = FillStyle(color: Color(.green))
                   head += 50
               tails.insert((head - 50), at: 0)

               if head != apple {
               snakes[tail].fillStyle = FillStyle(color: Color(.white))
               tails.remove(at: size)
               }
               else{
                   generateApple()
                   size += 1
                   score += 1000
               }
               }
               else {
                   isGameOver = true
               }
                   for tail in 0 ..< tails.count {
                   if head == tails[tail] {
                       isGameOver = true
                   }
               }
   
          
       case "left":          
           tail = tails.last!
           if head % 50 != 0 {
               snakes[head - 1].fillStyle = FillStyle(color: Color(.green))
               head -= 1
               tails.insert((head + 1), at: 0)
                              
               if head != apple {
               snakes[tail].fillStyle = FillStyle(color: Color(.white))
               tails.remove(at: size)
               }
               else{
                   generateApple()
                   size += 1
                   score += 1000
               }
               }
               else if head % 50 == 0 {
                   isGameOver = true
               }
               for tail in 0 ..< tails.count {
                   if head == tails[tail] {
                       isGameOver = true
                   }
               }
               
       case "right":
                tail = tails.last!
                //        snakes[head + 1].rectangle.fillMode = .fillAndStroke
                if head % 50 != 49 {
                    snakes[head + 1].fillStyle = FillStyle(color: Color(.green))
                    head += 1
               tails.insert(head - 1, at: 0)

               if head != apple {
               snakes[tail].fillStyle = FillStyle(color: Color(.white))
               tails.remove(at: size)
               }
               else{
                   generateApple()
                   size += 1
                   score += 1000
               }
               }
               else {
                   isGameOver = true
               }
               for tail in 0 ..< tails.count {
                   if head == tails[tail] {
                       isGameOver = true
                   }
               }               
               
       default:
           print("Snake is not facing a direction")
                }
       }

              else if isGameOver == true {
           for grid in 0 ..< snakes.count {
               snakes[grid].fillStyle = FillStyle(color: Color(.red))
               }
               print("Score: \(score)")

 
       }
       
       


    }


      
   // func onKeyUp(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
   // }
    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          gridArray()

          for snake in 0 ..< snakes.count { 
              insert(entity: snakes[snake], at: .front)
              
          }
          generateApple()
                // insert(entity: snakes[])
      }

          

     override func preSetup(canvasSize: Size, canvas: Canvas) {
         
          
                    dispatcher.registerKeyDownHandler(handler: self)
    //                dispatcher.registerKeyUpHandler(handler: self)
     }

              

           

     
      
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
    //      dispatcher.unregisterKeyUpHandler(handler: self)
      }
}
