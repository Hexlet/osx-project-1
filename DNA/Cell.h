#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray* dna;

-(int) hammingDistance:(Cell*)otherCell;

@end
