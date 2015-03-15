#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
                             
}

-(void)update:(CCTime)delta
{
    timeSinceObstacle += delta;
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // add a new obstacle
        [self addObstacle];
        
        // Then reset the timer
        timeSinceObstacle = 0.0f;
        
    }
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
    
}

@end
