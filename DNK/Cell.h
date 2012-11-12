#import <Foundation/Foundation.h>
#define DNA_LENGTH 100

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *cellVariants;

-(NSString *) getVariant;

-(int) hammingDistance: (Cell *) c;

@end