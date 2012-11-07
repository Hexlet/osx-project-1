#import <Foundation/Foundation.h>

#define nucleotides [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil]
#define DNA_LENGTH 100

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;
-(id) init;
-(int) hammingDistance: (Cell *) cell;

@end