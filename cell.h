#import <Foundation/Foundation.h>
#import "nitrobase.h"

extern const int dnaLength;

@interface Cell : NSObject {
  NSMutableArray *dna;
}
  -(int) hammingDistance: (Cell *) otherCell ;
  -(void) initWithRandomDNA ;
  -(void) print ;
@end


