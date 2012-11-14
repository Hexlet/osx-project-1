#import <Foundation/Foundation.h>
#import "NSMutableArray (Shuffling).h"

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(id)init;
-(id)insertRandomData;
-(id)getRandomElement;
-(void)print;
-(int)hammingDistance:(Cell *)cellObject;
-(void)mutate:(int)percentage;

@end



