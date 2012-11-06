#import <Foundation/Foundation.h>
#import "nitrobase.h"
#import "cell.h"
#import "shuffle.h"

@interface Cell(Mutate) 
  -(void) mutate: (int) x;
  -(void) initPostitionsArray;
@end

@interface NitroBase(Mutate) 
  -(id) getRandomNitroBaseButNot: (id) currentValue;
@end

